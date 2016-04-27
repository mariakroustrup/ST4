/* ========================================
 *
 * UART echo with interrupt
 *
 * ========================================
*/
#include <project.h>
#include <stdlib.h>
#define LOWBYTE 0                                   // Used to toggle between HIGH byte and LOW byte
#define HIGHBYTE 1                                  // Used to toggle between HIGH byte and LOW byte
#define FALSE 0
#define TRUE 1
#define LENGTH 5

#define ARRAY_SIZE 3
#define FILTER_LENGTH 32
#define FILTER_LENGTH2 30

#define StartMeasuring Measure_When_Low_Write(0);   // Used to start the Timer
#define StopMeasuring Measure_When_Low_Write(1);    // Used to stop the Timer and capture the time spent
//#define TRANSMIT_TIME
//#define ALGO2

int x[FILTER_LENGTH+1] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int y[2] = {0,0};

//double b[FILTER_LENGTH+1] = {0.991824212000533,  -3.967296848002132,   5.950945272003199, -3.967296848002132,   0.991824212000533};
//double a[FILTER_LENGTH+1] = {1.000000000000000,  -3.983581258658521,   5.950878429266698, -3.951012436572832,   0.983715267510479};

int b[FILTER_LENGTH+1] = {-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, -32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1};
int a[2] = {1 -1};

double x3[FILTER_LENGTH2+1] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
double y3 = 0;
double b3[FILTER_LENGTH2+1] = {0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03};

char current_byte = LOWBYTE;                        // Receive LOW byte first as default
int16 value_in,value_out[2]={0,0},i=0,j=0,oldest,newest,diff,signed_data,old;
int16 data_array[LENGTH] = {0};
uint16 counter = 0, pointer, squared,moving_sum,unsigned_data,avg_new;                                     // Variable for captured time
char FirstCall = TRUE;

signed int floor_and_convert(double y)
{
   if (y > 0)
      return (signed int) (y+0.5);
   else
      return (signed int) (y-0.5);
}


signed int high_pass_filter(int data)
{
   x[0] = data;          // Read received sample and perform type casts
   
   y[0] = b[0]*x[0];
   
   for(i = 1;i <= FILTER_LENGTH;i++)                 // Run IIR filter for each received sample
   {
      y[0] += b[i]*x[i];
   } 
   y[0] -= a[1]*y[1];
   
   
   for(i = FILTER_LENGTH-1;i >= 0;i--)               // Roll x array in order to hold old sample inputs
   {
      x[i+1] = x[i];
   }
   y[0] = (y[0]>>5);

   y[1] = y[0];
   
   return (y[0]);                   // Perform type casts and return sample
}

signed int differentiator(signed int new)
{
   diff = (new - old);
   old = new;
   return diff;
}


unsigned int square(signed int data)
{
   return data*data;
}

unsigned int mavg_filter(unsigned int data)
{
   x3[0] =  (double) data;      // Read received sample and perform type casts
   
   y3 = 0;
   for(i = 0;i <= FILTER_LENGTH2;i++)           // Run FIR filter for each received sample
   {
      y3 += b3[i]*x3[i];
   } 
   
   for(i = FILTER_LENGTH2-1;i >= 0;i--)         // Roll x array in order to hold old sample inputs
   {
      x3[i+1] = x3[i];
   }
      
   return (unsigned int) y3;                    // Perform type casts and return sample
}

CY_ISR(RX_interrupt)
{
    char str[4];
    uint8 ch = UART_UartGetChar();
    UART_ClearRxInterruptSource(UART_GetRxInterruptSource());
    
    if(current_byte == LOWBYTE)                     // Receive LOW byte first
    {
        
        
        value_in = ch;                                 // Save UCA0RXBUF in the LOW byte of "value"
        current_byte = HIGHBYTE;                    // Prepare to receive HIGH byte on next interrupt
        return;                                     // Return from interrupt
    }
    if(current_byte == HIGHBYTE)                    // Recieve HIGH byte
    {
        
        value_in += (ch<<8);                           // Save UCA0RXBUF in the HIGH byte of "value"
        current_byte = LOWBYTE;                     // Prepare to receive LOW byte on next interrupt
                
        StartMeasuring
        #ifdef ALGO2
        data_array[pointer] = value_in;
        pointer += 1;
        if (pointer == LENGTH)
        {
            pointer = 0;
            oldest = 0;
            newest = LENGTH-1;
            FirstCall = FALSE;
        }
        else
        {
            oldest = pointer;
            newest = pointer - 1;
        }
        if (FirstCall)
        {
            diff = 0;
        }
        else      
        {
            diff = (signed int) (data_array[newest] - data_array[oldest])>>3;
        }
        squared = diff*diff;
        
        moving_sum = moving_sum + (squared>>4) - (moving_sum>>3);
        
        value_out[1] = value_out[0];
        value_out[0] = moving_sum;
        #else
           // signed_data = high_pass_filter(value_in);           // Applay High Pass filter on raw data
            //signed_data = differentiator(signed_data);          // Applay differentiator
            //unsigned_data = square(signed_data/2);              // Applay square function
            //avg_new = mavg_filter(unsigned_data);               // Applay moving average function
            
            value_out[1] = value_out[0];
            value_out[0] = value_in;
        #endif
        StopMeasuring
        
        
        if ((value_out[0] >= 225) && (value_out[1] < 225))      // Applay simple thresholding
        {
            j = j + 1;
            UART_BLE_UartPutString(itoa(j,str,10));             // Notify BLE_Peripheral
            UART_BLE_UartPutChar(10);    
            UART_BLE_UartPutChar(13);  
        }
        
        #ifdef TRANSMIT_TIME
        UART_UartPutChar(counter);                    // Send back lowbyte of value
        UART_UartPutChar((counter>>8));               // Send back highbyte of value
        #else
        UART_UartPutChar(value_out[0]);
        UART_UartPutChar(value_out[0]>>8);
        #endif
        
    
    }
}

CY_ISR(BLE_RX_interrupt)
{
    uint8 ch = UART_BLE_UartGetChar();
    UART_BLE_ClearRxInterruptSource(UART_BLE_GetRxInterruptSource());
    UART_UartPutChar(ch);
}

CY_ISR(Timer_interrupt)
{
    counter = Timer_ReadCapture();   
}


int main()
{
 
    CyGlobalIntEnable;                          /* Enable global interrupts */
    Timer_ISR_StartEx(Timer_interrupt);         /* Set interrupt address */
    UART_RX_ISR_StartEx(RX_interrupt);          /* Set interrupt address */
    UART_BLE_RX_ISR_StartEx(BLE_RX_interrupt);  /* Set interrupt address */
    UART_Start();                               /* Start UART */
    UART_BLE_Start();                           /* Start UART_BLE */
    Timer_Start();                              /* Start Timer */
    Timer_ISR_Enable();                         /* Enable Timer interrupt service routine*/
    CySysPmSleep();                             /* Enter Sleep mode */
    return 0;
}

