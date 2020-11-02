EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
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
$Comp
L Connector:Conn_01x08_Female J2
U 1 1 5E1E50F8
P 3300 4700
F 0 "J2" H 3192 5185 50  0000 C CNN
F 1 "Conn_01x08_Female" H 3192 5094 50  0000 C CNN
F 2 "SOMOS:PinHeader_1x08_P2.54mm_Vertical" H 3300 4700 50  0001 C CNN
F 3 "~" H 3300 4700 50  0001 C CNN
	1    3300 4700
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Female J1
U 1 1 5E1E719F
P 3300 3250
F 0 "J1" H 3192 3735 50  0000 C CNN
F 1 "Conn_01x08_Female" H 3192 3644 50  0000 C CNN
F 2 "SOMOS:PinHeader_1x08_P2.54mm_Vertical" H 3300 3250 50  0001 C CNN
F 3 "~" H 3300 3250 50  0001 C CNN
	1    3300 3250
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Female J4
U 1 1 5E1E77A2
P 8050 3250
F 0 "J4" H 8078 3226 50  0000 L CNN
F 1 "Conn_01x08_Female" H 8078 3135 50  0000 L CNN
F 2 "SOMOS:PinHeader_1x08_P2.54mm_Vertical" H 8050 3250 50  0001 C CNN
F 3 "~" H 8050 3250 50  0001 C CNN
	1    8050 3250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Female J3
U 1 1 5E1E7E29
P 8000 4700
F 0 "J3" H 8028 4676 50  0000 L CNN
F 1 "Conn_01x08_Female" H 8028 4585 50  0000 L CNN
F 2 "SOMOS:PinHeader_1x08_P2.54mm_Vertical" H 8000 4700 50  0001 C CNN
F 3 "~" H 8000 4700 50  0001 C CNN
	1    8000 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 2950 3600 2950
Wire Wire Line
	3500 3050 5500 3050
Wire Wire Line
	3500 3150 3850 3150
Wire Wire Line
	3500 3250 5700 3250
Wire Wire Line
	3500 3350 4100 3350
Wire Wire Line
	3500 3450 5950 3450
Wire Wire Line
	3500 3550 4350 3550
Wire Wire Line
	3500 3650 6200 3650
$Comp
L Somos_Library:ElectrodePad U1
U 1 1 5E1F0769
P 3950 1550
F 0 "U1" H 3862 1416 50  0000 R CNN
F 1 "ElectrodePad" H 3862 1507 50  0000 R CNN
F 2 "SOMOS:SOMOS_ELECTRODE" H 3950 1550 50  0001 C CNN
F 3 "" H 3950 1550 50  0001 C CNN
	1    3950 1550
	-1   0    0    1   
$EndComp
$Comp
L Device:Jumper JP1
U 1 1 5E1F1EA9
P 3600 2000
F 0 "JP1" V 3554 2127 50  0000 L CNN
F 1 "Jumper" V 3645 2127 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3600 2000 50  0001 C CNN
F 3 "~" H 3600 2000 50  0001 C CNN
	1    3600 2000
	0    1    1    0   
$EndComp
$Comp
L Device:Jumper JP2
U 1 1 5E1F49E9
P 3850 2000
F 0 "JP2" V 3804 2127 50  0000 L CNN
F 1 "Jumper" V 3895 2127 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3850 2000 50  0001 C CNN
F 3 "~" H 3850 2000 50  0001 C CNN
	1    3850 2000
	0    1    1    0   
$EndComp
$Comp
L Device:Jumper JP3
U 1 1 5E1F4E58
P 4100 2000
F 0 "JP3" V 4054 2127 50  0000 L CNN
F 1 "Jumper" V 4145 2127 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4100 2000 50  0001 C CNN
F 3 "~" H 4100 2000 50  0001 C CNN
	1    4100 2000
	0    1    1    0   
$EndComp
$Comp
L Device:Jumper JP4
U 1 1 5E1F511A
P 4350 2000
F 0 "JP4" V 4304 2127 50  0000 L CNN
F 1 "Jumper" V 4395 2127 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4350 2000 50  0001 C CNN
F 3 "~" H 4350 2000 50  0001 C CNN
	1    4350 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 1700 3850 1700
Connection ~ 3850 1700
Wire Wire Line
	3850 1700 3950 1700
Connection ~ 4100 1700
Wire Wire Line
	4100 1700 4350 1700
Wire Wire Line
	3950 1550 3950 1700
Connection ~ 3950 1700
Wire Wire Line
	3950 1700 4100 1700
Connection ~ 3600 2950
Wire Wire Line
	3600 2950 7850 2950
Wire Wire Line
	3850 3150 3850 2300
Connection ~ 3850 3150
Wire Wire Line
	3850 3150 7850 3150
Wire Wire Line
	4100 3350 4100 2300
Connection ~ 4100 3350
Wire Wire Line
	4100 3350 7850 3350
Connection ~ 4350 3550
Wire Wire Line
	4350 3550 7850 3550
$Comp
L Device:Jumper JP5
U 1 1 5E1F8DB1
P 4600 2000
F 0 "JP5" V 4554 2127 50  0000 L CNN
F 1 "Jumper" V 4645 2127 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4600 2000 50  0001 C CNN
F 3 "~" H 4600 2000 50  0001 C CNN
	1    4600 2000
	0    1    1    0   
$EndComp
$Comp
L Device:Jumper JP6
U 1 1 5E1F9216
P 4850 2000
F 0 "JP6" V 4804 2127 50  0000 L CNN
F 1 "Jumper" V 4895 2127 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4850 2000 50  0001 C CNN
F 3 "~" H 4850 2000 50  0001 C CNN
	1    4850 2000
	0    1    1    0   
$EndComp
$Comp
L Device:Jumper JP7
U 1 1 5E1F9533
P 5100 2000
F 0 "JP7" V 5054 2127 50  0000 L CNN
F 1 "Jumper" V 5145 2127 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5100 2000 50  0001 C CNN
F 3 "~" H 5100 2000 50  0001 C CNN
	1    5100 2000
	0    1    1    0   
$EndComp
$Comp
L Device:Jumper JP8
U 1 1 5E1F985A
P 5300 2000
F 0 "JP8" V 5254 2127 50  0000 L CNN
F 1 "Jumper" V 5345 2127 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5300 2000 50  0001 C CNN
F 3 "~" H 5300 2000 50  0001 C CNN
	1    5300 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 1700 4600 1700
Connection ~ 4350 1700
Connection ~ 4600 1700
Wire Wire Line
	4600 1700 4850 1700
Connection ~ 4850 1700
Wire Wire Line
	4850 1700 5100 1700
Connection ~ 5100 1700
Wire Wire Line
	5100 1700 5300 1700
Wire Wire Line
	3500 4400 4600 4400
Wire Wire Line
	3500 4500 6450 4500
Wire Wire Line
	3500 4600 4850 4600
Wire Wire Line
	3500 4700 6700 4700
Wire Wire Line
	3500 4800 5100 4800
Wire Wire Line
	3500 4900 6950 4900
Wire Wire Line
	3500 5000 5300 5000
Wire Wire Line
	3500 5100 7200 5100
Wire Wire Line
	4600 2300 4600 4400
Connection ~ 4600 4400
Wire Wire Line
	4600 4400 7800 4400
Wire Wire Line
	4850 2300 4850 4600
Connection ~ 4850 4600
Wire Wire Line
	4850 4600 7800 4600
Wire Wire Line
	5100 2300 5100 4800
Connection ~ 5100 4800
Wire Wire Line
	5100 4800 7800 4800
Wire Wire Line
	5300 2300 5300 5000
Connection ~ 5300 5000
Wire Wire Line
	5300 5000 7800 5000
$Comp
L Somos_Library:ElectrodePad U2
U 1 1 5E20931B
P 6300 6500
F 0 "U2" H 6358 6459 50  0000 L CNN
F 1 "ElectrodePad" H 6358 6368 50  0000 L CNN
F 2 "SOMOS:SOMOS_ELECTRODE" H 6300 6500 50  0001 C CNN
F 3 "" H 6300 6500 50  0001 C CNN
	1    6300 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 2300 4350 3550
Wire Wire Line
	3600 2300 3600 2950
$Comp
L Device:Jumper JP16
U 1 1 5E24BC85
P 7200 6050
F 0 "JP16" V 7154 6177 50  0000 L CNN
F 1 "Jumper" V 7245 6177 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 7200 6050 50  0001 C CNN
F 3 "~" H 7200 6050 50  0001 C CNN
	1    7200 6050
	0    -1   -1   0   
$EndComp
$Comp
L Device:Jumper JP15
U 1 1 5E24BC8B
P 6950 6050
F 0 "JP15" V 6904 6177 50  0000 L CNN
F 1 "Jumper" V 6995 6177 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 6950 6050 50  0001 C CNN
F 3 "~" H 6950 6050 50  0001 C CNN
	1    6950 6050
	0    -1   -1   0   
$EndComp
$Comp
L Device:Jumper JP14
U 1 1 5E24BC91
P 6700 6050
F 0 "JP14" V 6654 6177 50  0000 L CNN
F 1 "Jumper" V 6745 6177 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 6700 6050 50  0001 C CNN
F 3 "~" H 6700 6050 50  0001 C CNN
	1    6700 6050
	0    -1   -1   0   
$EndComp
$Comp
L Device:Jumper JP13
U 1 1 5E24BC97
P 6450 6050
F 0 "JP13" V 6404 6177 50  0000 L CNN
F 1 "Jumper" V 6495 6177 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 6450 6050 50  0001 C CNN
F 3 "~" H 6450 6050 50  0001 C CNN
	1    6450 6050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6950 4900 6950 5750
Wire Wire Line
	6700 4700 6700 5750
$Comp
L Device:Jumper JP12
U 1 1 5E24BC9F
P 6200 6050
F 0 "JP12" V 6154 6177 50  0000 L CNN
F 1 "Jumper" V 6245 6177 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 6200 6050 50  0001 C CNN
F 3 "~" H 6200 6050 50  0001 C CNN
	1    6200 6050
	0    -1   -1   0   
$EndComp
$Comp
L Device:Jumper JP11
U 1 1 5E24BCA5
P 5950 6050
F 0 "JP11" V 5904 6177 50  0000 L CNN
F 1 "Jumper" V 5995 6177 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5950 6050 50  0001 C CNN
F 3 "~" H 5950 6050 50  0001 C CNN
	1    5950 6050
	0    -1   -1   0   
$EndComp
$Comp
L Device:Jumper JP10
U 1 1 5E24BCAB
P 5700 6050
F 0 "JP10" V 5654 6177 50  0000 L CNN
F 1 "Jumper" V 5745 6177 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5700 6050 50  0001 C CNN
F 3 "~" H 5700 6050 50  0001 C CNN
	1    5700 6050
	0    -1   -1   0   
$EndComp
$Comp
L Device:Jumper JP9
U 1 1 5E24BCB1
P 5500 6050
F 0 "JP9" V 5454 6177 50  0000 L CNN
F 1 "Jumper" V 5545 6177 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5500 6050 50  0001 C CNN
F 3 "~" H 5500 6050 50  0001 C CNN
	1    5500 6050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6200 5750 6200 3650
Wire Wire Line
	5950 5750 5950 3450
Wire Wire Line
	5700 5750 5700 3250
Wire Wire Line
	5500 5750 5500 3050
Wire Wire Line
	6450 5750 6450 4500
Wire Wire Line
	7200 5750 7200 5100
Wire Wire Line
	5500 6350 5700 6350
Connection ~ 5700 6350
Wire Wire Line
	5700 6350 5950 6350
Connection ~ 5950 6350
Wire Wire Line
	5950 6350 6200 6350
Connection ~ 6200 6350
Wire Wire Line
	6200 6350 6300 6350
Connection ~ 6450 6350
Wire Wire Line
	6450 6350 6700 6350
Connection ~ 6700 6350
Wire Wire Line
	6700 6350 6950 6350
Connection ~ 6950 6350
Wire Wire Line
	6950 6350 7200 6350
Wire Wire Line
	6300 6350 6300 6500
Connection ~ 6300 6350
Wire Wire Line
	6300 6350 6450 6350
Connection ~ 7200 5100
Wire Wire Line
	7200 5100 7800 5100
Connection ~ 6950 4900
Wire Wire Line
	6950 4900 7800 4900
Connection ~ 6700 4700
Wire Wire Line
	6700 4700 7800 4700
Connection ~ 6450 4500
Wire Wire Line
	6450 4500 7800 4500
Connection ~ 6200 3650
Wire Wire Line
	6200 3650 7850 3650
Connection ~ 5950 3450
Wire Wire Line
	5950 3450 7850 3450
Connection ~ 5700 3250
Wire Wire Line
	5700 3250 7850 3250
Connection ~ 5500 3050
Wire Wire Line
	5500 3050 7850 3050
$Comp
L Somos_Library:ElectrodePad U3
U 1 1 5E298AB1
P 9500 1950
F 0 "U3" H 9558 1909 50  0000 L CNN
F 1 "ElectrodePad" H 9558 1818 50  0000 L CNN
F 2 "SOMOS:SOMOS_ELECTRODE" H 9500 1950 50  0001 C CNN
F 3 "" H 9500 1950 50  0001 C CNN
	1    9500 1950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J6
U 1 1 5E29A127
P 9950 1700
F 0 "J6" H 9978 1726 50  0000 L CNN
F 1 "Conn_01x01_Female" H 9978 1635 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 9950 1700 50  0001 C CNN
F 3 "~" H 9950 1700 50  0001 C CNN
	1    9950 1700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J5
U 1 1 5E29AA57
P 9050 1700
F 0 "J5" H 8942 1475 50  0000 C CNN
F 1 "Conn_01x01_Female" H 8942 1566 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 9050 1700 50  0001 C CNN
F 3 "~" H 9050 1700 50  0001 C CNN
	1    9050 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	9500 1950 9250 1700
Wire Wire Line
	9500 1950 9750 1700
Connection ~ 9500 1950
$EndSCHEMATC
