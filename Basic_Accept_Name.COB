      ******************************************************************
      * Author: Murat KUÞ
      * Date: 05/06/2023
      * Purpose: Training
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ACCEPT-NAME.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  USER-NAME   PIC X(20) VALUE SPACES.

       PROCEDURE DIVISION.
       000-MAIN-PROCEDURE.
           PERFORM 100-ACCEPT-NAME.
           PERFORM 200-HELLO.
               STOP RUN.

       100-ACCEPT-NAME.
           DISPLAY "PLEASE ENTER YOUR NAME: "
           ACCEPT USER-NAME.
       200-HELLO.
           DISPLAY "HELLO " USER-NAME.
