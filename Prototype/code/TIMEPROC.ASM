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

proc chCol3
	mov ah, 0dh
	mov cx, [x]
	mov dx, [y]
	int 10h
	
	cmp al, 03h
ret
endp chCol3

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

proc andingG
	push ax es di si cx
	
	mov ax, 0A000h
	mov es, ax
	mov di, [newPosG]
	mov si, offset mskG
	mov cx, 8
	and1G:
		push cx
		mov cx, 8
		xxG:
			lodsb
			and [es:di], al
			inc di
		loop xxG
		add di, 320
		sub di, 8
		pop cx
	loop and1G
	
pop cx si di es ax
ret
endp andingG

proc andingG2
	push ax es di si cx
	
	mov ax, 0A000h
	mov es, ax
	mov di, [newPosG2]
	mov si, offset mskG2
	mov cx, 8
	and1G2:
		push cx
		mov cx, 8
		xxG2:
			lodsb
			and [es:di], al
			inc di
		loop xxG2
		add di, 320
		sub di, 8
		pop cx
	loop and1G2
	
pop cx si di es ax
ret
endp andingG2

proc andingG3
	push ax es di si cx
	
	mov ax, 0A000h
	mov es, ax
	mov di, [newPosG3]
	mov si, offset mskG3
	mov cx, 8
	and1G3:
		push cx
		mov cx, 8
		xxG3:
			lodsb
			and [es:di], al
			inc di
		loop xxG3
		add di, 320
		sub di, 8
		pop cx
	loop and1G3
	
pop cx si di es ax
ret
endp andingG3

proc andingG4
	push ax es di si cx
	
	mov ax, 0A000h
	mov es, ax
	mov di, [newPosG4]
	mov si, offset mskG4
	mov cx, 8
	and1G4:
		push cx
		mov cx, 8
		xxG4:
			lodsb
			and [es:di], al
			inc di
		loop xxG4
		add di, 320
		sub di, 8
		pop cx
	loop and1G4
	
pop cx si di es ax
ret
endp andingG4

proc oringG
	push ax es di si cx bx
	
	mov ax, 0A000h
	mov es, ax
	mov di, [newPosG]
	mov si, offset ghost
	mov cx, 8
	or1G:
		push cx
		mov cx, 8
		yyG:
			lodsb
			or [es:di], al
			inc di
		loop yyG
		add di, 320
		sub di, 8
		pop cx
	loop or1G
	
pop bx cx si di es ax
ret
endp oringG

proc oringG2
	push ax es di si cx bx
	
	mov ax, 0A000h
	mov es, ax
	mov di, [newPosG2]
	mov si, offset ghost2
	mov cx, 8
	or1G2:
		push cx
		mov cx, 8
		yyG2:
			lodsb
			or [es:di], al
			inc di
		loop yyG2
		add di, 320
		sub di, 8
		pop cx
	loop or1G2
	
pop bx cx si di es ax
ret
endp oringG2

proc oringG3
	push ax es di si cx bx
	
	mov ax, 0A000h
	mov es, ax
	mov di, [newPosG3]
	mov si, offset ghost3
	mov cx, 8
	or1G3:
		push cx
		mov cx, 8
		yyG3:
			lodsb
			or [es:di], al
			inc di
		loop yyG3
		add di, 320
		sub di, 8
		pop cx
	loop or1G3
	
pop bx cx si di es ax
ret
endp oringG3

proc oringG4
	push ax es di si cx bx
	
	mov ax, 0A000h
	mov es, ax
	mov di, [newPosG4]
	mov si, offset ghost4
	mov cx, 8
	or1G4:
		push cx
		mov cx, 8
		yyG4:
			lodsb
			or [es:di], al
			inc di
		loop yyG4
		add di, 320
		sub di, 8
		pop cx
	loop or1G4
	
pop bx cx si di es ax
ret
endp oringG4

proc takeSqrG
    push es ax si di cx

    mov ax, 0A000h
    mov es, ax
    mov di, [newPosG]
    mov si, offset scrkpG
    mov cx, 8
	takeLineG:
		push cx
		mov cx, 8
		takecolG:
			mov al, [es:di]
			mov [si], al
			inc si
			inc di
		loop takecolG
		add di, 320
		sub di, 8
		pop cx
	loop takeLineG

pop cx di si ax es
ret
endp takeSqrG

proc takeSqrG2
    push es ax si di cx

    mov ax, 0A000h
    mov es, ax
    mov di, [newPosG2]
    mov si, offset scrkpG2
    mov cx, 8
	takeLineG2:
		push cx
		mov cx, 8
		takecolG2:
			mov al, [es:di]
			mov [si], al
			inc si
			inc di
		loop takecolG2
		add di, 320
		sub di, 8
		pop cx
	loop takeLineG2

pop cx di si ax es
ret
endp takeSqrG2

proc takeSqrG3
    push es ax si di cx

    mov ax, 0A000h
    mov es, ax
    mov di, [newPosG3]
    mov si, offset scrkpG3
    mov cx, 8
	takeLineG3:
		push cx
		mov cx, 8
		takecolG3:
			mov al, [es:di]
			mov [si], al
			inc si
			inc di
		loop takecolG3
		add di, 320
		sub di, 8
		pop cx
	loop takeLineG3

pop cx di si ax es
ret
endp takeSqrG3

proc takeSqrG4
    push es ax si di cx

    mov ax, 0A000h
    mov es, ax
    mov di, [newPosG4]
    mov si, offset scrkpG4
    mov cx, 8
	takeLineG4:
		push cx
		mov cx, 8
		takecolG4:
			mov al, [es:di]
			mov [si], al
			inc si
			inc di
		loop takecolG4
		add di, 320
		sub di, 8
		pop cx
	loop takeLineG4

pop cx di si ax es
ret
endp takeSqrG4

proc retSqrG
	push es ax si di cx

	mov ax, 0A000h
	mov es, ax
	mov di, [newPosG]
	mov si, offset scrkpG
	mov cx, 8

	retLineG:
		push cx
		mov cx, 8

		retcolG:
			mov al, [si]
			mov [es:di], al
			inc si
			inc di
		loop retcolG

		add di,320
		sub di, 8
	pop cx
	loop retLineG

pop cx di si ax es
ret
endp retSqrG

proc retSqrG2
	push es ax si di cx

	mov ax, 0A000h
	mov es, ax
	mov di, [newPosG2]
	mov si, offset scrkpG2
	mov cx, 8

	retLineG2:
		push cx
		mov cx, 8

		retcolG2:
			mov al, [si]
			mov [es:di], al
			inc si
			inc di
		loop retcolG2

		add di,320
		sub di, 8
	pop cx
	loop retLineG2

pop cx di si ax es
ret
endp retSqrG2

proc retSqrG3
	push es ax si di cx

	mov ax, 0A000h
	mov es, ax
	mov di, [newPosG3]
	mov si, offset scrkpG3
	mov cx, 8

	retLineG3:
		push cx
		mov cx, 8

		retcolG3:
			mov al, [si]
			mov [es:di], al
			inc si
			inc di
		loop retcolG3

		add di,320
		sub di, 8
	pop cx
	loop retLineG3

pop cx di si ax es
ret
endp retSqrG3

proc retSqrG4
	push es ax si di cx

	mov ax, 0A000h
	mov es, ax
	mov di, [newPosG4]
	mov si, offset scrkpG4
	mov cx, 8

	retLineG4:
		push cx
		mov cx, 8

		retcolG4:
			mov al, [si]
			mov [es:di], al
			inc si
			inc di
		loop retcolG4

		add di,320
		sub di, 8
	pop cx
	loop retLineG4

pop cx di si ax es
ret
endp retSqrG4

proc chCol2
	mov ah, 0dh
	mov cx, [x]
	mov dx, [y]
	int 10h
	
	cmp al, 0ffh
ret
endp chCol2