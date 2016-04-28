# THIS FILE IS AUTOMATICALLY GENERATED
# Project: C:\Users\Linette Helena\Documents\GitHub\ST4\PSoC\mavg_filter_lavpas_filter.cydsn\mavg_filter_lavpas_filter.cyprj
# Date: Thu, 28 Apr 2016 10:39:06 GMT
#set_units -time ns
create_clock -name {UART_BLE_SCBCLK(FFB)} -period 729.16666666666663 -waveform {0 364.583333333333} [list [get_pins {ClockBlock/ff_div_3}]]
create_clock -name {Clock_1(FFB)} -period 1000 -waveform {0 500} [list [get_pins {ClockBlock/ff_div_11}]]
create_clock -name {UART_SCBCLK(FFB)} -period 729.16666666666663 -waveform {0 364.583333333333} [list [get_pins {ClockBlock/ff_div_5}]]
create_clock -name {CyRouted1} -period 20.833333333333332 -waveform {0 10.4166666666667} [list [get_pins {ClockBlock/dsi_in_0}]]
create_clock -name {CyILO} -period 31250 -waveform {0 15625} [list [get_pins {ClockBlock/ilo}]]
create_clock -name {CyLFCLK} -period 31250 -waveform {0 15625} [list [get_pins {ClockBlock/lfclk}]]
create_clock -name {CyIMO} -period 20.833333333333332 -waveform {0 10.4166666666667} [list [get_pins {ClockBlock/imo}]]
create_clock -name {CyHFCLK} -period 20.833333333333332 -waveform {0 10.4166666666667} [list [get_pins {ClockBlock/hfclk}]]
create_clock -name {CySYSCLK} -period 20.833333333333332 -waveform {0 10.4166666666667} [list [get_pins {ClockBlock/sysclk}]]
create_generated_clock -name {UART_BLE_SCBCLK} -source [get_pins {ClockBlock/hfclk}] -edges {1 35 71} [list]
create_generated_clock -name {Clock_1} -source [get_pins {ClockBlock/hfclk}] -edges {1 49 97} [list]
create_generated_clock -name {UART_SCBCLK} -source [get_pins {ClockBlock/hfclk}] -edges {1 35 71} [list]


# Component constraints for C:\Users\Linette Helena\Documents\GitHub\ST4\PSoC\mavg_filter_lavpas_filter.cydsn\TopDesign\TopDesign.cysch
# Project: C:\Users\Linette Helena\Documents\GitHub\ST4\PSoC\mavg_filter_lavpas_filter.cydsn\mavg_filter_lavpas_filter.cyprj
# Date: Thu, 28 Apr 2016 10:39:03 GMT
