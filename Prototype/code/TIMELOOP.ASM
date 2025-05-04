; initialization
	start2:
	data
	setGraphicMode
	loadBckground room1
	playerStartingPosition_spawnPlayer
	playerStartingPosition_spawnGhost
	
	readClock
	mov [lastTick], ax
	
	; movement loop
	WaitForKeyPress:
		readClock
		sub ax, 36
		cmp [lastTick], ax
		jne continue
		
		pulse:
		cmp [whatRoom], 1
		je room1Movement
		cmp [whatRoom], 2
		je room2Movement
		cmp [whatRoom], 3
		je room3Movement
		cmp [whatRoom], 4
		je room4Movement
		jmp continue

		room1Movement:
			ghostMovement
			jmp checkTime

		room2Movement:
			ghostMovement2
			ghostMovement3
			jmp checkTime

		room3Movement:
			ghostMovement4
			ghostMovement5
			ghostMovement6
			jmp checkTime
			
		room4Movement:
			ghostMovement7
			ghostMovement8
			ghostMovement9
			ghostMovementA
			jmp checkTime

		checkTime:
			add ax, [rate]
			mov [lastTick], ax

			
		continue:
			mov ah, 1h
			int 16h
			jz WaitForKeyPress
			mov ah, 0h
			int 16h     
			cmp al, '`'    
			je checkPoint
			cmp al, '2'
			je goToRoom2CheckPoint
			cmp al, '1'
			je goToRoom1CheckPoint
			cmp al, '3'
			je goToRoom3CheckPoint
			cmp al, '4'
			je goToRoom4CheckPoint
			cmp al, '5'
			je goToRoom5CheckPoint
			cmp al, '0'
			je goToRoomFCheckPoint
			cmp ah, 4dh
			je moveright1
			cmp ah, 4bh
			je moveleft1
			cmp ah, 48h
			je moveup1
			cmp ah, 50h
			je movedown1
			jmp WaitForKeyPress
			checkPoint:
				jmp exit
				
			moveright1:
				moveRight
				call chCol
				je checkPointRight
				call chCol2
				je DIE
				call chCol3
				je win
				je DoorPointRight
				jmp WaitForKeyPress
			moveleft1:
				moveLeft
				call chCol
				je failedLeft
				call chCol2
				je DIE
				call chCol3
				je win
				je DoorPointLeft
				jmp WaitForKeyPress
			moveup1:
				moveUp
				call chCol
				je checkPointUp
				call chCol2
				je DIE
				call chCol3
				je win
				je DoorPointUp
				jmp WaitForKeyPress
			movedown1:
				moveDown
				call chCol
				je failedDown
				call chCol2
				je DIE
				call chCol3
				je win
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
			
		DIE:
			loadBckground rommNA
			mov ah, 0h
			int 16h
			cmp al, 'f'
			je start2
			jne DIE
			
		win:
			loadBckground backEnd
			mov ah, 0h
			int 16h
			cmp al, '`'
			je exit
			cmp al, '6'
			je start
			jne win
			
		goToRoom1CheckPoint:
			cmp [x], 160d
			jae goAhead2
			jnae WaitForKeyPress
			goAhead2:
				cmp [whatRoom], 2
				je goToRoom1
			jmp WaitForKeyPress
		
		goToRoom2CheckPoint:
			mov [direction], 0
			mov [direction2], 0
			cmp [x], 120d
			jae goAhead
			jnae WaitForKeyPress
			goAhead:
				cmp [whatRoom], 1
				je goToRoom2
			jmp WaitForKeyPress
			
		goToRoom3CheckPoint:
			mov [direction], 0
			mov [direction3], 0
			cmp [x], 130d
			jae goAhead3
			jnae WaitForKeyPress
			goAhead3:
				cmp [whatRoom], 2
				je goToRoom3
			jmp WaitForKeyPress
			
		goToRoom4CheckPoint:
			mov [direction], 0
			cmp [y], 130d
			jae goAhead4
			jnae WaitForKeyPress
			goAhead4:
				cmp [whatRoom], 3
				je goToRoom4
			jmp WaitForKeyPress
			
		goToRoom5CheckPoint:
			cmp [x], 120d
			jae goAhead5
			jnae WaitForKeyPress
			goAhead5:
				cmp [whatRoom], 4
				je goToRoom5
			jmp WaitForKeyPress
			
		goToRoomFCheckPoint:
			cmp [x], 160d
			jae goAheadF
			jnae WaitForKeyPress
			goAheadF:
				cmp [whatRoom], 1
				je goToRoomF
			jmp WaitForKeyPress
			
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
	
	goToRoom1:
		loadBckground room1
		playerRoom1Position_spawnPlayer
		jmp WaitForKeyPress
	
	goToRoom2:
		loadBckground room2
		playerRoom2Position_spawnPlayer
		playerStartingPosition_spawnGhost_room2_1
		playerStartingPosition_spawnGhost_room2_2
		jmp WaitForKeyPress
		
	goToRoom3:
		loadBckground room3
		playerRoom3Position_spawnPlayer
		playerStartingPosition_spawnGhost_room3_1
		playerStartingPosition_spawnGhost_room3_2
		playerStartingPosition_spawnGhost_room3_3
		jmp WaitForKeyPress

	goToRoom4:
		loadBckground room4
		playerRoom4Position_spawnPlayer
		playerStartingPosition_spawnGhost_room4_1
		playerStartingPosition_spawnGhost_room4_2
		playerStartingPosition_spawnGhost_room4_3
		playerStartingPosition_spawnGhost_room4_4
		jmp WaitForKeyPress
		
	goToRoom5:
		loadBckground room5
		playerRoom5Position_spawnPlayer
		jmp WaitForKeyPress
		
	goToRoomF:
		loadBckground roomFinal
		playerRoom5Position_spawnPlayer
		playerStartingPosition_spawnLetter
		jmp WaitForKeyPress