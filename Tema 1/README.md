# Convertor baze numerice (Romanian language)



	Introducre in organizarea calculatorului si limbaj de asamblare
	
	Tema 1 - Convertor baze numerice
	
	Badila Gabriel Alin
	323 CA
	
	
	============================================================================
	
	IMPLEMENTARE
	
	Aceasta tema consta in implementarea unui convertor, care primeste un numar 
	in zecimal si baza in care trebuie convertit.

	Tema este realizata pe mai multi pasi:

	1. Salvez numarul si baza in doua registre.
	
	2. Verific daca baza este valida (cuprinsa intre 2 si 16). Daca baza nu este 
	valida afisez mesajul "Baza incorecta", iar programul se termina. Daca baza 
	este valida pornesc procesul de convertire.
	
	3. Imi iau un registru pe care il folosesc drept contor. Incrementez 
	contorul. Realizez impartirea. Daca restul rezultat este un numar cuprins 
	intre 0 si 9 adaug 48 (pentru a putea afisa numerele respective in cod ASCII) 
	si il pun in vector. Daca numarul este cuprins intre 10 si 15 adaug 87 
	(pentru a putea afisa literele corespunzatoare numerelor in ASCII: 10-a, 
	11-b, 12-c, 13-d, 14-e, 15-f) si il pun in vector. Verific daca registrul 
	EAX (in care salvasem initial numarul) a ajuns la 0. Daca a ajuns la 0 sar 
	la labelul de afisare, altfel repet procesul de convertire.
	
	4. In labelul de afisare iau fiecare element din vector, incepand de la 
	coada vectorului, si il afisez. Folosesc contorul prezentat mai sus, pe care 
	il decrementez pana ajunge la 0, pentru a sti cand am terminat de afisat 
	elementele din vector.
	
	5. Programul se termina.
	
	============================================================================
	
	CONCLUZII
	
	Dupa ce am terminat tema mi-am dat seama ca puteam sa implementez acest 
	program mult mai usor, punand resturile direct pe stiva, fara a folosi 
	vectorul, dar am decis sa nu-mi mai schimb implementarea. Punand resturile 
	direct pe stiva, la afisare trebuia doar sa le scot ca asta e rolul stivei, 
	sa le scoata in ordine inversa fata de cum le-ai pus, LIFO (last in, first 
	out).
	
	I-am dat vectorului o marime de 100 de elemente cu toate ca un vector de 
	32 de elemente mi-ar fi fost de ajuns (numerele sunt pe 32 de biti, iar baza 
	minima in care puteau fi convertite este 2, rezulta ca numarul maxim de 
	resturi rezultat este 32).
	
	Cred ca a fost o tema destul de usoara, sper ca si celelalte teme vor fi la 
	fel.
