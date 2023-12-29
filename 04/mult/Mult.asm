@R2
M=0 // R2 = 0

@R1
D=M // D = R1
@i 
M=D // i = D = R1

(LOOP)
@i
D=M     // D = i
@END    // A = @END
D;JLE   // if (i <= 0) goto END

@R0     // A = R0
D=M     // D = R0
@R2
M=D+M   // R2 = D + R2 = R0 + R2

@i
D=M     // D = i
M=D-1   // i = D - 1 = i - 1

@LOOP
0;JMP   // goto LOOP

(END)
@END
0;JMP  // loop infinito 
