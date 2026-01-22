// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

@SCREEN
D=A
@addr
M=D

(LOOP)
    @KBD
    D=M
    @CLEAR
    D;JEQ
    
(BLACKEN)
    @addr
    D=M
    @24576
    D=D-M
    @LOOP
    D;JEQ
    
    @addr
    A=M
    M=-1
    @addr
    M=M+1
    @LOOP
    0;JMP

(CLEAR)
    @addr
    D=M
    @SCREEN
    D=D-A
    @LOOP
    D;JEQ

    @addr
    M=M-1
    A=M
    M=0
    @LOOP
    0;JMP