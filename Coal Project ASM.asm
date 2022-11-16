INCLUDE Irvine32.inc
 
.data
 iq        byte "*******IQ TESTER***********",0
 rule      byte "*******RULES***************",0 
 rule1     byte "EACH CORRECT ANSWER WILL ADD 5 SCORE IN YOUR TOTAL SCORE",0
 rule2     byte "EACH WRONG ANSWER WILL ADD 0 SCORE IN YOUR TOTAL SCORE",0
 rule3     byte "YOU HAVE TO ANSWER EACH QUESTION",0
 rule4     byte "YOU CAN'T REANWSER ANY QUESTION AFTER PRESSING ENTER BUTTON",0
 str0      byte "*******LET'S START. BEST OF LUCK!*********",0
 str1      byte "     ",0
 str2      byte ":What will be next number of series?",0
 str3      byte "Correct Answer! ",0
 str4      byte "Wrong Answer! ",0
 str5      byte "Your Score is = ",0
 str6      byte "Q#",0
 str7      byte "*********RESULTS**********",0
 count     byte 0
 correct   byte 0
 wrong     byte 0 
 fibo1     byte 0
 fact1     byte 0
 hex1      byte 0
 psqr1     byte 0
 bin1      byte 0
 leap1     byte 0
 letr1     byte 0
 qno       byte 0
 counter   byte 0
 temp      byte 0 
 temp2     byte 2
 g1 byte "                      GAME STARTS IN ",0
 n3 byte "                              3",0
 n2 byte "                              2",0
 n1 byte "                              1",0
.code
 main  PROC
                     ;DESCRIPTION
mov eax,yellow + (red * 16)
call settextcolor

 mov edx,offset iq
 call writestring
 call crlf
 mov eax, 950
 call delay
 call crlf
 mov edx,offset rule
 call writestring
 call crlf
 call crlf
 mov edx,offset rule1
 call writestring
 call crlf
 mov edx,offset rule2
 call writestring
 call crlf
 mov edx,offset rule3
 call writestring
 call crlf
 mov edx,offset rule4
 call writestring
 call crlf
 call crlf
 call crlf
 call crlf
 MOV EDX, OFFSET G1
 CALL WRITESTRING
 CALL CRLF
 mov edx, offset n3
 call writestring
 call crlf
 mov eax, 950
 call delay

 mov edx, offset n2
 call writestring
 call crlf
 mov eax, 950
 call delay

 mov edx, offset n1
 call writestring
 call crlf
 mov eax, 950
 call delay

 call crlf
 call crlf
 mov edx,offset str0
 call writestring
 call crlf
 again:

 mov bl,1         ;
 mov dl,7         ;# of questions are 7
 cmp counter,dl
 je exi           ;if 7 questions were asked jmp to exit
 mov eax,7        ;for random bw 0-6
 call randomize
 call randomrange
 
 cmp eax,0        ;for 1st que
 je fact          ;0 fact 
 cmp eax,1         
 je fibo          ;1 fibo
 cmp eax,2
 je hex           ;2 hex
 cmp eax,3
 je leap          ;3 leap
 cmp eax,4
 je bin           ;4 bin
 cmp eax,5
 je persqr        ;5 perfect sqr
 cmp eax,6        
 je letr          ;6 Letter
  
 fact:

cmp fact1,bl     ;bl=1;for not calling multiple time
je again         ;for not calling multiple time
inc qno          ;for displying question number
Call Factorial
inc counter      ;for checking how many question are asked
inc fact1        ;fact1=1
jmp again

fibo:

cmp fibo1,bl    ;for not calling multiple time
je again
inc qno        ;for displying question number
call Fibonacci
inc counter    ;for checking how many question are asked
inc fibo1       ;fibo1=1
jmp again

hex:

cmp hex1,bl
je again
inc qno
call Hexadecimal
inc counter
inc hex1
jmp again

leap:

cmp leap1,bl
je again
inc qno
call Leapyear
inc counter
inc leap1
jmp again

bin:

cmp bin1,bl
je again
inc qno
call Binary
inc counter
inc bin1
jmp again

persqr:

cmp psqr1,bl
je again
inc qno
call Perfectsqr
inc counter
inc psqr1
jmp again

letr:

cmp letr1,bl
je again
inc qno
call Letter
inc counter
inc letr1
jmp again


exi:
call crlf
call crlf
mov edx,offset str7  ;result
call writestring
Call Crlf
Call Crlf
mov edx,offset str5  ;score
call writestring
movzx eax,count      ;total
call writedec        ;total 
call crlf
call crlf
mov edx,offset str3  ;correct
call writestring
movzx eax,correct
call writedec
call crlf
call crlf
mov edx,offset str4  ;wrong
call writestring
movzx eax,wrong
call writedec
call crlf
call crlf
exit
main endp



Fibonacci proc
call crlf
call crlf
push ebp
mov ebp,esp

mov edx,offset str6   ;Q#
call writestring     
movzx eax,qno       
call writedec         ;question number 
mov edx, offset str2  ;Question
call writestring
call crlf
mov eax,8
mov ebx,13
mov ecx,7

l1:
mov edx, eax
add eax, ebx
mov ebx, edx
call writedec
mov edx,offset str1  
call writestring     ;space
loop l1

call readdec         ;user answer
cmp eax,545
je r                 ;right
jmp w                ;wrong

r:
inc correct
mov edx,offset str3  ;correct
call writestring
call crlf
call crlf 
add count,5

jmp ex

w:
inc wrong
mov edx,offset str4    ;wrong
call writestring
call crlf

ex:

pop ebp
ret
Fibonacci endp



Factorial PROC
push ebp
mov ebp,esp
call crlf
mov edx, offset str6
call writestring
movzx eax,qno
call writedec
mov edx, offset str2
call writestring

mov eax,1
mov ebx,1
mov ecx,5
call crlf
l1:
mul ebx
call writedec
mov edx,offset str1
call writestring
inc ebx
loop l1

call readdec
cmp eax,720
je r
jmp w

r:
inc correct
mov edx,offset str3
call writestring
call crlf
call crlf 
add count,5
jmp ex

w:
inc wrong
mov edx,offset str4
call writestring
call crlf

ex:
pop ebp
ret
Factorial endp



Hexadecimal proc
push ebp
mov ebp,esp
call crlf
call crlf
call crlf
mov edx, offset str6
call writestring
movzx eax,qno
call writedec
mov edx, offset str2
call writestring
call crlf

mov eax,58h
mov ecx,8
l1:
call writehexb
inc eax
mov edx,offset str1
call writestring
loop l1

call readhex
cmp eax,60h
je r
jmp w

r:
inc correct
mov edx,offset str3
call writestring
call crlf
call crlf 
add count,5

jmp ex
w:
inc wrong
mov edx,offset str4
call writestring
call crlf
ex:

pop ebp
ret
Hexadecimal endp  


Leapyear proc
push ebp
mov ebp,esp
call crlf
call crlf
mov edx, offset str6
call writestring
movzx eax,qno
call writedec
mov edx, offset str2
call writestring

mov eax,1996
mov ecx,7
call crlf
call crlf
l1:
call writedec
add eax,4
mov edx,offset str1
call writestring

inc ebx
loop l1
call readdec
cmp eax,2024
je r
jmp w

r:
inc correct
mov edx,offset str3
call writestring
call crlf
call crlf 
add count,5

jmp ex
w:
inc wrong
mov edx,offset str4
call writestring
call crlf
ex:
pop ebp
ret

Leapyear endp




Binary proc
push ebp
mov ebp,esp
call crlf
mov edx, offset str6
call writestring
movzx eax,qno
call writedec
mov edx, offset str2
call writestring

mov al,8
mov ecx,4
call crlf
call crlf
l1:
call writebinb
add eax,1
mov edx,offset str1
call writestring
loop l1
call readdec

cmp eax,1100
je r
jmp w

r:
inc correct
mov edx,offset str3
call writestring
call crlf
call crlf 
add count,5


jmp ex

w:
inc wrong
mov edx,offset str4
call writestring
call crlf

ex:
pop ebp
ret



Binary endp


Perfectsqr proc

push ebp
mov ebp,esp
call crlf
mov edx, offset str6
call writestring
movzx eax,qno
call writedec
mov edx, offset str2
call writestring

mov eax,4
mov ebx,eax
mov ecx,7
call crlf
call crlf
l1:
mul eax
call writedec
add ebx,1
mov eax,ebx
mov edx,offset str1
call writestring
loop l1

call readdec
cmp eax,121
je r
jmp w

r:
inc correct
mov edx,offset str3
call writestring 
add count,5

jmp ex
w:
inc wrong
mov edx,offset str4
call writestring
call crlf
ex:
pop ebp
ret

Perfectsqr endp


Letter proc
call crlf
call crlf
push ebp
mov ebp,esp

mov edx,offset str6
call writestring
movzx eax,qno
call writedec
mov edx, offset str2
call writestring
call crlf
mov al,97
mov ecx,5
mov dl,2

l1:
call writechar   ;a c f j o
mov dl,temp2     ;2 3
add temp, dl     ;2 3
inc temp2        ;3 4
add al,temp      ;99
mov edx,offset str1
call writestring
mov edx,0 
mov temp,0
loop l1

call readchar
call writechar
cmp al,'u'
je r
jmp w

r:
call crlf
inc correct
mov edx,offset str3
call writestring
call crlf
call crlf 
add count,5

jmp ex

w:
inc wrong
mov edx,offset str4
call crlf
call writestring
call crlf

ex:

pop ebp
ret
Letter endp

END main
