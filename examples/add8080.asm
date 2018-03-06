0000			JMP 0100    C3 00 01	;Jump to program
...
0100    START:	LDA 0302 	3A 03 02	;Load lowest byte of VAR1
0103			MOV B, A    47			;Store it in B
0104			LDA 0702    3A 07 02	;Load lowest byte of VAR2
0107			ADD A, B    80			;Add A+B
0108			STA LC, A   32 0B 02	;Save to lowest byte of OUT

010B			LDA 0202 	3A 02 02	;Load middle byte of VAR1
010E			MOV B, A    47			;Store it in B
010F			LDA 0702    3A 06 02	;Load middle byte of VAR2
0112			CALL C, O   DC 00 03	;Run ACC if carry flag
0115			ADD A, B    80			;Add A+B
0116			STA LC, A   32 0A 02	;Save to middle byte of OUT
    
0119			LDA 0302 	3A 01 02	;Load higher byte of VAR1
011C			MOV B, A    47			;Store it in B
011D			LDA 0702    3A 05 02	;Load higher byte of VAR2
0120			CALL C, O   DC 00 03	;Run ACC if carry flags
0123			ADD A, B    80			;Add A+B
0124			STA LC, A   32 09 02	;Save to higher byte of OUT
	
0127			LDA 0302 	3A 00 02	;Load highest byte of VAR1
012A			MOV B, A    47			;Store it in B
012B			LDA 0702    3A 04 02	;Load highest byte of VAR2
012E			CALL C, O   DC 00 03	;Run ACC if carry flag
0131			ADD A, B    80			;Add A+B
0132	DONE:	STA LC, A   32 08 02	;Save to highest byte of OUT
...
0200	VAR1:							;First argument - 4 bytes of VAR1
0204	VAR2:							;Second argument - 4 bytes of VAR2
0208	OUT: 							;Output - 4 bytes of OUT
...
0300	ACC:	INR A       3C			;Increment A
0301			RET         C9			;Return
