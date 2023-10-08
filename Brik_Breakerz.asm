.model small
.stack 100h
;--------BRICKS VARIABLES----------
bricks struct
color db 0
startx dw 0; the initial value aka cx 
lastx dw 0 ; the l1 
starty_co dw 0
lasty_co dw 0 ; the final value of dx after the whole brick is made aka at the end of loop after one block made 
score db 0 ; either 1 or 2 for red 2 for white 1 
hit db 0 ; the number of times ball will hit it 
bricks ends

;--------BRICKS VARIABLES END------
.data
;--------------FOR ENTER NAME---------------
array db 10 dup(0),'$'
statement1 db "Enter name: ",'$'
length1 dw 250 ; length of a square also of rectangle later on
width2 dw 20;width of a rectangle 
valcx dw ?
valdx dw ?
;-------------PAGE NOTATIONS----------
;bh 00h is main menu
;bh 01h is level one
;bh 02h is level two
;bh 03h is level three
;bh 04h is pause menu
;bh 05h is game over
;bh 06h is leaderboard/highscore
;bh 07h is instructions
;bh 08h is win_screen
;bh 09h is for entering name

;-------MAIN MENU VARIABLES----------

n    db " ÜÜÜÜ    ÛÛßÛÛÛ   ÛÛ² ÜÛÛÛÛÜ   ÛÛ ÜÛß  "
n1   db" ²ÛÛÛÛÛÜ ²ÛÛ ± ÛÛ±²ÛÛ±±ÛÛß ßÛ   ÛÛÜÛ±   " 
n2   db" ±ÛÛ± ÜÛÛ²ÛÛ °ÜÛ ±±ÛÛ±±²Û    Ü ²ÛÛÛÜ  "
n3   db" ±ÛÛ°Ûß  ±ÛÛßßÛÜ  °ÛÛ°±²²Ü ÜÛÛ±²ÛÛ ÛÜ   "
n4   db" °²Û  ßÛ²°ÛÛ² ±ÛÛ±°ÛÛ°± ²ÛÛÛß °±ÛÛ± ÛÜ  " 
n5   db" °±²ÛÛÛß±° ±² °±²°°²  ° °± ±  °± ±± ²±  " 
   


m    db    "ÜÜÜÜ    ÛÛßÛÛÛ  ²ÛÛÛÛÛ ÜÜÜ       ÛÛ ÜÛß²ÛÛÛÛÛ  ÛÛßÛÛÛ "
m1   db    "²ÛÛÛÛÛÜ ²ÛÛ ± ÛÛ±²Û    ±ÛÛÛÛÜ    ÛÛÜÛ± ²Û   ß ²ÛÛ ± ÛÛ±"
m2   db    "±ÛÛ± ÜÛÛ²ÛÛ °ÜÛ ±±ÛÛÛ  ±ÛÛ  ßÛÜ  ²ÛÛÛÜ° ±ÛÛÛ   ²ÛÛ °ÜÛ±"
m3   db    "±ÛÛ°Ûß  ±ÛÛßßÛÜ  ±²Û  Ü°ÛÛÜÜÜÜÛÛ ²ÛÛ ÛÜ ±²Û  Ü ±ÛÛßßÛÜ  "
m4   db    "°²Û  ßÛ²°ÛÛ² ±ÛÛ±°±ÛÛÛÛ±²Û   ²ÛÛ±±ÛÛ± ÛÜ°±ÛÛÛÛ±°ÛÛ² ±ÛÛ±"
m5   db    "°±²ÛÛÛß±° ±² °±²°°° ±° °±±   ²±Û°± ±± ²±°° ±° °° ±² °±²°"
m6   db    "±°±   °   °± ° ±° ° °  ° ±   ±± °° °± ±° ° °  °  °± ° ±°"
m7   db    "°    °   °°   °    °    °   ±   ° °° °    °     °°   °  "
        





menu_option1 db "|1|--------->>>>>>>>NEW GAME"
menu_option2 db "|2|--------->>>>>>>>INSTRUCTIONS"
menu_option3 db "|3|--------->>>>>>>>LEADERBOARDS"
menu_option4 db "|4|--------->>>>>>>>QUIT"
instructions db "                       Use arrow keys to move the paddle, to hit the bricks.",10
			 db "For level 01: Every hit earns a score.There are three lives.With every fail, you lose a life.If all lives lost, you lose and restart again if needed", 10
			 db"    For level 02: Every hit changes the color of the brick.Hitting a brick will earn you a point, two hits break the brick.",10
			 db"      The ball speed will be increased for level 02 and the paddle szie will be decreased. ",10
			 db" For level 03:Every hit changes the color of the brick.Hitting a brick will earn you a point, three hits will break the brick.",10
			 db"                        Some bricks are static and will bounce the ball back",10
			 db"      There will a few random bricks.Hitting them will demolish 5 random bricks successfully ",10
			 db"                        The ball speed will be increased.",'$'



















;-----ASCII ART--------------
art db 		       "*%@@@@@@@@#,                       *%@@@@@@@@#,"              
   db              "*%&/      *%&/                  .(@#,     .(@#,"                 
   db              "*%@@@#,     .(@#,             *%&/      *%@@@#,"                 
   db                   "*%@@@#,   *%&/ *%@@@#,.(@#,   *%@@@#,"                 
   db                        "*%&/ *%@@@#,   *%@@@#,.(@#,"                 
   db                        "*%@@@#,             *%@@@#,"                 
   db                          ".(@#,.*#/.   ,/(* *%&/"                 
   db                          ".(@#,.(@#,   *%&/ *%&/"                 
   db                          ".(@@@&/ *%@@@#,.(@@@&/"                 
   db                             "*%@@@#,   *%@@@#,"                 
   db                               ".(@@@@@@@@&/"                 
   db                    "                                         "                 
   db                   "*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#,"                 
   db                   "*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#,"                 
   db                             "*%@@@@@@@@@@@@@#,"                 
   db                             "*%@@@@@@@@@@@@@#,"                 
   db                             "*%@@@@@@@@@@@@@#,"                 
   db     "                                                        "                 
   db ".(@@@&/      *%@@@#,   *%&/                  .(@#,   *%@@@#,      /&@@@(."    
   db ".(@@@&/      *%@@@#,   *%&/      *%@@@#,     .(@#,   *%@@@#,      /&@@@(."    
   db ".(@@@&/      *%@@@#,     .(@#,.(@#,   *%&/ *%&/      *%@@@#,      /&@@@(."    
   db ".(@@@&/      *%@@@#,        *%&/        .(@#,        *%@@@#,      /&@@@(."    
   db      ".(@@@@@@#,                                           *%@@@@@@(.", '$'






game_over_art1 db "{}           {}" , '$'
game_over_art2 db "  \  _---_  /"   , '$'
game_over_art3 db "   \/     \/"    , '$'
game_over_art4 db "    |() ()|"     , '$'
game_over_art5 db "     \ + /"      , '$'
game_over_art6 db "    / HHH  \ "   , '$'
game_over_art7 db "   /  \_/   \ "  , '$'
game_over_art8 db " {}          {}", '$'



pause_menu_art1 db " _______  _______  __   __  _______  _______  ______  " , '$'
pause_menu_art2 db "|       ||   _   ||  | |  ||       ||       ||      | " , '$'
pause_menu_art3 db "|    _  ||  |_|  ||  | |  ||  _____||    ___||  _    |" , '$'
pause_menu_art4 db "|   |_| ||       ||  |_|  || |_____ |   |___ | | |   |" , '$'
pause_menu_art5 db "|    ___||       ||       ||_____  ||    ___|| |_|   |" , '$'
pause_menu_art6 db "|   |    |   _   ||       | _____| ||   |___ |       |" , '$'
pause_menu_art7 db "|___|    |__| |__||_______||_______||_______||______| ", '$'



name3  db" __________ _________ ___________   _______ " 
name31 db" \______   \______   \   \_   ___ \|    |/ _| " 
name32 db" |    |  _/|       _/   /    \  \/|      <   "  
name33 db" |    |   \|    |   \   \     \___|    |  \  " 
name34 db" |______  /|____|_  /___|\______  /____|__ \ " 
name35 db" \/        \/            \/        \/ " 
name4  db" _______________________________   _____   ____  __.____________________ "
name41 db" \______   \______   \_   _____/  /  _  \ |    |/ _|\_   _____|______   \"
name42 db" |    |  _/|       _/|    __)_  /  /_\  \|      <   |    __)_ |       _/" 
name43 db" |    |   \|    |   \|        \/    |    \    |  \  |        \|    |   \" 
name44 db" |______  /|____|_  /_______  /\____|__  /____|__ \/_______  /|____|_  /" 
name45 db"        \/        \/        \/         \/        \/        \/        \/" 




;-------MAIN VARIABLES----------

time_frame db 0;flag for time used int FPS loop, refreshes screen if a set time is passed, default is 100th of a second
scancode db 0;scancode holder
asciicode db 0;ascii holder
quit db 0;flag for quit, sets to 1 if escape is pressed in menu
window_X dw 140h ;320 Width
window_Y dw 0C8h;200 Height
lives db 3;lives variable
total_score db 0;total score counter
time dw 0 ;4 minutes
counter db 0;counter for time
win db 0;counter for win condition
pause_flag db 0
total_score_txt db '0', '$'
total_lives_txt db '3', '$'
total_score_left db 0
total_score_left_txt db '0', '$'
;-------BRICKS VARIABLES----------


blocks bricks 27 dup(<>);10
l1 dw 35
templ1 dw 35
temp dw 0
l2 dw 70
tempy dw 0
col db 1
row db 1
color1 db 05h
color2 db 03h




;-------MAIN MENU VARIABLES----------

; menu_ascii1 db "+-+-+-+-+-+-+-+-+-+-+-+-+", '$'
; menu_ascii2	db "|B|r|i|c|k|B|r|e|a|k|e|r|", '$'
; menu_ascii3 db "+-+-+-+-+-+-+-+-+-+-+-+-+", '$'
; menu_option1 db "1) New Game", '$'
; menu_option2 db "2) Instructions", '$'
; menu_option3 db "3) Leaderboards", '$'
; menu_option4 db "4) Quit", '$'
; instructions db "Use arrow keys to move the paddle, hit the bricks for the lolz.",
			  ; "if the ball falls off the paddle, you are a noob and  deserve the loss.", '$'

;--------BALL VARIABLES----------
ball_original_x dw 110
ball_original_y dw 0A9H
ball_x dw 110
ball_y dw 0A9H
ball_size dw 4 ;Ball size in terms of width * height ( 4 * 4 = 16)
velocity_x dw 2
velocity_y dw 2

;-----WIN SCREEN VARIABLES----------
win_text db"......................................U WIN....................................",10
    db"Press Any Key to Move to Next Level",'$'


;------GAME OVER VARIABLES----------
game_over_text1 db "You are out of lives", '$'
game_over_text2 db "Press any key to continue", '$'

;---------PADDLE VARIABLES----------
paddle_x dw 110
paddle_y dw 0AFh
paddle_width dw 40
paddle_height dw 05h
paddle_velocity dw 0Ch

.code


;___________ENTER NAME(PAGE 10)

entername proc
mov ax,0
mov dx,0
mov bx,0
mov cx,100;0
mov ax,0
mov valcx,cx

mov dx,76
mov valdx,dx
add dx,width2
mov width2,dx
mov dx,0

 mov ah ,00h
mov al,13h
int 10h

 L11:
 mov ah,0ch
 mov al,4h
 mov dx,valdx
 int 10h
 inc cx
 cmp cx,length1
 jne L11

 mov cx,valcx;0
 ;add dx,width2
 mov dx,width2
 L12:
  mov ah,0ch
 mov al,4h
 int 10h
 inc cx
 cmp cx,length1
 jne L12

 mov dx,valdx
 L3:
 mov ah,0ch
 mov al,4h
 mov cx,valcx;0
 int 10h
 inc dx
 cmp dx,width2
 jne L3



 mov cx,length1
 sub cx,1
 mov dx,valdx
 L4:
 mov ah,0ch
 mov al,4h
 int 10h
 inc dx
 cmp dx,width2
 jne L4





 MOV AH,02H;interrupt to set cursor location
MOV DH, 10 ;Row Number
MOV DL, 15 ;Column Number
;mov bh, 09h;set page to one for main menu
INT 10H


 mov ah,09h
 lea dx,statement1
 int 21h


 MOV AH,02H;interrupt to set cursor location
MOV DH, 15 ;Row Number
MOV DL, 20 ;Column Number
;mov bh, 09h;set page to one for main menu
INT 10H

mov dx,offset array
mov ah,3fh
int 21h


 ret 4 
entername endp


;--------MAIN MENU(PAGE 0)----------
draw_menu proc;draws the menu and its sub menus as well as their functionalities
;call menu_cls; menu cls function
menu:

 mov ah, 00h
 mov al, 10h ;Show Screen/video mode
 int 10h




mov ah,0Bh
mov bh, 00h ;set background color
mov bl, 00h ;color for menu is gray
int 10h





MOV AH,02H;interrupt to set cursor location
MOV DH, 0 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H




mov al,1
mov bh,00h
mov bl,07h
mov cx,lengthof n
push ds
pop es
mov bp,offset n
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 1 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H


mov al,1
mov bh,00h
mov bl,06h
mov cx,lengthof n1
push ds
pop es
mov bp,offset n1
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 2 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H

mov al,1
mov bh,00h
mov bl,0Eh
mov cx,lengthof n2
push ds
pop es
mov bp,offset n2
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 3 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H


mov al,1
mov bh,00h
mov bl,0fh
mov cx,lengthof n3
push ds
pop es
mov bp,offset n3
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 4 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H


mov al,1
mov bh,00h
mov bl,07h
mov cx,lengthof n4
push ds
pop es
mov bp,offset n4
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 5 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H

mov al,1
mov bh,00h
mov bl,0Bh
mov cx,lengthof n5
push ds
pop es
mov bp,offset n5
mov ah,13h
int 10h 


MOV AH,02H;interrupt to set cursor location
MOV DH, 6 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H



;;;;;;;;;;;;;;;;;;;;breaker






mov al,1
mov bh,00h
mov bl,07h
mov cx,lengthof m
push ds
pop es
mov bp,offset m
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH,7 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H


mov al,1
mov bh,00h
mov bl,06h
mov cx,lengthof m1
push ds
pop es
mov bp,offset m1
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 8 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H

mov al,1
mov bh,00h
mov bl,0Eh
mov cx,lengthof m2
push ds
pop es
mov bp,offset m2
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 9 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H


mov al,1
mov bh,00h
mov bl,0fh
mov cx,lengthof m3
push ds
pop es
mov bp,offset m3
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 10 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H


mov al,1
mov bh,00h
mov bl,07h
mov cx,lengthof m4
push ds
pop es
mov bp,offset m4
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 11 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H

mov al,1
mov bh,00h
mov bl,0Bh
mov cx,lengthof m5
push ds
pop es
mov bp,offset m5
mov ah,13h
int 10h 


MOV AH,02H;interrupt to set cursor location
MOV DH, 12 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H

mov al,1
mov bh,00h
mov bl,07h
mov cx,lengthof m6
push ds
pop es
mov bp,offset m6
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 13 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H


mov al,1
mov bh,00h
mov bl,06h
mov cx,lengthof m7
push ds
pop es
mov bp,offset m7
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 17 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H

;;;;;;;;;;;;;;;;;labels


mov al,1
mov bh,00h
mov bl,04h
mov cx,lengthof menu_option1
push ds
pop es
mov bp,offset menu_option1
mov ah,13h
int 10h

mov ah, 02h
mov DH, 19
mov DL, 0
mov bh, 00h
int 10h

mov al,1
mov bh,00h
mov bl,01h
mov cx,lengthof menu_option2
push ds
pop es
mov bp,offset menu_option2
mov ah,13h
int 10h

mov ah, 02h
mov DH, 21
mov DL, 0
mov bh, 00h
int 10h


mov al,1
mov bh,00h
mov bl,01h
mov cx,lengthof menu_option3
push ds
pop es
mov bp,offset menu_option3
mov ah,13h
int 10h

mov ah, 02h
mov DH, 23
mov DL, 0
mov bh, 00h
int 10h

mov al,1
mov bh,00h
mov bl,04h
mov cx,lengthof menu_option4
push ds
pop es
mov bp,offset menu_option4
mov ah,13h
int 10h



;MENU KEY INTEGRATION-----



keypress:
mov ax, 0h
mov ah, 10h; 10h waits for key input, sends the scancode if any to ah and ascii code if any to al
int 16h; unlike 21h, 16h can get both scancode and ascii code
mov scancode, ah
mov asciicode, al

cmp scancode, 1B;Quit
je exit
cmp asciicode, 34h;Quit if 4 is pressed instead of escape
je exit
cmp  asciicode, 32h
je instruct;Instructions
cmp asciicode, 31h
je continue;New game

jmp keypress

instruct:
call cls
 
 mov ax, 0h
 mov al, 10h
 int 10h
 

 MOV AH,02H;interrupt to set cursor location
 MOV DH, 9 ;Row Number
 MOV DL, 20 ;Column Number
 mov bh, 07h;set page to seven for instructions
 INT 10H
 lea dx, [instructions]
 mov ah, 09h
 int 21h
 mov ax, 0
menu_key_press:;key checker for instructions screen
mov ax, 0h
mov ah, 10h; 10h waits for key input, sends the scancode if any to ah and ascii code if any to al
int 16h; unlike 21h, 16h can get both scancode and ascii code
mov scancode, ah
mov asciicode, al
cmp scancode, 1B;Quit
je menu
jmp menu_key_press




exit:
mov quit, 1

continue:
mov ax,0

ret

draw_menu endp

draw_paddle proc
mov cx, paddle_x
mov dx, paddle_y


	vertical:
		mov cx, paddle_x;reset the x-axis to the initial position
		inc dx;increment the y-axis
		mov bx, dx;store in bx
		sub bx, paddle_y;subtract the initial position from the incrementing y-axis
		cmp bx, paddle_height;compare the incrementing y-axis with the upper limit of paddle height(4)
		jng horizontal;if not greater than upper limit then jump back to horizontal to draw another line
		jmp exit;else jump to exit since the paddle has been completed
		
		
	
	horizontal:
		mov ah, 0ch;writing pixel
		mov al, 0Fh;pixel color
		mov bh, 01h ;this command sets the page number, commented out for testing purposes
		int 10h;initialize the above configurations
		inc cx;increment x-axis
		mov ax, cx;store x-axis in ax
		sub ax, paddle_x;subtract the initial position of the paddle from the incrementing x-axis
		cmp ax, paddle_width;compare the incrementing x-axis with the upper limit of paddle width(4)
		jng horizontal;if not greater than upper limit then loop
		jmp vertical;if greater then move to vertical
	
	exit:
	
	ret
draw_paddle endp


file_write proc






ret
file_write endp






draw_ball_func proc;Draws the ball
	; mov ah, 02h
	; mov dh, 0h
	; mov dl, 0h
	; mov bh, 01h
	; int 10h

	mov cx, ball_x ;ball start position in x-axis
	mov dx, ball_y ;ball start position in y-axis
	
	 ; mov ah, 05h;set page number for level one
	 ; mov al, 01h
	 ; int 10h
	
	 ; mov ah, 0Bh ;set background color
	 ; mov bl, 0 ;color for level one is black
	 ; int 10h
	
	;Since we need the ball to be more than a single pixel, we have to draw and bundle together a bunch
	;of pixels that will act like the ball.
	
	jmp horizontal
	
	vertical:
		mov cx, ball_x;reset the x-axis to the initial position
		inc dx;increment the y-axis
		mov bx, dx;store in bx
		sub bx, ball_y;subtract the initial position from the incrementing y-axis
		cmp bx, ball_size;compare the incrementing y-axis with the upper limit of ball height(4)
		jng horizontal;if not greater than upper limit then jump back to horizontal to draw another line
		jmp exit;else jump to exit since the ball has been completed
		
		
	
	horizontal:
		mov ah, 0ch;writing pixel
		mov al, 0Fh;pixel color
		mov bh, 01h ;this command sets the page number, commented out for testing purposes
		int 10h;initialize the above configurations
		inc cx;increment x-axis
		mov ax, cx;store x-axis in ax
		sub ax, ball_x;subtract the initial position of the ball from the incrementing x-axis
		cmp ax, ball_size;compare the incrementing x-axis with the upper limit of ball width(4)
		jng horizontal;if not greater than upper limit then loop
		jmp vertical;if greater then move to vertical
	
	exit:
	
	ret
draw_ball_func endp


draw_bricks_func proc


;call hit_set

mov si,offset blocks

; mov ah,00h
; mov al,13h
; int 10h


mov ax,0
mov cx,0
mov dx,0
mov bx,0
;mov bl,color1 
;mov bh,color2

mov dx,50
mov tempy ,dx
OUTER:
COLUMNS:
;mov (bricks ptr[si]).hit, 1;The number of hits required for a brick to be destroyed
mov cx,templ1
mov l1,cx
mov cx,0
mov temp,cx
mov dx,0
ROWS:
mov dx,tempy
mov (bricks ptr[si]).starty_co,dx
PRINTSQUARE:
L3:
mov cx,temp
L11:
MOV AH, 0Ch
mov al,(bricks ptr[si]).color
int 10h
inc cx
cmp cx,l1
jne L11
int 10h
inc dx
cmp dx,l2
jne L3
;xchg bl,bh
mov bx,temp
mov (bricks ptr[si]).startx,bx
mov bx,l1
mov (bricks ptr[si]).lastx,bx
mov bx,l2
mov (bricks ptr[si]).lasty_co,bx
mov bx,0
mov temp ,cx
mov cx,l1
add cx,35;30
mov l1,cx
add si,sizeof bricks
inc row
cmp row,10
jne ROWS
mov tempy,dx
mov ax,l2
add ax,20
mov l2,ax
mov ax,0
mov al,1
mov row,al
mov ax,0
inc col
;xchg bl,bh
cmp col,3
jne COLUMNS


EXIT:


mov ax, 0
mov ax, 35
mov l1, ax
mov templ1, ax
mov ax, 0
mov temp, ax
mov tempy, ax
mov al, 1
mov col, al
mov row, al
mov ax, 70
mov l2, ax

ret
 
draw_bricks_func endp

cls proc;clears screen

mov ah, 00h
mov al, 13h ;Show Screen/video mode
int 10h

ret
cls endp

menu_cls proc; separate clear screen function for menu because menu is in a different resolution than the other pages
mov ah, 00h
mov al, 10h ;Show Screen/video mode
int 10h


ret
menu_cls endp

reset_ball proc;resets ball to original position
 
 mov ax, ball_original_x
 mov ball_x, ax
 
 mov ax, ball_original_y
 mov ball_y, ax


ret
reset_ball endp

ball_movement proc;makes the ball move as well as count lives and check the boundaries



mov ax, velocity_x
add ball_x, ax;Add velocity to the x-axis of the ball to make it move left and right

 cmp ball_x, 5
 jl invert_velocity_x;compare teh position of the ball with the left boundary, if less then invert the velocity of the ball

 mov ax, window_X
 sub ax, ball_size;subtract the ball size from the window width to ensure that the ball doesnt move past the window while checking for boundary
 sub ax, 5
 cmp ball_x, ax;compare the balls position with the right boundary, if greater then invert the velocity
 jg invert_velocity_X

mov ax, velocity_y
add ball_y, ax;add the velocity to the y-axis of the ball to make it move up and down

cmp ball_y, 5;compare the position of the ball with the upper boundary, if less then invert the velocity
jl invert_velocity_y

mov ax, window_Y
sub ax, ball_size
sub ax, 5
cmp ball_y, ax;compare the position of the ball with lower boundary, if greater then subtract a life and invert the velocity since the ball fell off the paddle
jg minus_life




return:
ret

invert_velocity_x:
neg velocity_x
ret

minus_life:
sub lives, 1
call update_lives
call reset_ball

invert_velocity_y:
neg velocity_y
ret

ball_movement endp


ball_paddle_collison proc

;ball collision with paddle
;formula = max_x1 > min_x2  AND min_x1 < max_x2 AND max_y1 > min_y2 AND min_y1 < max_y2

;in terms of ball-paddle collision 
;ball_x + ball_size > paddle_x 
;AND ball_x < paddle_x + width
;AND ball_y + ball_size > paddle_y 
;AND ball_y < paddle_y + paddle_height

;ball_x + ball_size > paddle_x
mov ax, ball_x
add ax, ball_size
cmp ax, paddle_x
jng return

;ball_x < paddle_x + width
mov ax, 0
mov ax, paddle_x
add ax, paddle_width
cmp ball_x, ax
jnl return

;AND ball_y + ball_size > paddle_y 
mov ax, 0
mov ax, ball_y
add ax, ball_size
cmp ax, paddle_y
jng return

;AND ball_y < paddle_y + paddle_height
mov ax, 0
mov ax, paddle_y
add ax, paddle_height
cmp ball_y, ax
jnl return

neg velocity_y

return:
ret
ball_paddle_collison endp




move_paddle proc
;check if key is pressed
mov ax, 0
 mov ah, 01h;01h
 int 16h
 jz exit




 mov ah, 00h
 int 16h

cmp ah, 4Bh
je move_paddle_left

cmp ah, 4Dh
je move_paddle_right
jmp exit

move_paddle_left:
mov ax, paddle_velocity
sub paddle_x, ax
jmp check_boundary_left


move_paddle_right:
mov ax, paddle_velocity
add paddle_x, ax

check_boundary_left:
cmp paddle_x, 1
jg check_boundary_right
mov ax, paddle_velocity
add paddle_x, ax

check_boundary_right:
mov ax, window_X
sub ax, paddle_width
sub ax, 2
cmp paddle_x, ax
jng exit
mov ax, paddle_velocity
sub paddle_x, ax


exit:
ret

move_paddle endp


brick_collision proc

mov si, offset blocks
mov cx, 27
;ball collision with brick
;formula = max_x1 > min_x2  AND min_x1 < max_x2 AND max_y1 > min_y2 AND min_y1 < max_y2
jmp check_collision
;in terms of ball-paddle collision 
;ball_x + ball_size > brick_start_x
;AND ball_x < brick_last_x
;AND ball_y + ball_size > brick_start_y 
;AND ball_y < brick_last_y

;for x-axis
BIGGER:
check_collision:
check_x:
mov ax,(bricks ptr[si]).startx
mov dx,(bricks ptr [si]).lastx
;mov ax,ball_x
mov bx,ball_size
add bx,ball_x
.if(bx>=ax)&&(dx>=ball_x)
jmp check_y
.else
jmp return_1
.endif
check_y:
mov ax,(bricks ptr[si]).starty_co
mov dx,(bricks ptr [si]).lasty_co
;mov ax,ball_y
mov bx,ball_size
add bx,ball_y
.if(bx>=ax)&&(dx>=ball_y)
jmp check_color
.else
jmp return_1
.endif
check_color:;changes color of the brick to show collision
mov al,(bricks ptr[si]).color
mov bl,(bricks ptr[si]).hit
.if(al !=0h && bl == 1)
jmp change_color_black
.elseif(al !=0h && bl == 2)
jmp change_color_green
.elseif(al !=0h && bl == 3)
jmp change_color_blue
.endif

return_1:
add si,sizeof bricks
dec cx
cmp cx,0
je go_out
jmp BIGGER
change_color_black:;sets color to black if there is collision and the hit number of the brick is 0
;SCORE TEXT UPDATE HERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
add total_score, 1; increases total score by one
call update_txt_score
mov al,00h
mov (bricks ptr[si]).hit, 0
mov (bricks ptr[si]).color,al
neg velocity_y
jmp go_out

change_color_green: ;for level two bricks, sets color to green if there is collision and the hit number of the brick is 2
add total_score, 1; increases total score by one
call update_txt_score
mov al,02h
mov (bricks ptr[si]).hit, 1
mov (bricks ptr[si]).color,al
neg velocity_y
jmp go_out

change_color_blue:;for level three bricks, sets color to blue if there is collision and the hit number of the brick is 3
mov bl, (bricks ptr[si + 15]).hit
.if(bl == 0)
mov al, 00h
mov (bricks ptr[si + 15]).hit, 0
mov (bricks ptr[si + 15]).color, al
call random_5
.endif
add total_score, 1; increases total score by one
call update_txt_score
mov al,01h
mov (bricks ptr[si]).hit, 2
mov (bricks ptr[si]).color,al
neg velocity_y
jmp go_out


go_out:
ret

brick_collision endp



random_5 proc
mov si, offset blocks
mov temp, 5
mov ah, 2ch
int 21h
.if(dh > 5 && dh < 10)
brick_black:
add total_score, 5; increases total score by one
call update_txt_score;SCORE TEXT UPDATE HERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
mov al,00h
mov (bricks ptr[si]).hit, 0
mov (bricks ptr[si]).color,al
add si, sizeof bricks
cmp temp, 0
jne brick_black
.elseif( dh > 10 && dh < 15)
brick_black2:
add total_score, 5; increases total score by one
call update_txt_score;SCORE TEXT UPDATE HERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
mov al,00h
mov (bricks ptr[si]).hit, 0
mov (bricks ptr[si]).color,al
add si, sizeof bricks
cmp temp, 0
jne brick_black2
.elseif(dh > 15)
brick_black3:
add total_score, 5; increases total score by one
call update_txt_score;SCORE TEXT UPDATE HERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
mov al,00h
mov (bricks ptr[si]).hit, 0
mov (bricks ptr[si]).color,al
add si, sizeof bricks
cmp temp, 0
jne brick_black3
.endif
ret
random_5 endp




display_text_lvl_1 proc



mov ah, 02h;courser position
mov bh, 01h;page number
mov dh, 04h
mov dl, 06h
int 10h

mov ah, 09h
lea dx, total_score_txt
int 21h



mov ah, 02h
mov bh, 01h
mov dh, 04h
mov dl, 0Ah
int 10h
mov ah, 09h
lea dx, total_lives_txt
int 21h

; MOV AH,02H;interrupt to set cursor location
; MOV DH, 0 ;Row Number
; MOV DL, 1 ;Column Number
; mov bh, 01h;set page to one for level one
; INT 10H

; sub total_score, 31H
; lea dx, total_score
; mov ah, 09h
; int 21h


; MOV AH,02H;interrupt to set cursor location
; MOV DH, 1 ;Row Number
; MOV DL, 5 ;Column Number
; mov bh, 01h;set page to two for level one
; INT 10H

; sub lives, 31H
; lea dx, lives
; mov ah, 09h
; int 21h

; MOV AH,02H;interrupt to set cursor location
; MOV DH, 0 ;Row Number
; MOV DL, 0 ;Column Number
; mov bh, 01h;set page to one for level one
; INT 10H

ret
display_text_lvl_1 endp

update_lives proc
xor ax, ax
mov al, lives

add al, 30h



mov [total_lives_txt], al

update_lives endp

display_text_lvl_2 proc



mov ah, 02h;courser position
mov bh, 02h;page number
mov dh, 04h
mov dl, 06h
int 10h

mov ah, 09h
lea dx, total_score_txt
int 21h



mov ah, 02h
mov bh, 01h
mov dh, 04h
mov dl, 0Ah
int 10h
mov ah, 09h
lea dx, total_lives_txt
int 21h

; MOV AH,02H;interrupt to set cursor location
; MOV DH, 0 ;Row Number
; MOV DL, 1 ;Column Number
; mov bh, 01h;set page to one for level one
; INT 10H

; sub total_score, 31H
; lea dx, total_score
; mov ah, 09h
; int 21h


; MOV AH,02H;interrupt to set cursor location
; MOV DH, 1 ;Row Number
; MOV DL, 5 ;Column Number
; mov bh, 01h;set page to two for level one
; INT 10H

; sub lives, 31H
; lea dx, lives
; mov ah, 09h
; int 21h

; MOV AH,02H;interrupt to set cursor location
; MOV DH, 0 ;Row Number
; MOV DL, 0 ;Column Number
; mov bh, 01h;set page to one for level one
; INT 10H

ret
display_text_lvl_2 endp

display_text_lvl_3 proc



mov ah, 02h;courser position
mov bh, 03h;page number
mov dh, 04h
mov dl, 06h
int 10h

mov ah, 09h
lea dx, total_score_txt
int 21h



mov ah, 02h
mov bh, 01h
mov dh, 04h
mov dl, 0Ah
int 10h
mov ah, 09h
lea dx, total_lives_txt
int 21h

; MOV AH,02H;interrupt to set cursor location
; MOV DH, 0 ;Row Number
; MOV DL, 1 ;Column Number
; mov bh, 01h;set page to one for level one
; INT 10H

; sub total_score, 31H
; lea dx, total_score
; mov ah, 09h
; int 21h


; MOV AH,02H;interrupt to set cursor location
; MOV DH, 1 ;Row Number
; MOV DL, 5 ;Column Number
; mov bh, 01h;set page to two for level one
; INT 10H

; sub lives, 31H
; lea dx, lives
; mov ah, 09h
; int 21h

; MOV AH,02H;interrupt to set cursor location
; MOV DH, 0 ;Row Number
; MOV DL, 0 ;Column Number
; mov bh, 01h;set page to one for level one
; INT 10H

ret
display_text_lvl_3 endp


update_txt_score proc
xor ax, ax
mov al, total_score

add al, 30h

.if(total_score > 9)
inc total_score_left
mov total_score_left, bl
mov [total_score_left_txt], bl
.endif

mov [total_score_txt], al




ret
update_txt_score endp


win_screen proc

call menu_cls

mov ah, 05h
mov al, 08h
int 10h


; mov ah, 00h
; mov al, 10h ;Show Screen/video mode
; int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 0 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H




mov al,1
mov bh,00h
mov bl,07h
mov cx,lengthof name3
push ds
pop es
mov bp,offset name3
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 1 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H


mov al,1
mov bh,00h
mov bl,06h
mov cx,lengthof name31
push ds
pop es
mov bp,offset name31
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 2 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H

mov al,1
mov bh,00h
mov bl,0Eh
mov cx,lengthof name32
push ds
pop es
mov bp,offset name32
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 3 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H


mov al,1
mov bh,00h
mov bl,0fh
mov cx,lengthof name33
push ds
pop es
mov bp,offset name33
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 4 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H


mov al,1
mov bh,00h
mov bl,07h
mov cx,lengthof name34
push ds
pop es
mov bp,offset name34
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 5 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H

mov al,1
mov bh,00h
mov bl,0Bh
mov cx,lengthof name35
push ds
pop es
mov bp,offset name35
mov ah,13h
int 10h 
;;;;;;;;;;;;;logo for bricks

MOV AH,02H;interrupt to set cursor location
MOV DH, 6 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H

mov al,1
mov bh,00h
mov bl,07h
mov cx,lengthof name4
push ds
pop es
mov bp,offset name4
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 7 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H


mov al,1
mov bh,00h
mov bl,06h
mov cx,lengthof name41
push ds
pop es
mov bp,offset name41
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 8 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H

mov al,1
mov bh,00h
mov bl,0Eh
mov cx,lengthof name42
push ds
pop es
mov bp,offset name42
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 9 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H


mov al,1
mov bh,00h
mov bl,0fh
mov cx,lengthof name43
push ds
pop es
mov bp,offset name43
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 10 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H


mov al,1
mov bh,00h
mov bl,07h
mov cx,lengthof name44
push ds
pop es
mov bp,offset name44
mov ah,13h
int 10h

MOV AH,02H;interrupt to set cursor location
MOV DH, 11 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H

mov al,1
mov bh,00h
mov bl,0Bh
mov cx,lengthof name45
push ds
pop es
mov bp,offset name45
mov ah,13h
int 10h 


MOV AH,02H;interrupt to set cursor location
MOV DH, 17 ;Row Number
MOV DL, 0 ;Column Number
mov bh, 00h;set page to one for main menu
INT 10H

mov ah,09h
lea dx,win_text
int 21h

keypress:
mov ax, 0
 mov ah, 01h;01h
 int 16h
 jz keypress

; mov ah, 00h
; int 16h
; jmp keypress

exit:
mov total_score, 0
mov lives, 3
mov time, 0

ret
win_screen endp
level_one proc; proc for level 1, runs when new game is selected on menu
mov ah, 05h
mov al, 01h
int 10h

call cls; clears screen
call draw_bricks_func
call brick_collision
call ball_movement; Moves ball
call draw_ball_func; 01h is the page number for level 1 


call draw_paddle;draws paddle on the screen
call ball_paddle_collison
call move_paddle;moves the paddle
call display_text_lvl_1;shows score and lives
mov ax, 0

keypress:
mov ax, 0h
mov ah, 01h; 10h waits for key input, sends the scancode if any to ah and ascii code if any to al
int 16h; unlike 21h, 16h can get both scancode and ascii code
jz exit
mov ah, 00h
int 16h
mov scancode, ah
mov asciicode, al
cmp asciicode, 34h
je paused
jmp exit



paused:
mov pause_flag, 1



 ; mov ah, 00h
 ; int 16h
 ; mov asciicode, ah
 ; .if(asciicode == 1B)
 ; call pause_menu
 ; .endif

 exit:
ret
level_one endp

level_one_setup proc;sets the bricks(score and hits), the ball speed and the paddle size for level three

mov ax,0
mov al,2 ; points for red brick
mov ah,1 ; points for white brick 
mov bx,0 ; will store color, in makin chess board used bx 
mov bl,4h ;red color
mov bh,0fh; white 

mov si,offset blocks
mov cx,27
L10:
mov (bricks ptr [si]).hit, 1
mov (bricks ptr [si]).color,bl
mov (bricks ptr[si]).score , al
xchg color2,bh
xchg bl,bh
xchg bh,color1
xchg al,ah
add si ,sizeof bricks  
loop L10


ret
level_one_setup endp

level_two proc; proc for level 2, runs after the completion of level 1
mov ah, 05h
mov al, 02h
int 10h

call cls; clears screen
call draw_bricks_func
;call display_text;shows score and lives
call brick_collision
call ball_movement; Moves ball
call draw_ball_func; 02h is the page number for level 2


call draw_paddle;draws paddle on the screen
call ball_paddle_collison
call move_paddle;moves the paddle
call display_text_lvl_2;shows score and lives
mov ax, 0

keypress:
mov ax, 0h
mov ah, 01h; 10h waits for key input, sends the scancode if any to ah and ascii code if any to al
int 16h; unlike 21h, 16h can get both scancode and ascii code
jz exit
mov ah, 00h
int 16h
mov scancode, ah
mov asciicode, al
cmp asciicode, 34h
je paused
jmp exit



paused:
mov pause_flag, 1


exit:
ret
level_two endp

level_two_setup proc ;sets the bricks(score and hits), the ball speed and the paddle size for level three

mov ah, 05h
mov al, 02h
int 10h

mov ax,0
mov al,2 ; points for red brick
mov ah,1 ; points for white brick 
mov bx,0 ; will store color, in makin chess board used bx 
mov bl,4h ;red color
mov bh,0fh; white 

mov si,offset blocks
mov cx,27
L10:
mov (bricks ptr [si]).hit, 2
mov (bricks ptr [si]).color,bl
mov (bricks ptr[si]).score , al
xchg color2,bh
xchg bl,bh
xchg bh,color1
xchg al,ah
add si ,sizeof bricks  
loop L10

mov paddle_width, 30
mov velocity_x, 4
mov velocity_y, 4
mov pause_flag, 0

ret
level_two_setup endp


level_three_setup proc; sets the bricks(score and hits), the ball speed and the paddle size for level three
mov ah, 05h
mov al, 03h
int 10h

mov ax,0
mov al,2 ; points for red brick
mov ah,1 ; points for white brick 
mov bx,0 ; will store color, in makin chess board used bx 
mov bl,4h ;red color
mov bh,0fh; white 

mov si,offset blocks
mov cx,27
L10:
mov (bricks ptr [si]).hit, 3
mov (bricks ptr [si]).color,bl
mov (bricks ptr[si]).score , al
xchg color2,bh
xchg bl,bh
xchg bh,color1
xchg al,ah
add si ,sizeof bricks  
loop L10


mov velocity_x, 5
mov velocity_y, 5
mov pause_flag, 0

ret
level_three_setup endp




level_three proc ;proc for level 3, runs after the completion of level 2
mov ah, 05h
mov al, 03h
int 10h

call cls; clears screen
call draw_bricks_func
;call display_text;shows score and lives
call brick_collision
call ball_movement; Moves ball
call draw_ball_func; 01h is the page number for level 1 


call draw_paddle;draws paddle on the screen
call ball_paddle_collison
call move_paddle;moves the paddle
call display_text_lvl_3;shows score and lives
mov ax, 0

keypress:
mov ax, 0h
mov ah, 01h; 10h waits for key input, sends the scancode if any to ah and ascii code if any to al
int 16h; unlike 21h, 16h can get both scancode and ascii code
jz exit
mov ah, 00h
int 16h
mov scancode, ah
mov asciicode, al
cmp asciicode, 34h
je paused
jmp exit



paused:
mov pause_flag, 1


exit:
ret
level_three endp



game_over_screen proc ;prints gameover page after lives hit zero or time hits 240 seconds


mov ah, 05h
mov al, 05h
int 10h

call menu_cls

; sub total_score, 30h

; lea dx, total_score
; mov ah, 09h
; int 21h

 ; mov ah,02h
 ; mov dl, 10
 ; int 21h
 
 ; sub time, 30h
 
; lea dx, time
; mov ah, 09h
; int 21h

lea dx, game_over_text1
mov ah, 09h
int 21h

 mov ah,02h
 mov dl, 10
 int 21h
 
lea dx, game_over_text2
mov ah, 09h
int 21h

 mov ah,02h
 mov dl, 10
 int 21h


lea dx, game_over_art1
mov ah, 09h
int 21h

 mov ah,02h
 mov dl, 10
 int 21h

 lea dx, game_over_art2
 mov ah, 09h
 int 21h

 mov ah,02h
 mov dl, 10
 int 21h

  lea dx, game_over_art3
 mov ah, 09h
 int 21h

 mov ah,02h
 mov dl, 10
 int 21h

 lea dx, game_over_art4
 mov ah, 09h
 int 21h

 mov ah,02h
 mov dl, 10
 int 21h

 lea dx, game_over_art5
 mov ah, 09h
 int 21h

 mov ah,02h
 mov dl, 10
 int 21h

 lea dx, game_over_art6
 mov ah, 09h
 int 21h

 mov ah,02h
 mov dl, 10
 int 21h

 lea dx, game_over_art7
 mov ah, 09h
 int 21h

 mov ah,02h
 mov dl, 10
 int 21h

 lea dx, game_over_art8
 mov ah, 09h
 int 21h

mov ah,02h
mov dl, 10
int 21h

keypress:
mov ax, 0
 mov ah, 01h;01h
 int 16h
 jz keypress



ret
game_over_screen endp



pause_menu proc ;Prints the pause screen when escape is pressed during game
mov ah, 05h
mov al, 04h
int 10h

mov ax, 0

call menu_cls



; sub total_score, 30h

; lea dx, total_score
; mov ah, 09h
; int 21h

 ; mov ah,02h
 ; mov dl, 10
 ; int 21h
 
 ; sub time, 30h
 
; lea dx, time
; mov ah, 09h
; int 21h





lea dx, pause_menu_art1
mov ah, 09h
int 21h

 mov ah,02h
 mov dl, 10
 int 21h
 
lea dx, pause_menu_art2
mov ah, 09h
int 21h

 mov ah,02h
 mov dl, 10
 int 21h


lea dx, pause_menu_art3
mov ah, 09h
int 21h

 mov ah,02h
 mov dl, 10
 int 21h

 lea dx, pause_menu_art4
 mov ah, 09h
 int 21h

 mov ah,02h
 mov dl, 10
 int 21h

  lea dx, pause_menu_art5
 mov ah, 09h
 int 21h

 mov ah,02h
 mov dl, 10
 int 21h

 lea dx, pause_menu_art6
 mov ah, 09h
 int 21h

 mov ah,02h
 mov dl, 10
 int 21h

 lea dx, pause_menu_art7
 mov ah, 09h
 int 21h


mov ax, 0h
mov ah, 10h; 10h waits for key input, sends the scancode if any to ah and ascii code if any to al
int 16h; unlike 21h, 16h can get both scancode and ascii code
mov scancode, ah
mov asciicode, al

cmp scancode, 1B;Quit
je exit


exit:
ret


pause_menu endp


check_pause proc
  mov ah, 01h;01h
  int 16h
  jz exit
call pause_menu
keypress:
mov ax, 0
 mov ah, 01h;01h
 int 16h
 jz keypress

exit:
ret
check_pause endp

main proc



mov ax, @data
mov ds, ax
mov ax, 0


 mov ah, 00h
 mov al, 10h ;Show Screen/video mode
 int 10h




;jmp skip_menu

mov ax,0
mov bx,0
mov cx,0
mov dx,0

menu:
call entername
call draw_menu ;00h menu page
cmp quit, 1
je exit

mov total_score, 0
mov lives, 3

;skip_menu:
 ;keypress:
 ;mov ah,1
 ;int 16h
 ;jz keypress
 ;mov ah,0
 ;int 16h
 ;cmp al, 0
 ;je keypress/
 ;jne FPS;Only changes page after a key is pressed, for testing purposes

call level_one_setup

FPS:
MOV BH,01h ;set time needed to pass to 1 second
MOV AH,2Ch
INT 21h ;call interupt to record the current time
MOV counter,DH ;record the number of seconds to memory
cmp dl, time_frame
je FPS



mov time_frame, dl

;-----Start of level time clock



label1:
MOV AH,2Ch
INT 21h ;call interupt again to record the current time
mov ah, counter
SUB DH,ah ;subtract first time form second time
.if(dh >= bh)
inc time
.endif
;-------End of level time clock

next:
mov pause_flag, 0
; mov ah, 05h ;Code to move to different pages from the current page
; mov al, 01h ;selects the page number to move to, in this case 01h
; int 10h ;initialize the configuration
.if(win == 0 && total_score < 18 && lives != 0 && time < 240); level one
call level_one
.elseif(win == 0 && total_score == 18 && lives != 0 && time < 240); level one win
mov win, 1
call win_screen
call cls
call level_two_setup
call reset_ball
.endif
.if(win == 1 && total_score < 36 && lives != 0 && time < 240); level two
call level_two
.elseif(win == 1 && total_score == 36 && lives != 0 && time < 240); level two win
mov win, 2
call win_screen
call cls
call level_three_setup
call reset_ball
.endif
.if(win == 2 && total_score < 54 && lives != 0 && time < 240); level three
call level_three
.elseif(win == 2 && total_score == 54 && lives != 0 && time < 240); level three win
mov win, 3
call win_screen
call cls
jmp menu
.endif
.if(lives == 0 || time == 240);if lives are zero or time goes above 4 minutes then game over
call cls
call game_over_screen
jmp menu
.endif
.if(pause_flag == 1)
jmp paused
.endif




jmp FPS

paused:
call pause_menu
mov ax, 0h
mov ah, 10h; 10h waits for key input, sends the scancode if any to ah and ascii code if any to al
int 16h; unlike 21h, 16h can get both scancode and ascii code
mov scancode, ah
mov asciicode, al

cmp scancode, 1B;Quit
je next
jmp paused

exit:
mov ah, 4ch
int 21h
main endp


end main

