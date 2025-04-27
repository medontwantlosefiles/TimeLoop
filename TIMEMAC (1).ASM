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
	sub [newPos], 10d
	sub [x], 10d
	call takeSqr
	call anding
	call oring
endm

moveRight macro
	call retsqr
	add [newPos], 10d
	add [x], 10d
	call takeSqr
	call anding
	call oring
endm

moveUp macro
	call retsqr
	sub [newPos], 10d*320d
	sub [y], 10d
	call takeSqr
	call anding
	call oring
endm

moveDown macro
	call retsqr
	add [newPos], 10d*320d
	add [y], 10d
	call takeSqr
	call anding
	call oring
endm

playerStartingPosition_spawnLetter macro
	mov [xL], 260
	mov [yL], 100
    mov [newPosL], 320*100+260
    mov [oldPosL], 320*100+100
	
	call takeSqrL
	call andingL
    call oringL
endm

playerRoom2Position_spawnPlayer macro
	mov [x], 0
	mov [y], 56
    mov [newPos], 320*56+0
    mov [oldPos], 320*56+0
	
	call takeSqr
	call anding
    call oring
endm

playerRoom1Position_spawnPlayer macro
	mov [x], 245
	mov [y], 39
    mov [newPos], 320*39+245
    mov [oldPos], 320*39+245
	
	call takeSqr
	call anding
    call oring
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