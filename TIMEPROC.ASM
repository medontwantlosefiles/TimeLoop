proc anding
	push ax es di si cx
	
	mov ax, 0A000h
	mov es, ax
	mov di, [newPos]
	mov si, offset msk
	mov cx, 19
	and1:
		push cx
		mov cx, 11
		xx:
			lodsb
			and [es:di], al
			inc di
		loop xx
		add di, 320
		sub di, 11
		pop cx
	loop and1
	
pop cx si di es ax
ret
endp anding

proc oring
	push ax es di si cx bx
	
	mov ax, 0A000h
	mov es, ax
	mov di, [newPos]
	mov si, offset player
	mov cx, 19
	or1:
		push cx
		mov cx, 11
		yy:
			lodsb
			or [es:di], al
			inc di
		loop yy
		add di, 320
		sub di, 11
		pop cx
	loop or1
	
pop bx cx si di es ax
ret
endp oring

proc OpenFile
	push ax dx
	
	mov ah, 3Dh
	xor al, al
	mov dx, [currentFile]
	int 21h
	jc openerror
	mov [filehandle], ax
	pop dx ax
ret
	openerror:
		mov dx, offset ErrorMsg
		mov ah, 9h
		int 21h
		mov ax, 4c00h
		int 21h
		
pop dx ax
ret
endp OpenFile

proc ReadHeader
    push ax bx cx dx
	  
    mov ah,3fh
    mov bx, [filehandle]
    mov cx, 54
    mov dx, offset Header
    int 21h
	
pop dx cx bx ax
ret
endp ReadHeader

proc ReadPalette
    push ax bx cx dx
	
    mov ah,3fh
    mov bx, [filehandle]
    mov cx, 400h 
    mov dx, offset Palette
    int 21h
	
pop dx cx bx ax
ret
endp ReadPalette

proc takeSqr
    push es ax si di cx

    mov ax, 0A000h
    mov es, ax
    mov di, [newPos]
    mov si, offset scrkp
    mov cx, 19
	takeLine:
		push cx
		mov cx, 11
		takecol:
			mov al, [es:di]
			mov [si], al
			inc si
			inc di
		loop takecol
		add di, 320
		sub di, 11
		pop cx
	loop takeLine

pop cx di si ax es
ret
endp takeSqr

proc retSqr
	push es ax si di cx

	mov ax, 0A000h
	mov es, ax
	mov di, [newPos]
	mov si, offset scrkp
	mov cx, 19

	retLine:
		push cx
		mov cx, 11

		retcol:
			mov al, [si]
			mov [es:di], al
			inc si
			inc di
		loop retcol

		add di,320
		sub di, 11
	pop cx
	loop retLine

pop cx di si ax es
ret
endp retSqr

proc CopyPal
	push ax cx dx si
	mov si,offset Palette 
	mov cx,256 
	mov dx,3C8h
	mov al,0 
	
	out dx,al
	inc dx 
	PalLoop:
		mov al,[si+2]
		shr al,2
		out dx,al
		mov al,[si+1]
		shr al,2
		out dx,al
		mov al,[si]
		shr al,2
		out dx,al
		add si,4
	loop PalLoop
	
pop si dx cx ax
ret
endp CopyPal

proc CopyBitmap
	push ax bx cx dx di es
	mov ax, 0A000h
	mov es, ax
	mov bx, [filehandle]
	mov cx,[pHeight] 
	PrintBMPLoop:
		push cx
		
		mov di,cx 
		shl cx, 6 
		shl di, 8 
		add di, cx
		add di,[leftGap]
		add di,[topGap]
		mov ah,3fh
		mov cx,[pWidth]
		mov dx,offset ScrLine
		int 21h 

		cld
		
		mov cx,320
		mov si,offset ScrLine
		rep movsb
		
	pop cx
	loop PrintBMPLoop
pop es di dx cx bx ax
ret
endp CopyBitmap

proc CloseFile
    push ax bx 
	mov ah,3Eh
	mov bx, [filehandle]
	int 21h
	
pop bx ax
ret
endp CloseFile

proc chCol
	mov ah, 0dh
	mov cx, [x]
	mov dx, [y]
	int 10h
	
	cmp al, 00h
ret
endp chCol

proc takeSqrL
    push es ax si di cx

    mov ax, 0A000h
    mov es, ax
    mov di, [newPosL]
    mov si, offset scrkpL
    mov cx, 4
	takeLineL:
		push cx
		mov cx, 6
		takecolL:
			mov al, [es:di]
			mov [si], al
			inc si
			inc di
		loop takecolL
		add di, 320
		sub di, 6
		pop cx
	loop takeLineL

pop cx di si ax es
ret
endp takeSqrL

proc andingL
	push ax es di si cx
	
	mov ax, 0A000h
	mov es, ax
	mov di, [newPosL]
	mov si, offset mskL
	mov cx, 4
	and1L:
		push cx
		mov cx, 6
		xxL:
			lodsb
			and [es:di], al
			inc di
		loop xxL
		add di, 320
		sub di, 6
		pop cx
	loop and1L
	
pop cx si di es ax
ret
endp andingL

proc oringL
	push ax es di si cx bx
	
	mov ax, 0A000h
	mov es, ax
	mov di, [newPosL]
	mov si, offset letter
	mov cx, 4
	or1L:
		push cx
		mov cx, 6
		yyL:
			lodsb
			or [es:di], al
			inc di
		loop yyL
		add di, 320
		sub di, 6
		pop cx
	loop or1L
	
pop bx cx si di es ax
ret
endp oringL

proc chDoor
	mov ah, 0dh
	mov cx, [x]
	mov dx, [y]
	int 10h
	
	cmp al, 13h
ret
endp chDoor