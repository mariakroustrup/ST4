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
//#define FILTER_LENGTH_mavg 19



#define StartMeasuring Measure_When_Low_Write(0);   // Used to start the Timer
#define StopMeasuring Measure_When_Low_Write(1);    // Used to stop the Timer and capture the time spent

int y[2] = {0,0};

//double x_mavg[FILTER_LENGTH_mavg+1] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
//double y_mavg = 0;
//double b_mavg[FILTER_LENGTH_mavg+1] = {0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05};
#define FILTER_LENGTH_mavg 9
//int y[2] = {0,0};
double x_mavg[FILTER_LENGTH_mavg+1] = {0,0,0,0,0,0,0,0,0,0};
double y_mavg = 0;
double b_mavg[FILTER_LENGTH_mavg+1] = {0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1};


//double x_low[FILTER_LENGTH_low+1] = {0, 0, 0};
//double y_low[FILTER_LENGTH_low+1] = {0, 0, 0};
//double b_low[FILTER_LENGTH_low+1] = {0.0201, 0.0402, 0.0201};
//double a_low[FILTER_LENGTH_low+1] = {1.0000, -1.5610, 0.6414};

#define FILTER_LENGTH_low 2
double x_low[FILTER_LENGTH_low+1] = {0, 0, 0};
double y_low[FILTER_LENGTH_low+1] = {0, 0, 0};
double b_low[FILTER_LENGTH_low+1] = {0.0015, 0.0029, 0.0015};
double a_low[FILTER_LENGTH_low+1] = {1.0000, -1.8890, 0.8949};

char current_byte = LOWBYTE;                        // Receive LOW byte first as default
int16 value_in,value_out[2]={0,0},i=0,j=0,oldest,newest,diff,signed_data,old, low_pass_new, avg_new;
uint16 counter = 0, pointer, unsigned_data;  
char FirstCall = TRUE;

signed int floor_and_convert(double y)
{
   if (y > 0)
      return (signed int) (y+0.5);
   else
      return (signed int) (y-0.5);
}

int low_pass_filter(int data)
{
   int i;
   x_low[0] =  (double) data;
   
   y_low[0] = 0;
  
   for(i = 0;i <= FILTER_LENGTH_low;i++)                 // Run IIR filter for each received sample
   {
      y_low[0] += b_low[i]*x_low[i];
   } 
   
   for(i =1;i <= FILTER_LENGTH_low;i++)               // Roll x array in order to hold old sample inputs
   {
      y_low[0] -= a_low[i]*y_low[i];
   }

   for(i = FILTER_LENGTH_low-1;i >= 0;i--)
    {
       x_low[i+1]=x_low[i];
       y_low[i+1]=y_low[i];
    }

    return floor_and_convert(y_low[0]);
}

signed int mavg_filter(signed int data)
{
   x_mavg[0] =  (double) data;      // Read received sample and perform type casts
   
   y_mavg = 0;
   for(i = 0;i <= FILTER_LENGTH_mavg;i++)           // Run FIR filter for each received sample
   {
      y_mavg += b_mavg[i]*x_mavg[i];
   } 
   
   for(i = FILTER_LENGTH_mavg-1;i >= 0;i--)         // Roll x array in order to hold old sample inputs
   {
      x_mavg[i+1] = x_mavg[i];
   }
      
   return (unsigned int) y_mavg;                    // Perform type casts and return sample
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
            value_out[1] = value_out[0];
            //low_pass_new = low_pass_filter(value_in);
            //value_out[0] = low_pass_new;                     // Value_in for at genskabe signalet
            avg_new = mavg_filter(value_in);   
            value_out[0] = avg_new; 
        
        StopMeasuring
        
        
        if ((value_out[0] >= 225) && (value_out[1] < 225))      // Applay simple thresholding
        {
            j = j + 1;
            UART_BLE_UartPutString(itoa(j,str,10));             // Notify BLE_Peripheral
            UART_BLE_UartPutChar(10);    
            UART_BLE_UartPutChar(13);  
        }
       
       
          //UART_UartPutChar(avg_new);
          //UART_UartPutChar(avg_new>>8);
      
        UART_UartPutChar(avg_new);
        UART_UartPutChar(avg_new>>8); 
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

