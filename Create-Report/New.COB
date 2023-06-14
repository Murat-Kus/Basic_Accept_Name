       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADDING-ITEMS.
      *********************************
      *AUTHOR. MURAT KUÞ.
      *DATE-WRITTEN. 15/06/2023.
      *********************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT ITEM-REPORT ASSIGN TO
           "C:\Coding etc\Github Cobol\Create-Report\itemreport.rpt"
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT ITEM-FILE ASSIGN TO
           "C:\Coding etc\Github Cobol\Write-to-a-file\itemfile.dat"           *>Location of the file you want to read
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  ITEM-REPORT.
       01  PRINTLINE PIC X(44).

       FD  ITEM-FILE.
       01  STOCK-ITEMS.
        02 ITEM-NAME PIC X(20) VALUE SPACES.
        02 ITEM-CODE PIC 9(5) VALUE ZEROES.
        02 ITEM-PRICE PIC 9(5)V99 VALUE ZEROES.
        02 ITEM-QTY PIC 9(5) VALUE ZEROES.
        88  WS-ENDOF VALUE 9.

       WORKING-STORAGE SECTION.

       01  PAGE-HEADING.
        02 FILLER PIC X(13) VALUE "ITEM LIST".
       01  PAGE-FOOTING.
        02 FILLER PIC X(15) VALUE SPACE.
        02 FILLER PIC X(7) VALUE "PAGE: ".
        02 PRN-PAGE-NUM PIC Z9.
       01  HEADS PIC X(36) VALUE "CODE         NAME".
       01  ITEM-DETAIL-LINE.
        02 FILLER PIC X VALUE SPACE.
        02 PRN-ITEM-ID PIC 9(5).
        02 FILLER PIC X(4) VALUE SPACE.
        02 PRN-ITEM-NAME PIC X(15).
       01  REPORT-FOOTING PIC X(13) VALUE "END OF REPORT".
       01  LINE-COUNT PIC 99 VALUE ZERO.
       88  NEW-PAGE-REQUIRED VALUE 40 THRU 99.
       01  PAGE-COUNT PIC 99 VALUE ZERO.

       PROCEDURE DIVISION.
       OPEN INPUT ITEM-FILE.
       OPEN OUTPUT ITEM-REPORT
           PERFORM PRINT-PAGE-HEADING
               READ ITEM-FILE
               AT END SET WS-ENDOF TO TRUE
               END-READ
           PERFORM PRINT-REPORT-BODY UNTIL WS-ENDOF
           WRITE PRINTLINE FROM REPORT-FOOTING AFTER
           ADVANCING 5 LINES.

       CLOSE ITEM-FILE, ITEM-REPORT.
           STOP RUN.

           PRINT-PAGE-HEADING.
               WRITE PRINTLINE FROM PAGE-HEADING AFTER ADVANCING PAGE
               WRITE PRINTLINE FROM HEADS AFTER ADVANCING 5 LINES
               MOVE 3 TO LINE-COUNT
               ADD 1 TO PAGE-COUNT.

           PRINT-REPORT-BODY.
               IF NEW-PAGE-REQUIRED
                   MOVE PAGE-COUNT TO PRN-PAGE-NUM
                   WRITE PRINTLINE FROM PAGE-FOOTING AFTER
                   ADVANCING 5 LINES
                   PERFORM PRINT-PAGE-HEADING
               END-IF
               MOVE ITEM-CODE TO PRN-ITEM-ID
               MOVE ITEM-NAME TO PRN-ITEM-NAME
               WRITE PRINTLINE FROM ITEM-DETAIL-LINE AFTER
               ADVANCING 1 LINE
               ADD 1 TO LINE-COUNT
               READ ITEM-FILE
                   AT END SET WS-ENDOF TO TRUE
               END-READ.
