
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

include "emu8086.inc"
.data


num1 db ?
num2 db ?
num3 db ?
top db 0dh,0ah, "                            ---------------------------$"
bot db 0dh,0ah, "                            ---------------------------$"
mid db 0dh,0ah, "                            -                         -$"
choice db 0dh,0ah,"                                 Enter your choice: $"
meu db 0dh,0ah, "                            The Menu is Given Below:-$"
quan db 0dh,0ah,"                            Enter the number of servings:$"
bill db 0ah,0ah, "                                 Your total bill is:$ $"
leave db 0dh,0ah,"                  Enter ~0~ to exit or press ~1~ to order again: $"
.code

Menu:                                       ;Menu

mov dx,offset top
mov ah,9
int 21h


mov dx,offset mid
mov ah,9
int 21h
call newline 
print "                            -        1.Breakfast      -"
call newline
print "                            -        2.Lunch          -"
call newline
print "                            -        3.Dinner         -"

mov dx,offset mid
mov ah,9
int 21h

mov dx,offset bot
mov ah,9
int 21h

mov dx,offset choice
mov ah,9
int 21h


mov ah,1
int 21h 
sub al,48
mov num1,al

call newline
           
cmp num1,1
je Breakfast

cmp num1,2
je Lunch

cmp num1,3
je Dinner



cmp num1,0
je Invalid

cmp num1,4
jge Invalid
jmp clear


Breakfast:                              ;breakfast

call newline
mov dx,offset meu
mov ah,9
int 21h
call newline
mov dx,offset top
mov ah,9
int 21h

mov dx,offset mid
mov ah,9
int 21h

call newline                       
print "                            -  1.Eggs for $5          -"
call newline
print "                            -  2.Channy for $8        -"
call newline 
print "                            -  3.Rice for $1 each     -"
call newline
print "                            -  0.For Return to Menu   -"
mov dx,offset mid
mov ah,9
int 21h

mov dx,offset bot
mov ah,9
int 21h

 
call newline

mov dx,offset choice
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48
mov num2,al


cmp al,1
je Egg

cmp al,2
je Channy

cmp al,3
je Naan  

cmp al,0
je Menu

cmp al,4
jge Invalidb 
                                                    Egg:

mov bl,5

mov dx,offset quan
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,0
je Invalidb

cmp al,8
jg Invalidb 

mul bl
aam

mov cx,ax
add ch,48
add cl,48

call newline


mov dx,offset bill
mov ah,9
int 21h

;printing bill
mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h
;end
;new line
call newline



mov dx,offset leave
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je Menu

cmp al,0
je exit

cmp al,2
jge Invalid


                                            Channy:
mov bl,8

mov dx,offset quan
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,0
je invalidb

cmp al,8
jg invalidb

mul bl
aam

mov cx,ax
add ch,48
add cl,48

mov dx,offset bill
mov ah,9
int 21h

mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h

;new line
call newline

mov dx,offset leave
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je Menu

cmp al,0
je exit

cmp al,2
jge Invalid

                                            Naan:

mov bl,1

mov dx,offset quan
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,0
je invalidb

cmp al,8
jg invalidb

mul bl
aam

mov cx,ax
add ch,48
add cl,48

mov dx,offset bill
mov ah,9
int 21h

mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h

call newline

mov dx,offset leave
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je Menu

cmp al,0
je exit

cmp al,2
jge Invalid

;exit:                                       ;exit
;mov ah,4Ch
;int 21h 


Lunch: 

call newline
mov dx,offset meu
mov ah,9
int 21h
call newline
mov dx,offset top
mov ah,9
int 21h

mov dx,offset mid
mov ah,9
int 21h

call newline                       
print "                            -  1.Raita       $5       -"
call newline
print "                            -  2.Biryani     $7       -"
call newline 
print "                            -  3.Pulao       $8       -"
call newline
print "                            -  0.For Return to Menu   -"
call newline

mov dx,offset mid
mov ah,9
int 21h

mov dx,offset bot
mov ah,9
int 21h

 
call newline

mov dx,offset choice
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48
mov num2,al

cmp al,0
je  Menu

cmp al,1
je Raita

cmp al,2
je Biryani

cmp al,3
je Pullo

cmp al,4
jge InvalidL  

                                                   Raita:

mov bl,5


mov dx,offset quan
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,0
je InvalidL

cmp al,8
jg InvalidL

mul bl
aam

mov cx,ax
add ch,48
add cl,48

call newline


mov dx,offset bill
mov ah,9
int 21h

;printing bill
mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h
;end
;new line
call newline



mov dx,offset leave
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je Menu

cmp al,0
je exit

cmp al,2
jge Invalid


                                            Biryani:
mov bl,7
mov dx,offset quan
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,0
je invalidL

cmp al,8
jg invalidL

mul bl
aam

mov cx,ax
add ch,48
add cl,48

mov dx,offset bill
mov ah,9
int 21h

mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h

;new line
call newline

mov dx,offset leave
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je Menu

cmp al,0
je exit

cmp al,2
jge Invalid

                                            Pullo:

mov bl,8
mov dx,offset quan
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,0
je invalidL

cmp al,8
jg invalidL

mul bl
aam

mov cx,ax
add ch,48
add cl,48

mov dx,offset bill
mov ah,9
int 21h

mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h

;new line
call newline

mov dx,offset leave
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je Menu

cmp al,0
je exit

cmp al,2
jge Invalid

;exitL:                                       ;exit
;mov ah,4Ch
;int 21h 
          

;jmp calculation

Dinner: 

call newline
mov dx,offset meu
mov ah,9
int 21h
call newline
mov dx,offset top
mov ah,9
int 21h

mov dx,offset mid
mov ah,9
int 21h

call newline                       
print "                            -  1.Qorma _____  $6      -"
call newline
print "                            -  2.Kharahi ____ $7      -" 
call newline
print "                            -  3.PakCola ____ $8      -"
call newline
print "                            -  0.For Return to Menu   -"


mov dx,offset mid
mov ah,9
int 21h

mov dx,offset bot
mov ah,9
int 21h

 
call newline

mov dx,offset choice
mov ah,9
int 21h
mov ah,1
int 21h
sub al,48
mov num2,al

cmp al,0
je  Menu

cmp al,1
je Qorma

cmp al,2
je Kharahi

cmp al,3
je PakCola

cmp al,4
jge InvalidD  


                                                    Qorma:

mov bl,5

mov dx,offset quan
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,0
je InvalidD

cmp al,8
jg InvalidD

mul bl
aam

mov cx,ax
add ch,48
add cl,48

call newline


mov dx,offset bill
mov ah,9
int 21h

;printing bill
mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h
;end
call newline



mov dx,offset leave
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je Menu

cmp al,0
je exit

cmp al,2
jge Invalid


                                            Kharahi:
mov bl,7
mov dx,offset quan
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,0
je invalidD

cmp al,8
jg invalidD

mul bl
aam

mov cx,ax
add ch,48
add cl,48

mov dx,offset bill
mov ah,9
int 21h

mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h
;new line
call newline

mov dx,offset leave
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je Menu

cmp al,0
je exit

cmp al,2
jge Invalid

                                            PakCola:

mov bl,8
mov dx,offset quan
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,0
je invalidD

cmp al,8
jg invalidD

mul bl
aam

mov cx,ax
add ch,48
add cl,48

mov dx,offset bill
mov ah,9
int 21h

mov ah,2
mov dl,ch
int 21h

mov dl,cl
int 21h


mov dx,offset leave
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

cmp al,1
je Menu

cmp al,0
je exit

cmp al,2
jge Invalid

exit:                                       ;exit
mov ah,4Ch
int 21h 
          




;jmp calculation 
Invalid:
printn "invalid input"
jmp Menu

Invalidb:
call newline
printn "Invalid quantity"
jmp Breakfast

InvalidL:
call newline
printn "Invalid quantity"
jmp Lunch

InvalidD:
call newline
printn "Invalid quantity"
jmp Dinner

newline proc

mov dx,10 
mov ah,2
int 21h

mov dx,13
mov ah,2
int 21h

ret 
newline endp

clear:
mov ah,06h	;clear screen instruction
mov al,00h	;number of lines to scroll
mov bh,0CEh	;display attribute - colors
mov ch,01d	;start row
mov cl,05d	;start col
mov dh,24d	;end of row
mov dl,79d	;end of col
int 10h		;BIOS interrupt

mov ah,06h	;clear screen instruction
mov al,00h	;number of lines to scroll
mov bh,0CEh	;display attribute - colors
mov ch,01d	;start row
mov cl,05d	;start col
mov dh,24d	;end of row
mov dl,79d	;end of col
int 10h		;BIOS interrupt

;move cursor to middle

mov ah,02h	;move cursor Instruction
mov bh,00h	;Page 0
mov dh,12d	;row
mov dl,39d	;column
int 10h	

