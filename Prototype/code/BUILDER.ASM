; macros here
include TIMEMAC.ASM
jumps
IDEAL
MODEL small
STACK 100h
DATASEG
; variables here
include "timechar.asm"

room1        db 'back1.bmp',0
room2        db 'back2.bmp',0
room3        db 'back3.bmp',0
room4        db 'back4.bmp',0
room5        db 'back5.bmp',0
rommNA       db 'jumpScr.bmp',0
roomFinal    db 'backF.bmp',0
backEnd      db 'END.bmp',0
filehandle   dw ? 
currentFile  dw ? 
Header       db 54 dup (0)
Palette      db 256*4 dup (0)
ScrLine      db 320 dup (0)
ErrorMsg     db 'Error in open file', 13, 10,'$'
pHeight	     dw ?
pWidth       dw ?
leftGap      dw ?  
topGap       dw ?  
oldPos		 dw 320*80+152
newPos		 dw 320*80+152
scrkp		 dw 19*11 dup(?)
x 			 dw ?
y			 dw ?
xL			 dw ?
yL			 dw ?
newPosL		 dw 320*100+260
oldPosL		 dw 320*100+260
scrkpL		 dw 6*4 dup(?)
scrkpG		 dw 8*8 dup(?)
scrkpG2		 dw 8*8 dup(?)
scrkpG3		 dw 8*8 dup(?)
scrkpG4		 dw 8*8 dup(?)
timeOffset   db 9d
deltaTime    db ?
startTime    db ?
endTime      db ?
lastTick     dw ?
xG			 dw ?
yG			 dw ?
newPosG		 dw ?
oldPosG		 dw ?
xG2		     dw ?
yG2		     dw ?
newPosG2	 dw ?
oldPosG2	 dw ?
xG3	         dw ?
yG3	         dw ?
newPosG3	 dw ?
oldPosG3	 dw ?
xG4	         dw ?
yG4	         dw ?
newPosG4	 dw ?
oldPosG4	 dw ?
rate         dw 12
direction    db 0
direction2   db 0
direction3   db 0
direction4   db 0
whatRoom     db 1


CODESEG
; procs here
include "timeproc.asm"

start:
; code here
	include "timeloop.asm"
exit:
	setTextMode
	finish
END start