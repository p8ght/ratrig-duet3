; tpre0.g
; called before tool 0 is selected

; unlock coupler
; M98 P"/macros/coupler-unlock"

; move to T0 location
; G1 X10 Y10 F50000

; move in
; G1 X10 Y15 F50000

; collect tool
; G1 X10 Y20 F2500

; lock coupler
; M98 P"/macros/coupler-lock"

; lower bed before moving to the print-area
; G91
; G1 Z10 F1000
; G90

; move out
; G1 X10 Y10 F4000