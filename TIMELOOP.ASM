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
scrkp		 dw 11*19 dup(?)
x 			 dw ?
y			 dw ?
xL			 dw ?
yL			 dw ?
newPosL		 dw 320*100+260
oldPosL		 dw 320*100+260
scrkpL		 dw 6*4 dup(?)

CODESEG
; procs here
include "timeproc.asm"

start:
; code here
	; initialization
	data
	setGraphicMode
	loadBckground room1
	playerStartingPosition_spawnPlayer
	playerStartingPosition_spawnLetter
	
	; movement loop
	WaitForKeyPress:
		mov ah, 7h      
		int 21h       
		cmp al, '`'    
		je checkPoint
		cmp al, 32h
		je goToRoom2CheckPoint
		cmp al, 31h
		je goToRoom1CheckPoint
		cmp al, 0
		jne WaitForKeyPress
		mov ah, 7h
		int 21h 
		cmp al, 4Dh
		je moveright1
		cmp al, 4Bh
		je moveleft1
		 cmp al, 48h
		je moveup1
		cmp al, 50h
		je movedown1
		
		checkPoint:
			jmp exit
				
		moveright1:
			moveRight
			call chCol
			je checkPointRight
			call chDoor
			je DoorPointRight
			jmp WaitForKeyPress
		moveleft1:
			moveLeft
			call chCol
			je failedLeft
			call chDoor
			je DoorPointLeft
			jmp WaitForKeyPress
		moveup1:
			moveUp
			call chCol
			je checkPointUp
			call chDoor
			je DoorPointUp
			jmp WaitForKeyPress
		movedown1:
			moveDown
			call chCol
			je failedDown
			call chDoor
			je DoorPointDown
			jmp WaitForKeyPress
			
		checkPointRight:
			jmp failedRight
		checkPointUp:
			jmp failedUp
		DoorPointRight:
			jmp goToRoom2
		DoorPointLeft:
			jmp goToRoom2
		DoorPointUp:
			jmp goToRoom2
		DoorPointDown:
			jmp goToRoom2
			
		goToRoom2CheckPoint:
			jmp goToRoom2
			
		goToRoom1CheckPoint:
			jmp goToRoom1
			
		failedRight:
			moveLeft
			jmp WaitForKeyPress
		failedLeft:
			moveRight
			jmp WaitForKeyPress
		failedDown:
			moveUp
			jmp WaitForKeyPress
		failedUp:
			moveDown
			jmp WaitForKeyPress
		
	jmp WaitForKeyPress
	
	goToRoom2:
		loadBckground room2
		playerRoom2Position_spawnPlayer
		playerStartingPosition_spawnLetter
		jmp WaitForKeyPress
		
	goToRoom1:
		loadBckground room1
		playerRoom1Position_spawnPlayer
		playerStartingPosition_spawnLetter
		jmp WaitForKeyPress
	
exit:
	setTextMode
	finish
END start