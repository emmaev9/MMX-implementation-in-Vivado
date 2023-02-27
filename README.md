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



        
