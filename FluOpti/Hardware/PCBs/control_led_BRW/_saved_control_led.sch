EESchema Schematic File Version 4
LIBS:control_led-cache
EELAYER 26 0
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
L Transistor_BJT:2N3904 QG1
U 1 1 5BFEECEF
P 3850 3000
F 0 "QG1" H 4041 2954 50  0000 L CNN
F 1 "2N3904" H 4041 3045 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 4050 2925 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/PN/PN2222A.pdf" H 3850 3000 50  0001 L CNN
	1    3850 3000
	0    1    -1   0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5BFEEDED
P 4300 2600
F 0 "R2" V 4500 2600 50  0000 C CNN
F 1 "R" V 4400 2600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4230 2600 50  0001 C CNN
F 3 "~" H 4300 2600 50  0001 C CNN
	1    4300 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5BFEEE50
P 4900 3200
F 0 "R1" H 4970 3246 50  0000 L CNN
F 1 "R" H 4970 3155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4830 3200 50  0001 C CNN
F 3 "~" H 4900 3200 50  0001 C CNN
	1    4900 3200
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x01_Female to(Pi_GND)1
U 1 1 5BFEF0F7
P 2600 2450
F 0 "to(Pi_GND)1" H 2850 2450 50  0000 C CNN
F 1 "Conn_01x01_Female" H 3500 2450 50  0000 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Horizontal" H 2600 2450 50  0001 C CNN
F 3 "~" H 2600 2450 50  0001 C CNN
	1    2600 2450
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Female pi_GPIO_(G+)1
U 1 1 5BFEF168
P 5400 3200
F 0 "pi_GPIO_(G+)1" H 5300 3100 50  0000 L CNN
F 1 "Conn_01x01_Female" H 5300 2950 50  0000 L CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Vertical" H 5400 3200 50  0001 C CNN
F 3 "~" H 5400 3200 50  0001 C CNN
	1    5400 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5C74511A
P 4300 2400
F 0 "R4" V 4100 2400 50  0000 C CNN
F 1 "R" V 4184 2400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4230 2400 50  0001 C CNN
F 3 "~" H 4300 2400 50  0001 C CNN
	1    4300 2400
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Female pi_GPIO_(R+)1
U 1 1 5C746159
P 5150 1600
F 0 "pi_GPIO_(R+)1" H 5150 1500 50  0000 L CNN
F 1 "Conn_01x01_Female" H 5250 1650 50  0000 L CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Vertical" H 5150 1600 50  0001 C CNN
F 3 "~" H 5150 1600 50  0001 C CNN
	1    5150 1600
	1    0    0    1   
$EndComp
Wire Wire Line
	2800 2500 3100 2500
$Comp
L Connector:Conn_01x01_Female to_RG_(+)1
U 1 1 5C74C0C0
P 2600 2800
F 0 "to_RG_(+)1" H 2700 2800 50  0000 L CNN
F 1 "Conn_01x01_Female" H 3150 2800 50  0000 L CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Horizontal" H 2600 2800 50  0001 C CNN
F 3 "~" H 2600 2800 50  0001 C CNN
	1    2600 2800
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_DPDT_x2 SW_R_or_G1
U 1 1 5D5DFC81
P 6100 2500
F 0 "SW_R_or_G1" H 6100 2250 50  0000 C CNN
F 1 "SW_DPDT_x2" H 5750 2350 50  0000 C CNN
F 2 "Fluopi:SW_KNX_2_12,5x11,5_P4" H 6100 2500 50  0001 C CNN
F 3 "" H 6100 2500 50  0001 C CNN
	1    6100 2500
	-1   0    0    1   
$EndComp
$Comp
L Transistor_BJT:2N3904 QR1
U 1 1 5C745034
P 3850 2000
F 0 "QR1" H 4041 1954 50  0000 L CNN
F 1 "2N3904" H 4041 2045 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 4050 1925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3850 2000 50  0001 L CNN
	1    3850 2000
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_DIP_x01 SW_all1
U 1 1 5D5E0A35
P 4550 4300
F 0 "SW_all1" H 4550 4100 50  0000 C CNN
F 1 "SW_DIP_x01" H 4550 4476 50  0000 C CNN
F 2 "Fluopi:Switch_THT_13.0x6.0_P2.56" H 4550 4300 50  0001 C CNN
F 3 "" H 4550 4300 50  0001 C CNN
	1    4550 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4300 4250 4300
$Comp
L Device:R_POT RV_white1
U 1 1 5D5E17AE
P 2800 3650
F 0 "RV_white1" H 2700 3750 50  0000 R CNN
F 1 "R_POT" H 2700 3600 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK163_Single_Horizontal" H 2800 3650 50  0001 C CNN
F 3 "~" H 2800 3650 50  0001 C CNN
	1    2800 3650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2800 3800 3100 3800
Connection ~ 3100 3800
Wire Wire Line
	3100 3800 3100 4300
Wire Wire Line
	2800 3500 2800 2800
$Comp
L Connector:Conn_01x01_Female to_White(+)1
U 1 1 5D5E4E1B
P 2450 3650
F 0 "to_White(+)1" H 2600 3550 50  0000 C CNN
F 1 "Conn_01x01_Female" H 2750 3750 50  0000 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Vertical" H 2450 3650 50  0001 C CNN
F 3 "~" H 2450 3650 50  0001 C CNN
	1    2450 3650
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Female W_light(-)1
U 1 1 5D5E50AF
P 5250 3650
F 0 "W_light(-)1" H 5550 3650 50  0000 C CNN
F 1 "Conn_01x01_Female" H 5500 3550 50  0000 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Vertical" H 5250 3650 50  0001 C CNN
F 3 "~" H 5250 3650 50  0001 C CNN
	1    5250 3650
	1    0    0    -1  
$EndComp
Connection ~ 2800 2800
Wire Wire Line
	2800 2450 2800 2500
Connection ~ 2800 2500
Wire Wire Line
	2800 2500 2800 2550
Wire Wire Line
	4850 4300 5050 4300
Wire Wire Line
	6300 2500 6300 4300
$Comp
L Device:R_Small R5
U 1 1 5D5F55BD
P 4050 3850
F 0 "R5" H 4120 3896 50  0000 L CNN
F 1 "R" H 4120 3805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3980 3850 50  0001 C CNN
F 3 "~" H 4050 3850 50  0001 C CNN
	1    4050 3850
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole MH1
U 1 1 5D641E44
P 2600 1950
F 0 "MH1" H 2700 1996 50  0000 L CNN
F 1 "MountingHole" H 2700 1905 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580_Pad" H 2600 1950 50  0001 C CNN
F 3 "~" H 2600 1950 50  0001 C CNN
	1    2600 1950
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH3
U 1 1 5D641ECA
P 6350 1800
F 0 "MH3" H 6450 1846 50  0000 L CNN
F 1 "MountingHole" H 6450 1755 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580_Pad" H 6350 1800 50  0001 C CNN
F 3 "~" H 6350 1800 50  0001 C CNN
	1    6350 1800
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH2
U 1 1 5D641FA7
P 2800 4650
F 0 "MH2" H 2900 4696 50  0000 L CNN
F 1 "MountingHole" H 2900 4605 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580_Pad" H 2800 4650 50  0001 C CNN
F 3 "~" H 2800 4650 50  0001 C CNN
	1    2800 4650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH4
U 1 1 5D641FFF
P 6500 4650
F 0 "MH4" H 6600 4696 50  0000 L CNN
F 1 "MountingHole" H 6600 4605 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_ISO14580_Pad" H 6500 4650 50  0001 C CNN
F 3 "~" H 6500 4650 50  0001 C CNN
	1    6500 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 2100 3650 2500
Wire Wire Line
	3650 2500 3100 2500
Connection ~ 3650 2500
Wire Wire Line
	3650 2500 3650 2900
Connection ~ 3100 2500
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5D64D37B
P 2600 2650
F 0 "J2" H 3050 2550 50  0000 C CNN
F 1 "to power supply V(-)(+)" H 3200 2650 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2600 2650 50  0001 C CNN
F 3 "~" H 2600 2650 50  0001 C CNN
	1    2600 2650
	-1   0    0    1   
$EndComp
Wire Wire Line
	2800 2650 2800 2800
Wire Wire Line
	5050 3650 5050 4300
Connection ~ 5050 4300
Wire Wire Line
	5050 4300 6300 4300
$Comp
L Device:LED mini_G1
U 1 1 5D65203B
P 4250 3200
F 0 "mini_G1" H 4241 3416 50  0000 C CNN
F 1 "LED" H 4241 3325 50  0000 C CNN
F 2 "LED_THT:LED_D4.0mm" H 4250 3200 50  0001 C CNN
F 3 "~" H 4250 3200 50  0001 C CNN
	1    4250 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3200 3850 3200
$Comp
L Device:LED mini_R1
U 1 1 5D65A1AE
P 4300 1600
F 0 "mini_R1" H 4291 1816 50  0000 C CNN
F 1 "LED" H 4291 1725 50  0000 C CNN
F 2 "LED_THT:LED_D4.0mm" H 4300 1600 50  0001 C CNN
F 3 "~" H 4300 1600 50  0001 C CNN
	1    4300 1600
	1    0    0    -1  
$EndComp
Connection ~ 5050 3650
Wire Wire Line
	3100 2500 3100 3250
Wire Wire Line
	5050 3450 5050 3650
Wire Wire Line
	3450 3250 3100 3250
Connection ~ 3100 3250
Wire Wire Line
	3100 3250 3100 3800
$Comp
L Transistor_BJT:TIP122 QW1
U 1 1 5D5F30C7
P 3650 3550
F 0 "QW1" V 3250 3400 50  0000 L CNN
F 1 "TIP122" V 3150 3300 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 3850 3475 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/PN/PN2222A.pdf" H 3650 3550 50  0001 L CNN
	1    3650 3550
	0    1    -1   0   
$EndComp
Wire Wire Line
	3650 3850 3950 3850
Wire Wire Line
	5050 3450 3850 3450
Wire Wire Line
	3450 3450 3450 3250
Wire Wire Line
	3850 1800 3850 1600
$Comp
L Device:R_Small R3
U 1 1 5C7460C9
P 4700 1600
F 0 "R3" V 4900 1550 50  0000 L CNN
F 1 "R" V 4800 1550 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4630 1600 50  0001 C CNN
F 3 "~" H 4700 1600 50  0001 C CNN
	1    4700 1600
	0    1    -1   0   
$EndComp
Wire Wire Line
	5000 3200 5200 3200
$Comp
L Connector:Conn_01x01_Female pi_GPIO_(W+)1
U 1 1 5D5F41A4
P 4600 3850
F 0 "pi_GPIO_(W+)1" H 4700 3850 50  0000 L CNN
F 1 "Conn_01x01_Female" H 4300 3750 50  0000 L CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Vertical" H 4600 3850 50  0001 C CNN
F 3 "~" H 4600 3850 50  0001 C CNN
	1    4600 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 1600 3850 1600
Wire Wire Line
	4450 1600 4600 1600
Wire Wire Line
	3650 3750 3650 3850
Wire Wire Line
	4150 3850 4400 3850
Wire Wire Line
	4800 3200 4400 3200
Wire Wire Line
	4800 1600 4950 1600
Wire Wire Line
	4200 2400 4100 2400
Wire Wire Line
	5550 2400 5900 2400
Wire Wire Line
	5550 2100 5550 2400
Wire Wire Line
	4050 2900 4100 2900
Wire Wire Line
	5550 2900 5550 2600
Wire Wire Line
	5550 2600 5900 2600
Wire Wire Line
	4200 2600 4100 2600
Wire Wire Line
	4100 2600 4100 2900
Connection ~ 4100 2900
Wire Wire Line
	4100 2900 5550 2900
$Comp
L Connector:Conn_01x02_Female RG_light_(-)1
U 1 1 5D6D88AF
P 4800 2450
F 0 "RG_light_(-)1" H 4827 2426 50  0000 L CNN
F 1 "Conn_01x02_Female" H 4827 2335 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4800 2450 50  0001 C CNN
F 3 "~" H 4800 2450 50  0001 C CNN
	1    4800 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2100 4100 2400
Connection ~ 4100 2100
Wire Wire Line
	4100 2100 5550 2100
Wire Wire Line
	4050 2100 4100 2100
Wire Wire Line
	4400 2400 4600 2400
Wire Wire Line
	4600 2400 4600 2450
Wire Wire Line
	4400 2600 4600 2600
Wire Wire Line
	4600 2600 4600 2550
$EndSCHEMATC
