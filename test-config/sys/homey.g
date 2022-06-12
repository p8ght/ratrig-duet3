; homey.g
; called to home the Y axis
;

M400              ; finish current movements
G91               ; relative positioning
G1 H2 Z5 F6000    ; lift Z relative to current position
M913 Y70          ; lower motor current
; G1 H1 Y605 F10000; move quickly to Y axis endstop and stop there (first pass)
; G1 Y10 F6000       ; go back a few mm
G1 H1 Y605 F4000 ; move slowly to Y axis endstop once more (second pass)
M913 Y100         ; return to full motor current
G1 H2 Z-5 F6000   ; lower Z again
G90               ; absolute positioning
