; tfree0.g
; called when tool 0 is freed

; lower the bed
; G91
; G1 Z4 F1000
; G90

; move to T0 location
; G1 X10 Y10 F50000

; move in
; G1 X10 Y15 F50000


; unlock coupler & automatically push tool to its origin-location
; M98 P"/macros/coupler-unlock"

; move out
; G1 X10 Y10 F4000