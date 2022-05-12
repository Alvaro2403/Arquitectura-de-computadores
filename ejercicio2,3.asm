
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100h
.data
     
     num db 0
     
     ingresoNum db 13,10, 'Ingrese el numero a evaluar: $'
     es_primo db 13,10, 'El Numero Ingresado Es Primo $'
     es_par db 13,10, 'El numero Ingresado No Es Primo $'
     cont db 0    
     
     
.code
           main proc far
           mov ax,@data
           mov ds, ax
           
           ;Mensaje para el ingreso del numero
           mov ah,09h
           lea dX,ingresoNum
           int 21h
           
           ;funcion para leer el caracter
           mov ah,01h
           int 21h
           sub al,30h
           
           ;movemos el numero ingresado hacia la variable num
           mov num,al
           mov cx,0h
           mov cl,num
           mov si,0
             
           ;ciclo for  
           for:
               inc cont
               mov ax,0000h
               mov al,num
               mov bl,cont
               div bl
               
               cmp ah,0
               je imprimir
               jne noimprimir
               
                    imprimir:
                        inc si
                    
                    noimprimir:
                         loop for
             
           cmp si,2    ;finalizando el loop compara si el registo SI es 2 por la analogia de un numero primo
           jz primo    ; si es cierto va a imprimir el mensaje en la variable es_primo 
           jnz noprimo ; si no imprimira el mensaje en la variable es_par
           
           primo:
                mov ah,09h
                lea dX,es_primo
                int 21h
                jmp salir 
           noprimo:
                  mov ah,09h
                  lea dX,es_par
                  int 21h
           
           salir:
                mov ah,4ch
                int 21h            
    ret
main endp
end main




