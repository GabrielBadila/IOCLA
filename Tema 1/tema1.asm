%include "io.inc"
extern putchar
extern puts

section .data
    %include "input.inc"
    vector_rest times 100 dd 0
    mesaj_eroare db "Baza incorecta", 13, 10, 0

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp
    
    xor eax, eax	; folosesc eax pentru a salva numarul
    xor ebx, ebx	; folosesc ebx pentru a contoriza resturile
    xor ecx, ecx	; folosesc ecx pentru a salva baza
    
    mov eax, [numar]	; pun numarul in eax
    mov ecx, [baza]		; pun baza in ecx

 
verificare_baza:
    cmp ecx, 2			; daca baza e mai mica decat 2 sar la "baza_incorecta"
    jl baza_incorecta
    cmp ecx, 16			; daca baza e mai mare decat 16 sar la "baza_incorecta"
    jg baza_incorecta

    
transformare_baza:
    xor edx, edx	; in edx va fi stocat fiecare rest
    inc ebx			; incrementez contorul
    div ecx			; realizez impartirea
    cmp edx, 9		; daca restul e mai mare decat 9 sar la "caz_litera"
    jg caz_litera
    add edx, 48		; adaug 48 pentru a putea afisa cifrele 0-9 (ASCII)
    mov [vector_rest + 4*(ebx-1)], edx	; adaug elementul in vector
    cmp eax, 0					; verific daca eax se mai poate imparti
    jnz transformare_baza
    jmp afisare

    
caz_litera:
    add edx, 87		; adaug 87 pentru a putea afisa numerele 10-15 ca litere (ASCII)
    mov [vector_rest + 4*(ebx-1)], edx	; adaug elementul in vector
    cmp eax, 0					; verific daca eax se mai poate imparti
    jnz transformare_baza

      
afisare: 
    mov eax, [vector_rest + 4*(ebx-1)]	; copiez in eax fiecare element
    push eax
    call putchar		; afisez ce se gaseste in eax
    add esp, 4
    dec ebx				; decrementez contorul
    cmp ebx, 0			; verific daca mai sunt elemente de afisat
    jnz afisare
    jmp iesire

    
baza_incorecta:
    push mesaj_eroare
    call puts			; afisez mesajul de baza incorecta
    add esp, 4
    jmp iesire

    
iesire:					; programul se termina
    leave
    ret
