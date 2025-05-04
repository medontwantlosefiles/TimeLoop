		player  db  00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h
				db  00h, 00h, 11h, 11h, 11h, 11h, 11h, 11h, 11h, 00h, 00h
				db  00h, 00h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 00h, 00h
				db  00h, 00h, 42h, 42h, 42h, 42h, 42h, 42h, 42h, 00h, 00h
				db  00h, 00h, 01h, 13h, 01h, 02h, 01h, 01h, 13h, 00h, 00h
				db  00h, 00h, 13h, 01h, 01h, 42h, 01h, 13h, 01h, 00h, 00h
				db  00h, 00h, 42h, 42h,0BAh,0BAh,0BAh, 42h, 42h, 00h, 00h
				db  00h, 00h, 42h, 42h, 42h, 42h, 42h, 42h, 42h, 00h, 00h
				db  00h, 01h, 01h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 01h, 01h, 00h
				db  01h, 01h, 01h,0B0h, 0Fh, 04h, 0Fh,0B0h, 01h, 01h, 01h
				db  01h, 01h, 01h,0B0h, 01h, 04h, 01h,0B0h, 01h, 01h, 01h
				db  01h, 01h, 01h,0B0h, 01h,0B0h, 01h,0B0h, 01h, 01h, 01h
				db  01h, 01h, 01h,0B0h, 01h,0B0h, 01h,0B0h, 01h, 01h, 01h
				db  01h, 01h, 01h,0B0h, 01h,0B0h, 01h,0B0h, 01h, 01h, 01h
				db  42h, 42h, 72h, 72h, 72h, 72h, 18h, 72h, 72h, 42h, 42h
				db  00h, 00h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h,0B0h, 00h, 00h
				db  00h, 00h,0B0h,0B0h,0B0h, 00h,0B0h,0B0h,0B0h, 00h, 00h
				db  00h, 00h,0B0h,0B0h,0B0h, 00h,0B0h,0B0h,0B0h, 00h, 00h
				db  00h, 00h,001h,001h, 01h, 00h, 01h, 01h, 01h, 00h, 00h

		msk	    db 0FFh,0FFh,000h,000h,000h,000h,000h,000h,000h,0FFh,0FFh
				db 0FFh,0FFh,000h,000h,000h,000h,000h,000h,000h,0FFh,0FFh
				db 0FFh,0FFh,000h,000h,000h,000h,000h,000h,000h,0FFh,0FFh
				db 0FFh,0FFh,000h,000h,000h,000h,000h,000h,000h,0FFh,0FFh
				db 0FFh,0FFh,000h,000h,000h,000h,000h,000h,000h,0FFh,0FFh
				db 0FFh,0FFh,000h,000h,000h,000h,000h,000h,000h,0FFh,0FFh
				db 0FFh,0FFh,000h,000h,000h,000h,000h,000h,000h,0FFh,0FFh
				db 0FFh,0FFh,000h,000h,000h,000h,000h,000h,000h,0FFh,0FFh
				db 0FFh,000h,000h,000h,000h,000h,000h,000h,000h,000h,0FFh
				db 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
				db 0FFh,0FFh,000h,000h,000h,000h,000h,000h,000h,0FFh,0FFh
				db 0FFh,0FFh,000h,000h,000h,0FFh,000h,000h,000h,0FFh,0FFh
				db 0FFh,0FFh,000h,000h,000h,0FFh,000h,000h,000h,0FFh,0FFh
				db 0FFh,0FFh,000h,000h,000h,0FFh,000h,000h,000h,0FFh,0FFh

		letter  db 003h,003h,003h,003h,003h,003h
				db 003h,003h,003h,003h,003h,003h
				db 003h,003h,003h,003h,003h,003h
				db 003h,003h,003h,003h,003h,003h
				
		mskL	db 00h,00h,00h,00h
				db 00h,00h,00h,00h
				db 00h,00h,00h,00h
				db 00h,00h,00h,00h
				
		ghost   db 000h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,000h
				db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
				db 0FFh,001h,0FFh,0FFh,0FFh,0FFh,001h,0FFh
				db 0FFh,001h,001h,0FFh,0FFh,001h,001h,0FFh
				db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
				db 000h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,000h
				db 000h,000h,001h,001h,001h,001h,000h,000h
				db 000h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,000h
				
		mskG	db 0FFh,000h,000h,000h,000h,000h,000h,0FFh
				db 000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h
				db 0FFh,000h,000h,000h,000h,000h,000h,0FFh
				db 0FFh,0FFh,000h,000h,000h,000h,0FFh,0FFh
				db 0FFh,000h,000h,000h,000h,000h,000h,0FFh
				
		ghost2   db 000h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,000h
				db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
				db 0FFh,001h,0FFh,0FFh,0FFh,0FFh,001h,0FFh
				db 0FFh,001h,001h,0FFh,0FFh,001h,001h,0FFh
				db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
				db 000h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,000h
				db 000h,000h,001h,001h,001h,001h,000h,000h
				db 000h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,000h
				
		mskG2	db 0FFh,000h,000h,000h,000h,000h,000h,0FFh
				db 000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h
				db 0FFh,000h,000h,000h,000h,000h,000h,0FFh
				db 0FFh,0FFh,000h,000h,000h,000h,0FFh,0FFh
				db 0FFh,000h,000h,000h,000h,000h,000h,0FFh
				
		ghost3  db 000h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,000h
				db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
				db 0FFh,001h,0FFh,0FFh,0FFh,0FFh,001h,0FFh
				db 0FFh,001h,001h,0FFh,0FFh,001h,001h,0FFh
				db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
				db 000h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,000h
				db 000h,000h,001h,001h,001h,001h,000h,000h
				db 000h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,000h
				
		mskG3	db 0FFh,000h,000h,000h,000h,000h,000h,0FFh
				db 000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h
				db 0FFh,000h,000h,000h,000h,000h,000h,0FFh
				db 0FFh,0FFh,000h,000h,000h,000h,0FFh,0FFh
				db 0FFh,000h,000h,000h,000h,000h,000h,0FFh
				
		ghost4  db 000h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,000h
				db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
				db 0FFh,001h,0FFh,0FFh,0FFh,0FFh,001h,0FFh
				db 0FFh,001h,001h,0FFh,0FFh,001h,001h,0FFh
				db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
				db 000h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,000h
				db 000h,000h,001h,001h,001h,001h,000h,000h
				db 000h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,000h
				
		mskG4	db 0FFh,000h,000h,000h,000h,000h,000h,0FFh
				db 000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h
				db 000h,000h,000h,000h,000h,000h,000h,000h
				db 0FFh,000h,000h,000h,000h,000h,000h,0FFh
				db 0FFh,0FFh,000h,000h,000h,000h,0FFh,0FFh
				db 0FFh,000h,000h,000h,000h,000h,000h,0FFh