data macro
	mov ax, @data
	mov ds, ax
endm

finish macro	
	mov ax, 4c00h
	int 21h
endm

setGraphicMode macro
	mov ax, 13h
	int 10h
endm

setTextMode macro
	mov ax, 3h
	int 10h
endm

loadBckground macro file
	mov [currentFile], offset file
    mov [pHeight], 200
    mov [pWidth], 320
    mov [leftGap], 0
    mov [topGap], 0*320

	call OpenFile
	call ReadHeader
	call ReadPalette
	call CopyPal
	call CopyBitmap
	call CloseFile
endm

playerStartingPosition_spawnPlayer macro
	mov [x], 155
	mov [y], 80
    mov [newPos], 320*80+155
    mov [oldPos], 320*80+155
	
	call takeSqr
	call anding
    call oring
endm

moveLeft macro
	call retsqr
	sub [newPos], 6d
	sub [x], 6d
	call takeSqr
	call anding
	call oring
endm

moveRight macro
	call retsqr
	add [newPos], 6d
	add [x], 6d
	call takeSqr
	call anding
	call oring
endm

moveUp macro
	call retsqr
	sub [newPos], 6d*320d
	sub [y], 6d
	call takeSqr
	call anding
	call oring
endm

moveDown macro
	call retsqr
	add [newPos], 6d*320d
	add [y], 6d
	call takeSqr
	call anding
	call oring
endm

playerStartingPosition_spawnLetter macro
	mov [xL], 90
	mov [yL], 54
    mov [newPosL], 320*54+90
    mov [oldPosL], 320*54+90
	
	call takeSqrL
	call andingL
    call oringL
endm

playerStartingPosition_spawnGhost macro
	mov [xG], 100
	mov [yG], 100
    mov [newPosG], 320*100+100
    mov [oldPosG], 320*100+100
	
	call takeSqrG
	call andingG
    call oringG
endm

playerRoom2Position_spawnPlayer macro
	mov [x], 0
	mov [y], 56
    mov [newPos], 320*56+0
    mov [oldPos], 320*56+0
	
	call takeSqr
	call anding
    call oring
	mov [whatRoom], 2
endm

playerRoom3Position_spawnPlayer macro
	mov [x], 145
	mov [y], 0
    mov [newPos], 320*0+145
    mov [oldPos], 320*0+145
	
	call takeSqr
	call anding
    call oring
	mov [whatRoom], 3
endm
	
playerRoom4Position_spawnPlayer macro
	mov [x], 23
	mov [y], 12
    mov [newPos], 320*12+23
    mov [oldPos], 320*12+23
	
	call takeSqr
	call anding
    call oring
	mov [whatRoom], 4
endm

playerRoom5Position_spawnPlayer macro
	mov [x], 90
	mov [y], 70
    mov [newPos], 320*70+90
    mov [oldPos], 320*70+90
	
	call takeSqr
	call anding
    call oring
	mov [whatRoom], 5
endm

playerRoomFPosition_spawnPlayer macro
	mov [x], 280
	mov [y], 20
    mov [newPos], 320*20+280
    mov [oldPos], 320*20+280
	
	call takeSqr
	call anding
    call oring
	mov [whatRoom], 6
endm


playerRoom1Position_spawnPlayer macro
	mov [x], 245
	mov [y], 39
    mov [newPos], 320*39+245
    mov [oldPos], 320*39+245
	
	call takeSqr
	call anding
    call oring
	mov [whatRoom], 1
endm

loadLetter macro file
	mov [currentFile], offset file
    mov [pHeight], 8
    mov [pWidth], 10
    mov [leftGap], 0
    mov [topGap], 0*320

	call OpenFile
	call ReadHeader
	call ReadPalette
	call CopyPal
	call CopyBitmap
	call CloseFile
endm

readClock macro
	mov ax, 40h
	mov es, ax
	mov ax, [es:6ch]
endm

timer macro
	readClock
	mov [startTime], dl
	readClock
	mov [endTime], dh
	sub dh, dl
	mov [deltaTime], dh
	mov al, [deltaTime]
	mov ah, [timeOffset]
	cmp al, ah
endm

ghostMovement macro
	cmp [direction], 0
	je left
	jne right
	
	left:
		moveLeftG
		jmp cont
	right:
		moveRightG
	cont:
endm

moveLeftG macro
	call retsqrG
	sub [newPosG], 44d
	sub [xG], 44d
	call takeSqrG
	call andingG
	call oringG
	mov [direction], 1
endm

moveRightG macro
	call retsqrG
	add [newPosG], 44d
	add [xG], 44d
	call takeSqrG
	call andingG
	call oringG
	mov [direction], 0
endm

moveUpG macro
	call retsqrG
	sub [newPosG], 30d*320d
	sub [yG], 30d
	call takeSqrG
	call andingG
	call oringG
	mov [direction], 0
endm

moveDownG macro
	call retsqrG
	add [newPosG], 30d*320d
	add [yG], 30d
	call takeSqrG
	call andingG
	call oringG
	mov [direction], 1
endm

moveLeftG2 macro
	call retsqrG2
	sub [newPosG2], 44d
	sub [xG2], 44d
	call takeSqrG2
	call andingG2
	call oringG2
	mov [direction2], 1
endm

moveRightG2 macro
	call retsqrG2
	add [newPosG2], 44d
	add [xG2], 44d
	call takeSqrG2
	call andingG2
	call oringG2
	mov [direction2], 0
endm

moveUpG2 macro
	call retsqrG2
	sub [newPosG2], 30d*320d
	sub [yG2], 30d
	call takeSqrG2
	call andingG2
	call oringG2
	mov [direction2], 0
endm

moveDownG2 macro
	call retsqrG2
	add [newPosG2], 30d*320d
	add [yG2], 30d
	call takeSqrG2
	call andingG2
	call oringG2
	mov [direction2], 1
endm

moveLeftG2_v2 macro
	call retsqrG2
	sub [newPosG2], 130d
	sub [xG2], 130d
	call takeSqrG2
	call andingG2
	call oringG2
	mov [direction2], 1
endm

moveRightG2_v2 macro
	call retsqrG2
	add [newPosG2], 130d
	add [xG2], 130d
	call takeSqrG2
	call andingG2
	call oringG2
	mov [direction2], 0
endm

moveUpG2_v2 macro
	call retsqrG2
	sub [newPosG2], 30d*320d
	sub [yG2], 30d
	call takeSqrG2
	call andingG2
	call oringG2
	mov [direction2], 0
endm

moveDownG2_v2 macro
	call retsqrG2
	add [newPosG2], 30d*320d
	add [yG2], 30d
	call takeSqrG2
	call andingG2
	call oringG2
	mov [direction2], 1
endm

moveLeftG_v2 macro
	call retsqrG
	sub [newPosG], 32d
	sub [xG], 32d
	call takeSqrG
	call andingG
	call oringG
	mov [direction], 0
endm

moveRightG_v2 macro
	call retsqrG
	add [newPosG], 32d
	add [xG], 32d
	call takeSqrG
	call andingG
	call oringG
	mov [direction], 1
endm

moveUpG_v2 macro
	call retsqrG
	sub [newPosG], 30d*320d
	sub [yG], 30d
	call takeSqrG
	call andingG
	call oringG
	mov [direction], 0
endm

moveDownG_v2 macro
	call retsqrG
	add [newPosG], 30d*320d
	add [yG], 30d
	call takeSqrG
	call andingG
	call oringG
	mov [direction], 1
endm

moveLeftG_v3 macro
	call retsqrG
	sub [newPosG], 16d
	sub [xG], 16d
	call takeSqrG
	call andingG
	call oringG
	mov [direction], 0
endm

moveRightG_v3 macro
	call retsqrG
	add [newPosG], 16d
	add [xG], 16d
	call takeSqrG
	call andingG
	call oringG
	mov [direction], 1
endm

moveUpG_v3 macro
	call retsqrG
	sub [newPosG], 30d*320d
	sub [yG], 30d
	call takeSqrG
	call andingG
	call oringG
	mov [direction], 0
endm

moveDownG_v3 macro
	call retsqrG
	add [newPosG], 30d*320d
	add [yG], 30d
	call takeSqrG
	call andingG
	call oringG
	mov [direction], 1
endm

moveLeftG3 macro
	call retsqrG3
	sub [newPosG3], 32d
	sub [xG3], 32d
	call takeSqrG3
	call andingG3
	call oringG3
	mov [direction3], 0
endm

moveRightG3 macro
	call retsqrG3
	add [newPosG3], 32d
	add [xG3], 32d
	call takeSqrG3
	call andingG3
	call oringG3
	mov [direction3], 1
endm

moveUpG3 macro
	call retsqrG3
	sub [newPosG3], 30d*320d
	sub [yG3], 30d
	call takeSqrG3
	call andingG3
	call oringG3
	mov [direction3], 0
endm

moveDownG3 macro
	call retsqrG3
	add [newPosG3], 30d*320d
	add [yG3], 30d
	call takeSqrG3
	call andingG3
	call oringG3
	mov [direction3], 1
endm

moveLeftG4 macro
	call retsqrG4
	sub [newPosG4], 32d
	sub [xG4], 32d
	call takeSqrG4
	call andingG4
	call oringG4
	mov [direction4], 0
endm

moveRightG4 macro
	call retsqrG4
	add [newPosG4], 32d
	add [xG4], 32d
	call takeSqrG4
	call andingG4
	call oringG4
	mov [direction4], 1
endm

moveUpG4 macro
	call retsqrG4
	sub [newPosG4], 30d*320d
	sub [yG4], 30d
	call takeSqrG4
	call andingG4
	call oringG4
	mov [direction4], 1
endm

moveDownG4 macro
	call retsqrG4
	add [newPosG4], 30d*320d
	add [yG4], 30d
	call takeSqrG4
	call andingG4
	call oringG4
	mov [direction4], 0
endm

ghostMovement2 macro
	cmp [direction], 0
	je left2
	jne right2
	
	left2:
		moveDownG
		jmp cont
	right2:
		moveUpG
	cont2:
endm

playerStartingPosition_spawnGhost_room2_1 macro
	mov [xG], 100
	mov [yG], 80
    mov [newPosG], 320*80+100
    mov [oldPosG], 320*80+100
	
	call takeSqrG
	call andingG
    call oringG
endm

ghostMovement3 macro
	cmp [direction2], 0
	je left3
	jne right3
	
	left3:
		moveDownG2
		jmp cont3
	right3:
		moveUpG2
	cont3:
endm

ghostMovement4 macro
	cmp [direction], 0
	je left4
	jne right4
	
	left4:
		moveRightG_v2
		jmp cont4
	right4:
		moveLeftG_v2
	cont4:
endm

ghostMovement5 macro
	cmp [direction2], 0
	je left5
	jne right5
	
	left5:
		moveDownG2
		jmp cont5
	right5:
		moveUpG2
	cont5:
endm

ghostMovement6 macro
	cmp [direction3], 0
	je left6
	jne right6
	
	left6:
		moveRightG3
		jmp cont6
	right6:
		moveLeftG3
	cont6:
endm

ghostMovement7 macro
	cmp [direction], 0
	je left7
	jne right7
	
	left7:
		moveRightG_v3
		jmp cont7
	right7:
		moveLeftG_v3
	cont7:
endm

ghostMovement8 macro
	cmp [direction2], 0
	je left8
	jne right8
	
	left8:
		moveLeftG2_v2
		jmp cont8
	right8:
		moveRightG2_v2
	cont8:
endm

ghostMovement9 macro
	cmp [direction3], 0
	je left9
	jne right9
	
	left9:
		moveDownG3
		jmp cont9
	right9:
		moveUpG3
	cont9:
endm

ghostMovementA macro
	cmp [direction4], 0
	je leftA
	jne rightA
	
	leftA:
		moveUpG4
		jmp contA
	rightA:
		moveDownG4
	contA:
endm

playerStartingPosition_spawnGhost_room2_2 macro
	mov [xG2], 220
	mov [yG2], 80
    mov [newPosG2], 320*80+220
    mov [oldPosG2], 320*80+220
	
	call takeSqrG2
	call andingG2
    call oringG2
endm

playerStartingPosition_spawnGhost_room3_1 macro
	mov [xG], 140
	mov [yG], 40
    mov [newPosG], 320*40+140
    mov [oldPosG], 320*40+140
	
	call takeSqrG
	call andingG
    call oringG
endm

playerStartingPosition_spawnGhost_room3_2 macro
	mov [xG2], 156
	mov [yG2], 100
    mov [newPosG2], 320*100+156
    mov [oldPosG2], 320*100+156
	
	call takeSqrG2
	call andingG2
    call oringG2
endm

playerStartingPosition_spawnGhost_room3_3 macro
	mov [xG3], 140
	mov [yG3], 160
    mov [newPosG3], 320*160+140
    mov [oldPosG3], 320*160+140
	
	call takeSqrG3
	call andingG3
    call oringG3
endm

playerStartingPosition_spawnGhost_room4_1 macro
	mov [xG], 24
	mov [yG], 40
    mov [newPosG], 320*40+24
    mov [oldPosG], 320*40+24
	
	call takeSqrG
	call andingG
    call oringG
endm

playerStartingPosition_spawnGhost_room4_2 macro
	mov [xG2], 24
	mov [yG2], 90
    mov [newPosG2], 320*90+24
    mov [oldPosG2], 320*90+24
	
	call takeSqrG2
	call andingG2
    call oringG2
endm

playerStartingPosition_spawnGhost_room4_3 macro
	mov [xG3], 85
	mov [yG3], 120
    mov [newPosG3], 320*120+85
    mov [oldPosG3], 320*120+85
	
	call takeSqrG3
	call andingG3
    call oringG3
endm

playerStartingPosition_spawnGhost_room4_4 macro
	mov [xG4], 190
	mov [yG4], 120
    mov [newPosG4], 320*120+190
    mov [oldPosG4], 320*120+190
	
	call takeSqrG4
	call andingG4
    call oringG4
endm