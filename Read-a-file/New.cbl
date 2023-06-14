       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADDING-ITEMS.
      *********************************
      *AUTHOR. MURAT KUÞ.
      *DATE-WRITTEN. 15/06/2023.
      *********************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT ITEM-FILE ASSIGN TO
           "C:\Coding etc\Github Cobol\Write-to-a-file\itemfile.dat"           *>Location of the file you want to read
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  ITEM-FILE.
       01  STOCK-ITEMS.
        02 ITEM-NAME PIC X(20) VALUE SPACES.
        02 ITEM-CODE PIC 9(5) VALUE ZEROES.
        02 ITEM-PRICE PIC 9(5)V99 VALUE ZEROES.
        02 ITEM-QTY PIC 9(5) VALUE ZEROES.

       WORKING-STORAGE SECTION.

       01  WS-STOCK-ITEMS.
        02 WS-ITEM-NAME PIC X(20) VALUE SPACES.
        02 WS-ITEM-CODE PIC 9(5) VALUE ZEROES.
        02 WS-ITEM-PRICE PIC 9(5)V99 VALUE ZEROES.
        02 WS-ITEM-QTY PIC 9(5) VALUE ZEROES.
       01  WS-ENDOF PIC A(1).


       PROCEDURE DIVISION.
       OPEN INPUT ITEM-FILE.
           PERFORM UNTIL WS-ENDOF='Y'
               READ ITEM-FILE INTO WS-STOCK-ITEMS
               AT END MOVE 'Y' TO WS-ENDOF
               NOT AT END DISPLAY WS-STOCK-ITEMS
               END-READ
           END-PERFORM
       CLOSE ITEM-FILE.
           STOP RUN.
