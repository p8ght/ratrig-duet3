; Configuration file for Duet 3 (firmware version 3.3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.3.5 on Tue Oct 26 2021 20:15:19 GMT+0200 (Mitteleuropäische Sommerzeit)

; General preferences
M575 P1 S1 B57600                                               ; enable support for PanelDue
G90                                                             ; send absolute coordinates...
M83                                                             ; ...but relative extruder moves
M550 P"Duet3"                                                  ; set printer name
M669 K1 X1:1:0:0 Y-1:1:0:0                                      ; select CoreXY mode & define corexy-matrix

; Drives
M569 P0.1 S0 D3                                                 ; Y stepper 0.0 goes forwards
M569 P0.2 S1 D3                                                 ; X stepper 0.1 goes forwards
M569 P0.3 S0                                                    ; Z1 stepper 0.2 goes forwards
M569 P0.4 S0                                                    ; Z2 stepper 0.3 goes forwards
M569 P0.5 S0                                                    ; Z3 stepper 0.4 goes forwards
M569 P0.0 S1                                                    ; T1 E stepper 121.0 goes forwards
M584 Y0.1 X0.2 Z0.3:0.4:0.5 E0.0                                ; set drive mapping
M350 X16 Y16 Z16 E16 I1                                         ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z800.00 E680                                  ; set steps per mm
M566 X1200.00 Y1200.00 Z300.00 E400.00                          ; set maximum instantaneous speed changes (mm/min)
M203 X18000.00 Y18000.00 Z1500.00 E4000.00                      ; set maximum speeds (mm/min)
M201 X800.00 Y800.00 Z500.00 E250.00                            ; set accelerations (mm/s^2)
M906 X2200 Y2200 Z2100 E900 I30                                 ; set peak motor currents (mA) and motor idle factor in percent - Orbiter max 1A | XYZ-Stpper max 2.5A (divide by 1,414 to get RMS-current)
M84 S30                                                         ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                                                ; set axis minima
M208 X400 Y410 Z400 S0                                          ; set axis maxima

; Endstops
; M574 X1 S1 P"io0.in"                                          ; configure switch-type (e.g. microswitch) endstop for low end on X via pin io0.in
; M574 Y1 S1 P"io1.in"                                          ; configure switch-type (e.g. microswitch) endstop for low end on Y via pin io1.in
M574 X2 S3                                                      ; configure high-x-endstop - sensorless
M574 Y2 S3                                                      ; configure high-y-endstop - sensorless
M574 Z1 S2                                                      ; configure Z-probe endstop for low end on Z

M671 X400:47:51 Y170:0:345 S5                                   ; define positions of Z leadscrews or bed levelling screws
M557 X20:360 Y20:360 P5                                         ; define 5x5 mesh grid

; sensorless homing - sensitivity: 3
M915 X Y F0 S3

; Z-Probe
M950 S0 C"io7.out"                                              ; create servo pin 0 for BLTouch
M558 P9 C"io7.in" H5 F120 T6000                                 ; set Z probe type to bltouch and the dive height + speeds
G31 P500 X0 Y0 Z1.1                                               ; set Z probe trigger value, offset and trigger height
M557 X60:340 Y60:340 S20                                        ; define mesh grid

M206 X0 Y0                                                      ; set home offset

; Filament runout-sensor E0
M591 C"io2.in" D0 P2 S1                                         ; E0 | P2: filament present = low | S1 = active filament monitoring

; Heaters
M308 S0 P"temp0" Y"thermistor" T100000 B4138                    ; configure sensor 0 as thermistor on pin temp0
M950 H0 C"out1" T0                                              ; create bed heater output on out1 and map it to sensor 0
M307 H0 B0 R0.537 C537.9 D2.16 S1.00 V24.2                      ; disable bang-bang mode for the bed heater and set PWM limit -- calibrated
M140 H0                                                         ; map heated bed to heater 0
M143 H0 S150                                                    ; set temperature limit for heater 0 to 150C
M308 S1 P"temp1" Y"thermistor" T100000 B4667 C1.038283e-7 H0 L0 ;configure sensor 1 as thermistor on pin temp1
M950 H1 C"out2" T1                                              ; create nozzle heater output on out2 and map it to sensor 1
M307 H1 B0 R3.230 C184.6:135.6 D8.29 S1.00 V24.1                ; disable bang-bang mode for heater  and set PWM limit -- calibrated
M143 H1 S460                                                    ; set temperature limit for heater 1 to 460C

; Fans
M950 F0 C"out7" Q500                                            ; create fan 0 on pin out4 and set its frequency
M106 P0 C"PRT-FAN" S0 H-1                                       ; set fan 0 name and value. Thermostatic control is turned off
M950 F1 C"out8" Q500                                            ; create fan 1 on pin out5 and set its frequency
M106 P1 C"TF1" S1 H1 T45                                        ; set fan 1 name and value. Thermostatic control is turned on

; Tools
M563 P0 S"T1" D0 H1 F0                                          ; define tool 0
G10 P0 X0 Y0 Z0                                                 ; set tool 0 axis offsets
G10 P0 R0 S0                                                    ; set initial tool 0 active and standby temperatures to 0C


; custom I/O definitions
;M950 P0 C"out3"                                                ; define IO-0 on pin out3(HeatOut 3) for LED  - if enabled -> crtouch stops working .. M401


; Miscellaneous
M501                                                            ; load saved parameters from non-volatile memory
M911 S10 R11 P"M913 X0 Y0 C0 G91 M83 G1 Z3 E-5 F1000"           ; set voltage thresholds and actions to run on power loss
