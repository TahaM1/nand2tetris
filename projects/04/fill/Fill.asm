// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// j = @SCREEN
// i = 8192
// while i > 0:
//      m[j] = -1 or 0
//      j += 1
//      i -= 1

// R0 = J
// R1 = i
// R2 = -1(Black) or 0(white)


(CHECK)
    @KBD
    D=M 
    @BLACK
    D;JNE

(WHITE)
    @R2
    M=0
    @SETUP
    0;JMP

(BLACK)
    @R2
    M=-1
    @SETUP
    0;JMP

(SETUP)
    @SCREEN
    D=A

    // sets R0 to @SCREEN addr
    @R0
    M=D

    @8192
    D=A
    
    // sets R1 to 8192 (# of bytes to colour in)
    @R1
    M=D 

(FILL)
    // jump to check if all pixels coloured
    @CHECK
    D;JLE

    @R2
    D=M
    
    // R2 contains whether to draw white or black pixel
    @R0
    A=M
    M=D

    // increments addr
    @R0
    M=M+1

    // decrements # of pixels left to colour
    @R1
    M=M-1

    D=M

    @FILL
    0;JMP

