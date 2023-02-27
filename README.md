# MMX-implementation-in-Vivado

1. Context

  Scopul acestui proiect a fost implementarea unitatii aritmetice de tip MMX cu 6 operații, unele mai simple, altele mai complexe, din setul de instrucțiuni MMX x86. 
Tehnologia MMX este o extensie multimedia a procesorului Pentium dezvoltata de Intel. Arhitectura MMX extinde arhitectura Pentium prin adaugarea a 8 regiștrii MMX 
(MM0...MM7), a patru tipuri de date MMX (octeți împachetați, cuvinte împachetate, dublu cuvinte împachetate, cvadruplu) și a 57 de instrucțiuni MMX.

2. Instructiuni

  Cele 6 instructiuni implementate din setul de sunt urmatoarele:
    - MOVD
    - PADDB, PADDW, PADDD, PADDQ
    - PMADDWD
    - PCMPEQW 
    - PAND
    - PSRAB, PSRAW, PSRAD, PSRAQ
    
   Instrucțiunea MOVD (move double word) copiaza datele dintr-un un registru de întregi pe 32 biti sau o locație de memorie de un dublu-cuvant într-un un registru MMX. Daca destinatia este un registru MMX, această instrucțiune zero-extinde valoarea în timp ce o mută. Daca destinația este un registru de 32 biți sau o locație de memorie, această instrucțiune copiaza primii 32 biți ai registrului MMX în destinație.
   
   Instrucțiunile PADDD, PADDB, PADDW și PADDQ (add packed doubleword/byte/word/quadword) adună octeții(B)/cuvintele(W)/dublu-cuvintele(D) utilizând adunare “wrap-around” (nesaturată). Orice transport al sumei este pierdut. Este responsabilitatea programatorului să asigure ca depășirea să nu apară. Acestă instrucțiune produce rezultat corect pentru operanzi de tipul signed si unsigned (presupunând că depășirea nu apare).

   Instructiunea PMADDWD înmulțește cele patru cuvinte din operandul de sursa cu cele patru cuvinte din operandul de destinație pentru a rezulta un produs de patru dublu cuvinte. După aceea adună cele mai putin semnificative două cuvinte și le salvează în primele două dublu-cuvinte(cele mai puțin semnificative) din registrul de destinație. La fel procedează și cu cele mai semnificative dublu-cuvinte.

   Instrucțiunile de comparație împachetate compară destinația(al doilea oprand) cu sursa (primul opeand) pentru a testa egalitatea sau daca unul este mai mare decât celălalt. Instructiunea PCMPEQW compara patru perechi de octeți. Rezultatul comparației (adevarat sau fals) se va afla in cel de al doilea operand (în destinație).

   Instrucțiunea PAND (bitwise logical AND) face același lucru ca și varianta ei de 32 de biți întregi AND, exceptând desigur faptul că operează pe doi operanzi MMX de 64 biți.

   Instrucțiunea PSRAB efectueaza o operație de shiftare la dreapta. În timp ce se shifteaza cuvantul la dreapta, instrucțiunea replica bitul cel mai semnificativ în loc să pună zero. În cazul shiftării logice la dreapta, biții cei mai puțin semnificativi care sunt shiftați sunt pierduți pentru totdeauna.Intrucțiunile PSRAD, PSRAW, PSRAQ procedează în același mod, cu diferența că operează cu cuvinte/dublu-cuvinte/cvadruplu.

3. Design

  Design-ul top level a unitații aritmetice de tip MMX se poate observa în figura de mai jos. Unitatea de control e cea care dă funcționalitatea arhitecturii MMX. Ca intrare are switch-urile, iar ieșirile sunt semnalele care vor controla restul componentelor. Componentele au fost prezentate deja în partea de analiza, iar în acestă figura se pot observa și legăturile dintre componente. Fiecare instrucțiune are o componentă diferită, iar rezultatele intrucțiunilor intră într-un multiplexor care în funcție de selecția dată deunitatea de control va da ieșirea pentru ALU. Rezultatul operației se va scrie într-un registru MMX. Adresa la care se va scrie rezultatul este dată de unitatea de control. Memoria ROM pe 32 biți este folosită doar la instrucțiunea MOVD. Ieșirea din memorie va fi extinsă cu semn la 64 biți, iar prin semnalul AluSrcB se va decide dacă în ALU intră o date dintr-un registru MMX, sau date din memoria ROM.
  Componente necesare: 
- Un numărător pe 5 biți pentru shiftare și un numărător pe 2 biți cu ajutorul căruia afișăm pe afișor câte 16 biți pe rând.
- O memoorie ROM cu cuvinte de 32 biti care va reține date pentru instructiunea MOVD.
- Un bloc de regiștrii care va conține cei 8 regiștrii MMX de 64 biți, notați de la MM0 la MM7. Registrii vor putea fi citiți combinațional și se va putea scrie în ei secvențial. In acesti registrii se vor afla datele de input si tot in acesti registrii se va scrie rezultatul operatiilor.
- O unitate aritmetico-logică care conține componentele pentru instrucțiuni având ca intrare 2 operanzi pe 64 biți citiți din registrii și o intrucțiune data de unitatea de control. Ieșirea din unitatea aritmetico-logică va avea ca ieșire rezultatul operației, iar acest rezultat se va putea vizualiza pe afișor.
- O unitate de control (reprezentată în Figura 1) care va da semnale pentru restul componentelor.
- Câte o componentă separată pentru fiecare instrucțiune

  ![alt text](https://github.com/emmaev9/MMX-implementation-in-Vivado/blob/main/designMMX.png?raw=true)

4. Manual de utilizare
  
  Fisierele sursa si fisierul .BIT trebuie incarcate intr-un nou proiect Vivado, iar ulterior codul trebuie incarcat pe o placuta Basys 3. Placuța Basys 3 dispune de 16 switch-uri, 16 led-uri, 5 butoane și 4 afișoare cu șapte segmente. 
  Unele instrucțiuni folosesc tipul de date pe 64 de biți(cvadruplul) sau pe 32 de biți(dublu cuvantul), display-ul plăcuței dispune de 4 afișoare, adică 16 biți. Așadar, în cazul dublu-cuvantului si cvandruplului se vor afișa biții 16 cate 16, începând de la cel mai puțin semnificativi biți. Pentru afișarea operanzilor se vor folosi switch-ul 4 (W15) și switch-ul 5 (V15). Apasarea butonului BTNR (T17) va afișa biții operanzilor cum am menționat anterior, de la cel mai puțin semnificativi 16 biți la cel mai semnificativi.
  
  Alegerea instructiunii se va face prin switch-urile placutei in felul urmator:
- SW0: PADDB
- SW1: PADDW
- SW2: PADDD
- SW3: PADDQ
- SW4: PMOV
- SW5: PMADDWD
- SW6: PCMPEQW
- SW7: PAND
- SW8: PSRAB
- SW9: PSRAW
- SW10: PSRAD
- SW11: PSRAQ

  Când toate switch-urile vor fi inactive, pe afișor se va putea observa primul operand, sau cel puțin primii 16 biți ai acestuia. Pentru a putea vedea restul biților se va apasa butonul BTNR. De asemenea, când SW14 va fi activat, pe afișor va apărea al doilea operand, biții acestuia putând fi vizualizați în același mod, cu ajutorul butonului.
  Butoanele au urmatoarele functionalitati: 
- btn U18: Reset   
- btn T18: Register Enable (permite scrierea in registru)  
- btn W19: SSD Enable (pentru afisarea pe rand a cate 2 bytes)
- btn T17: Shift Enable (pentru operatia de shiftare)

5. Concluzie

  Scopul acestui proiect a fost să înteleg, în primul rând, ce presupune o unitate aritmetică de tip MMX. După ce am înțeles conceptele de bază a fost destul de ușor să implementez intrucțiunile pe care mi-am propus să le implementez. Mi-a plăcut la acest proiect faptul că nu am fost limitată la un singur mod de implementare, ci am 
avut șansa de a-mi alege propriul mod de a aborda lucrurile și, desigur, am învățat din propriile greșeli.


  



        
