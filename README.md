# Basic_Accept_Name
Explanation of the COBOL program

TL;DR

The COBOL program ACCEPT-NAME prompts the user to enter their name, accepts the input, and displays a greeting message.


Explanation

The COBOL program ACCEPT-NAME is a simple program that prompts the user to enter their name, accepts the input, and displays a greeting message.

The program starts with the IDENTIFICATION DIVISION and PROGRAM-ID statements, which identify the program and its author and purpose.

The DATA DIVISION declares the WORKING-STORAGE SECTION, which includes the USER-NAME variable, a 20-character string initialized to spaces.

The PROCEDURE DIVISION contains the main procedure, 000-MAIN-PROCEDURE, which calls two subroutines: 100-ACCEPT-NAME and 200-HELLO.

The 100-ACCEPT-NAME subroutine displays the message "PLEASE ENTER YOUR NAME: " and waits for the user to enter their name. The ACCEPT statement reads the user's input and stores it in the USER-NAME variable.

The 200-HELLO subroutine displays the message "HELLO " followed by the value of the USER-NAME variable.

Finally, the STOP RUN statement terminates the program.
