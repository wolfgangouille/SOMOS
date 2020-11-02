EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 11980 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	1850 1900 1550 1900
Wire Wire Line
	1550 1900 1550 2150
Wire Wire Line
	1850 1700 1550 1700
Wire Wire Line
	1550 1700 1550 1900
Connection ~ 1550 1900
Wire Wire Line
	550  1700 550  1800
Wire Wire Line
	2850 1900 3050 1900
Wire Wire Line
	3050 1900 3050 2700
Connection ~ 3050 1900
Wire Wire Line
	3250 1500 3250 1600
Wire Wire Line
	1150 2450 1150 2350
Wire Wire Line
	1850 1100 1450 1100
Wire Wire Line
	1850 1500 1350 1500
Wire Wire Line
	1350 1900 1350 1500
Wire Wire Line
	1150 1700 1150 1900
Wire Wire Line
	1150 1900 1150 1950
Wire Wire Line
	1350 1900 1150 1900
Connection ~ 1150 1900
Wire Wire Line
	2850 1100 3050 1100
Wire Wire Line
	3050 1100 3250 1100
Wire Wire Line
	3250 1100 3450 1100
Wire Wire Line
	3450 1100 3950 1100
Wire Wire Line
	3950 1100 3950 500 
Wire Wire Line
	3950 500  3950 300 
Wire Wire Line
	3250 1200 3250 1100
Wire Wire Line
	4350 1100 3950 1100
Wire Wire Line
	3950 500  4050 500 
Connection ~ 3250 1100
Connection ~ 3950 1100
Connection ~ 3050 1100
Connection ~ 3950 500 
Connection ~ 3450 1100
Wire Wire Line
	1850 1300 1150 1300
Wire Wire Line
	1150 1300 850  1300
Wire Wire Line
	850  1300 550  1300
Wire Wire Line
	550  1300 550  1400
Wire Wire Line
	1050 1100 550  1100
Wire Wire Line
	550  1100 550  1300
Wire Wire Line
	850  1400 850  1300
Wire Wire Line
	550  1100 550  1000
Connection ~ 550  1300
Connection ~ 850  1300
Connection ~ 550  1100
Connection ~ 1150 1300
Wire Wire Line
	3950 2150 3950 1950
Wire Wire Line
	1850 1400 1650 1400
Wire Wire Line
	1650 1400 1600 1400
Connection ~ 1650 1400
Wire Wire Line
	2850 1400 2850 1500
Wire Wire Line
	2850 1500 3050 1500
Connection ~ 3050 1500
Wire Wire Line
	2850 1650 3150 1650
Wire Wire Line
	3150 1650 3150 2000
Wire Wire Line
	3150 2000 3550 2350
Wire Wire Line
	4450 500  4550 500 
$Comp
L Somos_Library:VREG_TPS6103X U1
U 1 1 53ED4284
P 2350 1500
F 0 "U1" H 1950 2400 56  0000 L BNN
F 1 "TPS61090RSAR" H 1950 600 56  0000 L BNN
F 2 "SOMOS:QFN-16-1EP_4x4mm_P0.65mm_EP2.7x2.7mm_ThermalVias" H 2350 1500 50  0001 C CNN
F 3 "" H 2350 1500 50  0001 C CNN
	1    2350 1500
	1    0    0    -1  
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:INDUCTORTDK_VLC5045 L1
U 1 1 AF0E73B6
P 1250 1100
F 0 "L1" H 1250 1200 42  0000 C CNN
F 1 "6.8uH" H 1250 1040 42  0000 C CNN
F 2 "Inductor_SMD:L_Wuerth_WE-PD2-Typ-MS" H 1250 1100 50  0001 C CNN
F 3 "" H 1250 1100 50  0001 C CNN
	1    1250 1100
	1    0    0    -1  
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:CAP_CERAMIC0805-NOOUTLINE C1
U 1 1 D1512118
P 550 1600
F 0 "C1" V 460 1649 50  0000 C CNN
F 1 "10uF" V 640 1649 50  0000 C CNN
F 2 "SOMOS:C_0805_2012Metric" H 550 1600 50  0001 C CNN
F 3 "" H 550 1600 50  0001 C CNN
	1    550  1600
	1    0    0    -1  
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:CAP_CERAMIC0805-NOOUTLINE C2
U 1 1 2A8A4C6F
P 3250 1400
F 0 "C2" V 3160 1449 50  0000 C CNN
F 1 "2.2uF" V 3340 1449 50  0000 C CNN
F 2 "SOMOS:C_0805_2012Metric" H 3250 1400 50  0001 C CNN
F 3 "" H 3250 1400 50  0001 C CNN
	1    3250 1400
	1    0    0    -1  
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:TERMBLOCK_1X2 X1
U 1 1 753049C4
P 4550 1100
F 0 "X1" H 4450 1400 42  0000 L BNN
F 1 "TERM_OUTPUT_1X2" H 4450 900 42  0000 L BNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Horizontal" H 4550 1100 50  0001 C CNN
F 3 "" H 4550 1100 50  0001 C CNN
	1    4550 1100
	1    0    0    1   
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:LED0805_NOOUTLINE LOW1
U 1 1 A5ED7AF3
P 3950 3150
F 0 "LOW1" H 3900 3325 42  0000 C CNN
F 1 "RED" H 3900 3040 42  0000 C CNN
F 2 "SOMOS:LED_0603_1608Metric_Castellated" H 3950 3150 50  0001 C CNN
F 3 "" H 3950 3150 50  0001 C CNN
	1    3950 3150
	0    1    1    0   
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:RESISTOR0805_NOOUTLINE R20
U 1 1 AE2EF260
P 3950 2750
F 0 "R20" H 3950 2850 50  0000 C CNN
F 1 "1K" H 3950 2750 40  0000 C CNB
F 2 "SOMOS:R_0805_2012Metric" H 3950 2750 50  0001 C CNN
F 3 "" H 3950 2750 50  0001 C CNN
	1    3950 2750
	0    -1   -1   0   
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:LED0805_NOOUTLINE ON1
U 1 1 009E9F27
P 4750 500
F 0 "ON1" H 4700 675 42  0000 C CNN
F 1 "BLUE" H 4700 390 42  0000 C CNN
F 2 "SOMOS:LED_0603_1608Metric_Castellated" H 4750 500 50  0001 C CNN
F 3 "" H 4750 500 50  0001 C CNN
	1    4750 500 
	1    0    0    -1  
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:RESISTOR0805_NOOUTLINE R5
U 1 1 0CA4E244
P 4250 500
F 0 "R5" H 4250 600 50  0000 C CNN
F 1 "1K" H 4250 500 40  0000 C CNB
F 2 "SOMOS:R_0805_2012Metric" H 4250 500 50  0001 C CNN
F 3 "" H 4250 500 50  0001 C CNN
	1    4250 500 
	1    0    0    -1  
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:CAP_CERAMIC0805_10MGAP C4
U 1 1 F80B1965
P 850 1600
F 0 "C4" V 760 1649 50  0000 C CNN
F 1 "0.1uF" V 940 1649 50  0000 C CNN
F 2 "SOMOS:C_0805_2012Metric" H 850 1600 50  0001 C CNN
F 3 "" H 850 1600 50  0001 C CNN
	1    850  1600
	1    0    0    -1  
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:RESISTOR0805_NOOUTLINE R3
U 1 1 62D10041
P 3050 1300
F 0 "R3" H 3050 1400 50  0000 C CNN
F 1 "1.87M" H 3050 1300 40  0000 C CNB
F 2 "SOMOS:R_0805_2012Metric" H 3050 1300 50  0001 C CNN
F 3 "" H 3050 1300 50  0001 C CNN
	1    3050 1300
	0    -1   -1   0   
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:RESISTOR0805_NOOUTLINE R4
U 1 1 4C5ADBC4
P 3050 1700
F 0 "R4" H 3050 1800 50  0000 C CNN
F 1 "200K" H 3050 1700 40  0000 C CNB
F 2 "SOMOS:R_0805_2012Metric" H 3050 1700 50  0001 C CNN
F 3 "" H 3050 1700 50  0001 C CNN
	1    3050 1700
	0    -1   -1   0   
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:RESISTOR_0805MP R2
U 1 1 4D35DD08
P 1150 2150
F 0 "R2" H 1150 2250 50  0000 C CNN
F 1 "340K" H 1150 2150 40  0000 C CNB
F 2 "SOMOS:R_0805_2012Metric" H 1150 2150 50  0001 C CNN
F 3 "" H 1150 2150 50  0001 C CNN
	1    1150 2150
	0    -1   -1   0   
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:RESISTOR_0805MP R1
U 1 1 FD69F51F
P 1150 1500
F 0 "R1" H 1150 1600 50  0000 C CNN
F 1 "1.87M" H 1150 1500 40  0000 C CNB
F 2 "SOMOS:R_0805_2012Metric" H 1150 1500 50  0001 C CNN
F 3 "" H 1150 1500 50  0001 C CNN
	1    1150 1500
	0    -1   -1   0   
$EndComp
$Comp
L Somos_Library:-PNP_DRIVER-SC59-BEC T1
U 1 1 AE1B311C
P 3850 2350
F 0 "T1" H 3950 2250 59  0000 L BNN
F 1 "MMUN2133LT1G" H 3450 2550 59  0000 L BNN
F 2 "SOMOS:SOT-23" H 3850 2350 50  0001 C CNN
F 3 "" H 3850 2350 50  0001 C CNN
	1    3850 2350
	1    0    0    -1  
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:C-USC1210 C6
U 1 1 DAF5255C
P 3450 1200
F 0 "C6" H 3490 1225 59  0000 L BNN
F 1 "100uF" H 3490 1035 59  0000 L BNN
F 2 "SOMOS:C_1210_3225Metric" H 3450 1200 50  0001 C CNN
F 3 "" H 3450 1200 50  0001 C CNN
	1    3450 1200
	1    0    0    -1  
$EndComp
Text Notes 950  3600 0    59   ~ 0
Both grounds must be connected on the PCB at only one point close to the GND pin.
Text Notes 6300 2300 0    59   ~ 0
On/Off Switch
Text Notes 500  2200 0    59   ~ 0
See Pg 15\n1st para
Text Notes 950  900  0    59   ~ 0
6.8uH power\nw/2A current
Text Notes 3450 300  0    59   ~ 0
R3 = 1.9Mohm for 5.2V\nR3 = 1.1Mohm for 3.3V
Wire Wire Line
	1850 1050 1850 1100
Connection ~ 1850 1100
Wire Wire Line
	1850 1100 1850 1150
Wire Wire Line
	2850 1050 2850 1100
Connection ~ 2850 1100
Wire Wire Line
	2850 1100 2850 1150
Connection ~ 2850 1150
Wire Wire Line
	2850 1150 2850 1250
Wire Wire Line
	2850 1750 2850 1850
Connection ~ 2850 1850
Wire Wire Line
	2850 1850 2850 1900
Connection ~ 2850 1900
Wire Wire Line
	2850 1900 2850 1950
Connection ~ 2850 1950
Wire Wire Line
	2850 1950 2850 2050
$Comp
L Somos_Library:USBMICRO_20329 CN4
U 1 1 4631AEE1
P 6400 750
F 0 "CN4" H 6000 1090 42  0000 L BNN
F 1 "MicroUSB" H 6000 350 42  0000 L BNN
F 2 "SOMOS:USB_Micro-B_GCT_USB3076-30-A" H 6400 750 50  0001 C CNN
F 3 "" H 6400 750 50  0001 C CNN
	1    6400 750 
	1    0    0    -1  
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:CAP_CERAMIC0805-NOOUTLINE C8
U 1 1 92C1A28E
P 7400 950
F 0 "C8" V 7310 999 50  0000 C CNN
F 1 "10uF" V 7490 999 50  0000 C CNN
F 2 "SOMOS:C_0805_2012Metric" H 7400 950 50  0001 C CNN
F 3 "" H 7400 950 50  0001 C CNN
	1    7400 950 
	1    0    0    -1  
$EndComp
Connection ~ 7400 550 
Wire Wire Line
	6800 550  7400 550 
Wire Wire Line
	7400 550  7400 750 
Wire Wire Line
	7400 550  7400 350 
Wire Wire Line
	7100 950  7100 1250
Wire Wire Line
	6800 950  7100 950 
Wire Wire Line
	7400 1050 7400 1250
Text Notes 10400 3400 0    59   ~ 0
RT1 = TBD, RT2 = TBD
Text Notes 10400 3250 0    59   ~ 0
RT1 = 0, RT2 = 10K
Text Notes 9200 3400 0    59   ~ 0
10K NTC Thermistor:
Text Notes 9520 3250 0    59   ~ 0
No Thermistor:
Text Notes 7750 2550 0    59   ~ 0
2.0K = 500mA
Text Notes 7750 2450 0    59   ~ 0
1.0K = 1000mA
Text Notes 7300 2300 0    59   ~ 0
Charge Rate = 1000V/PROG1
$Comp
L Somos_Library:MCP73871 U2
U 1 1 5940D275
P 10000 1700
F 0 "U2" H 9400 2600 42  0000 L BNN
F 1 "MCP73871" H 9400 800 42  0000 L BNN
F 2 "SOMOS:Texas_S-PVQFN-N20_EP2.4x2.4mm_ThermalVias" H 10000 1700 50  0001 C CNN
F 3 "" H 10000 1700 50  0001 C CNN
	1    10000 1700
	1    0    0    -1  
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:RESISTOR0805_NOOUTLINE THERM1
U 1 1 83B78B28
P 11200 2150
F 0 "THERM1" H 11200 2250 50  0000 C CNN
F 1 "15K" H 11200 2150 40  0000 C CNB
F 2 "SOMOS:R_0805_2012Metric" H 11200 2150 50  0001 C CNN
F 3 "" H 11200 2150 50  0001 C CNN
	1    11200 2150
	0    -1   -1   0   
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:RESISTOR0805_NOOUTLINE R17
U 1 1 18336C03
P 9200 2600
F 0 "R17" H 9200 2700 50  0000 C CNN
F 1 "100K" H 9200 2600 40  0000 C CNB
F 2 "SOMOS:R_0805_2012Metric" H 9200 2600 50  0001 C CNN
F 3 "" H 9200 2600 50  0001 C CNN
	1    9200 2600
	0    -1   -1   0   
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:RESISTOR0805_NOOUTLINE R14
U 1 1 2E6C339E
P 8500 1200
F 0 "R14" H 8500 1300 50  0000 C CNN
F 1 "1K" H 8500 1200 40  0000 C CNB
F 2 "SOMOS:R_0805_2012Metric" H 8500 1200 50  0001 C CNN
F 3 "" H 8500 1200 50  0001 C CNN
	1    8500 1200
	0    -1   -1   0   
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:RESISTOR0805_NOOUTLINE R8
U 1 1 4A1079C4
P 8100 1200
F 0 "R8" H 8100 1300 50  0000 C CNN
F 1 "1K" H 8100 1200 40  0000 C CNB
F 2 "SOMOS:R_0805_2012Metric" H 8100 1200 50  0001 C CNN
F 3 "" H 8100 1200 50  0001 C CNN
	1    8100 1200
	0    -1   -1   0   
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:LED0805_NOOUTLINE CHRG1
U 1 1 C2B5F13D
P 8100 700
F 0 "CHRG1" H 8050 875 42  0000 C CNN
F 1 "ORANGE" H 8050 590 42  0000 C CNN
F 2 "SOMOS:LED_0603_1608Metric_Castellated" H 8100 700 50  0001 C CNN
F 3 "" H 8100 700 50  0001 C CNN
	1    8100 700 
	0    1    1    0   
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:LED0805_NOOUTLINE FULL1
U 1 1 F6409505
P 8500 700
F 0 "FULL1" H 8450 875 42  0000 C CNN
F 1 "GREEN" H 8450 590 42  0000 C CNN
F 2 "SOMOS:LED_0603_1608Metric_Castellated" H 8500 700 50  0001 C CNN
F 3 "" H 8500 700 50  0001 C CNN
	1    8500 700 
	0    1    1    0   
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:GND #GND02
U 1 1 13A376EC
P 8900 1200
F 0 "#GND02" H 8900 1200 50  0001 C CNN
F 1 "GND" H 8800 1100 59  0000 L BNN
F 2 "" H 8900 1200 50  0001 C CNN
F 3 "" H 8900 1200 50  0001 C CNN
	1    8900 1200
	1    0    0    -1  
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:RESISTOR0805_NOOUTLINE R7
U 1 1 AF4BF0A2
P 8900 900
F 0 "R7" H 8900 1000 50  0000 C CNN
F 1 "100K" H 8900 900 40  0000 C CNB
F 2 "SOMOS:R_0805_2012Metric" H 8900 900 50  0001 C CNN
F 3 "" H 8900 900 50  0001 C CNN
	1    8900 900 
	0    1    1    0   
$EndComp
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:RESISTOR0805_NOOUTLINE R6
U 1 1 38927649
P 8900 500
F 0 "R6" H 8900 600 50  0000 C CNN
F 1 "270K" H 8900 500 40  0000 C CNB
F 2 "SOMOS:R_0805_2012Metric" H 8900 500 50  0001 C CNN
F 3 "" H 8900 500 50  0001 C CNN
	1    8900 500 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9300 2400 9200 2400
Wire Wire Line
	8100 800  8100 1000
Wire Wire Line
	8500 800  8500 1000
Connection ~ 10700 1600
Connection ~ 10700 1500
Connection ~ 11500 1600
Wire Wire Line
	10700 1500 10700 1600
Wire Wire Line
	10700 1400 10700 1500
Wire Wire Line
	11500 1400 11500 1600
Wire Wire Line
	11800 1600 11800 1750
Wire Wire Line
	11500 1600 11800 1600
Wire Wire Line
	10700 1600 11500 1600
Wire Wire Line
	11500 1800 11500 1600
Wire Wire Line
	8500 500  8500 250 
Wire Wire Line
	8100 250  8100 500 
Connection ~ 8900 1800
Wire Wire Line
	8800 2000 8800 1800
Wire Wire Line
	8800 2000 9300 2000
Wire Wire Line
	8900 1900 8900 1800
Wire Wire Line
	8900 1900 9300 1900
Wire Wire Line
	9300 1800 8900 1800
Wire Wire Line
	8700 1800 8700 2100
Wire Wire Line
	8700 2100 9300 2100
Wire Wire Line
	8800 1800 8900 1800
Connection ~ 9300 1000
Wire Wire Line
	9300 1000 9300 1100
Wire Wire Line
	9300 800  9300 1000
Wire Wire Line
	10700 1900 11200 1900
Wire Wire Line
	11200 1900 11200 1950
Wire Wire Line
	9300 2300 8900 2300
Wire Wire Line
	8100 1400 8100 1600
Wire Wire Line
	9300 1600 8100 1600
Wire Wire Line
	8500 1400 8500 1500
Wire Wire Line
	9300 1500 8500 1500
Connection ~ 8900 700 
Wire Wire Line
	9300 1200 9200 1200
Wire Wire Line
	9200 700  9200 1200
Wire Wire Line
	8900 700  9200 700 
Connection ~ 10800 1000
Wire Wire Line
	10700 1100 10800 1100
Wire Wire Line
	10800 1000 10700 1000
Wire Wire Line
	10800 1000 10800 1100
Wire Wire Line
	10800 800  10800 1000
Wire Wire Line
	11200 2350 11200 2450
Connection ~ 10800 2300
Wire Wire Line
	10800 2200 10800 2300
Wire Wire Line
	10700 2200 10800 2200
Wire Wire Line
	10700 2300 10800 2300
Wire Wire Line
	10800 2400 10800 2300
Wire Wire Line
	10700 2400 10800 2400
Wire Wire Line
	8900 2700 8900 2850
Wire Wire Line
	11500 2200 11500 2100
Wire Wire Line
	11800 1950 11800 2200
Text GLabel 3950 300  1    50   Input ~ 0
5V
Text GLabel 3050 2700 3    50   Input ~ 0
GND
Text GLabel 3950 3250 3    50   Input ~ 0
GND
Text GLabel 3250 1600 3    50   Input ~ 0
GND
Text GLabel 3450 1600 3    50   Input ~ 0
GND
Text GLabel 4200 1200 0    50   Input ~ 0
GND
Text GLabel 1150 2450 3    50   Input ~ 0
GND
Text GLabel 1550 2150 3    50   Input ~ 0
GND
Text GLabel 550  1800 3    50   Input ~ 0
GND
Text GLabel 850  1800 3    50   Input ~ 0
GND
Wire Wire Line
	850  1700 850  1800
Text GLabel 550  1000 1    50   Input ~ 0
VBAT
Text GLabel 3150 2000 2    50   Input ~ 0
LBO
Text GLabel 5000 500  2    50   Input ~ 0
GND
Wire Wire Line
	5000 500  4850 500 
Wire Wire Line
	1650 1400 1650 1050
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:RESISTOR0805_NOOUTLINE R13
U 1 1 0A65ADC6
P 1650 850
F 0 "R13" H 1650 950 50  0000 C CNN
F 1 "200K" H 1650 850 40  0000 C CNB
F 2 "SOMOS:R_0805_2012Metric" H 1650 850 50  0001 C CNN
F 3 "" H 1650 850 50  0001 C CNN
	1    1650 850 
	0    1    1    0   
$EndComp
Text GLabel 1650 550  1    50   Input ~ 0
VBAT
Wire Wire Line
	1650 650  1650 550 
Text GLabel 1600 1400 0    50   Input ~ 0
ENABLE
Text GLabel 11500 1400 1    50   Input ~ 0
VLIPO
Text GLabel 10800 800  1    50   Input ~ 0
VBAT
Wire Wire Line
	8900 300  8900 250 
Text GLabel 7400 350  1    50   Input ~ 0
VBUS
Text GLabel 8100 250  1    50   Input ~ 0
VBUS
Text GLabel 8500 250  1    50   Input ~ 0
VBUS
Text GLabel 8900 250  1    50   Input ~ 0
VBUS
Text GLabel 9300 800  1    50   Input ~ 0
VBUS
Text GLabel 8700 1800 0    50   Input ~ 0
VBUS
Wire Wire Line
	8800 1800 8700 1800
Connection ~ 8800 1800
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:BATTERY B1
U 1 1 C25A42D2
P 11800 1850
F 0 "B1" H 11700 1975 42  0000 L BNN
F 1 "JST 2-PH" H 11650 1700 42  0000 L BNN
F 2 "SOMOS:JST_PH_S2B-PH-SM4-TB_1x02-1MP_P2.00mm_Horizontal" H 11800 1850 50  0001 C CNN
F 3 "" H 11800 1850 50  0001 C CNN
	1    11800 1850
	0    -1   -1   0   
$EndComp
Text GLabel 11200 2450 3    50   Input ~ 0
GND
Text GLabel 11500 2200 3    50   Input ~ 0
GND
Text GLabel 11800 2200 3    50   Input ~ 0
GND
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:RESISTOR0805_NOOUTLINE R16
U 1 1 D0D0350C
P 8900 2500
F 0 "R16" H 8900 2600 50  0000 C CNN
F 1 "1.0K" H 8900 2500 40  0000 C CNB
F 2 "SOMOS:R_0805_2012Metric" H 8900 2500 50  0001 C CNN
F 3 "" H 8900 2500 50  0001 C CNN
	1    8900 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9200 2800 9200 2850
Text GLabel 9200 2850 3    50   Input ~ 0
GND
Text GLabel 8900 2850 3    50   Input ~ 0
GND
Text GLabel 10900 2350 3    50   Input ~ 0
GND
Wire Wire Line
	10800 2300 10900 2300
Wire Wire Line
	10900 2300 10900 2350
$Comp
L SHIELD_MIMAS_TFT_BT_POWERSUPPLY-eagle-import:CAP_CERAMIC0805-NOOUTLINE C7
U 1 1 493D4CA5
P 11500 2000
F 0 "C7" V 11410 2049 50  0000 C CNN
F 1 "10uF" V 11590 2049 50  0000 C CNN
F 2 "SOMOS:C_0805_2012Metric" H 11500 2000 50  0001 C CNN
F 3 "" H 11500 2000 50  0001 C CNN
	1    11500 2000
	1    0    0    -1  
$EndComp
Text GLabel 7100 1250 3    50   Input ~ 0
GND
Text GLabel 7400 1250 3    50   Input ~ 0
GND
Wire Wire Line
	4200 1200 4350 1200
Wire Wire Line
	3450 1400 3450 1600
Text GLabel 3950 1950 1    50   Input ~ 0
VBAT
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 5EE1FC47
P 6450 2550
F 0 "J1" H 6478 2576 50  0000 L CNN
F 1 "Conn_01x03_Female" H 6478 2485 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6450 2550 50  0001 C CNN
F 3 "~" H 6450 2550 50  0001 C CNN
	1    6450 2550
	1    0    0    -1  
$EndComp
Text GLabel 6150 2550 0    50   Input ~ 0
ENABLE
Text GLabel 6150 2650 0    50   Input ~ 0
GND
Text GLabel 6150 2450 0    50   Input ~ 0
VBAT
Wire Wire Line
	6150 2450 6250 2450
Wire Wire Line
	6150 2550 6250 2550
Wire Wire Line
	6150 2650 6250 2650
$EndSCHEMATC