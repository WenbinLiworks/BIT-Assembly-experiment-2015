STACKS SEGMENT STACK'S'
	DW 64 DUP('ST')
STACKS ENDS
DATA SEGMENT
BUFFER DB 60,?,60 DUP(?)  ;���뻺����
PRINT DB 'Please input a string:','$'  ;Ҫ�����ʾ��Ϣ
CRLF  DB 0DH,0AH,'$'
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA,SS:STACKS
MAIN PROC FAR
     MOV AX,DATA
     MOV DS,AX
     MOV AH,9               ;���һ����ʾ��Ϣ
     LEA DX,PRINT
     INT 21H
     MOV AH,0AH             ;����һ���ַ���
     LEA DX,BUFFER
     INT 21H
     MOV AH,9               ;����س����з�����ʹ���ͣ��������
     LEA DX,CRLF
     INT 21H
     MOV CL,BUFFER+1         ;ȡ���յ����ַ���CX��
     XOR CH,CH
     LEA SI,BUFFER+2         ;SIָ����յ��ĵ�һ���ַ�
     MOV AH,2
A3:  MOV DL,[SI]             ;װ��SIָ����ַ�

	 CMP DL,[SI-1]          
	 JE ACT2
	 
	 INT 21H                 ;��ʾװ����ַ�
ACT2:
	 INC SI
     LOOP A3                 ;ѭ��
	 MOV AX,4C00H 
	 INT 21H
MAIN ENDP
CODE ENDS
     END MAIN     
     
    
CODE ENDS
    END START
