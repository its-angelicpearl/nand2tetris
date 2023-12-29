// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//// Replace this comment with your code.

   @status
   M=-1 	// status=0xFFFF
   D=0		// Argumento - A que colocar los bits de la pantalla
   @SETSCREEN
   0;JMP

(LOOP)
   @KBD
   D=M		// D = Caracter del teclado actual
   @SETSCREEN
   D;JEQ	// Si no se presiona alguna tecla, coloca los bits a cero (blanco)
   D=-1		// Si se presiona alguna tecla, coloca los bits a 1 (negro)

(SETSCREEN)	// Coloca D=new status antes de saltar aqui
   @ARG
   M=D
   @status	// Guarda el nuevo argumento de status
   D=D-M	// FFFF=negro, 0=blanco - estado de la pantalla entera
   @LOOP
   D;JEQ	// No hagas nada si el nuevo estado == antiguo estado

   @ARG
   D=M
   @status
   M=D		// status = ARG

   @SCREEN
   D=A		// D=Direccion de la pantalla
   @8192
   D=D+A	// D=Byte justo despues de la ultima direccion de pantalla
   @i
   M=D		// i=Direccion de la pantalla

(SETLOOP)
   @i
   D=M-1
   M=D		// i=i-1
   @LOOP
   D;JLT	// Si i<0 goto LOOP

   @status
   D=M		//D=status
   @i
   A=M		// Indirecta
   M=D		//M[direccion de pantalla actual]=status
   @SETLOOP
   0;JMP
