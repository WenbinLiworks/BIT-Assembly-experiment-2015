.386
.model flat,stdcall
option casemap:none
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;include
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
includelib Kernel32.lib
includelib user32.lib
includelib msvcrt.lib
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;��������
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
scanf proto c:dword,:vararg
printf proto c:dword,:vararg
ExitProcess proto:dword
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;���ݶ�
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
.data   
    scanf1 dd 0;�������5��16������
    scanf2 dd 0
    scanf3 dd 0
    scanf4 dd 0
    scanf5 dd 0
    
    count1 dd 0;�������
    count2 dd 0
    count3 dd 0
    count4 dd 0
    count5 dd 0
    szInFmtStr byte '%x %x %x %x %x',0;����
    szOutFmtStr byte '%d %d %d %d %d',0;���
.data?
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
.const
	NULL equ 0
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
;�����
;�㷨����
;int BitCount(unsigned int n)
;{
   ; unsigned int c =0 ; // ������
   ; while (n >0)
   ; {
    ;    if((n &1) ==0) // ��ǰλ��1
    ;        ++c ; // ��������1
    ;    n >>=1 ; // ��λ
   ; }
   ; return c ;
;}
;>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
.code 
BitCount proc a:dword

	xor edx,edx;unsigned int c =0 ; // edx������ 
	xor eax,eax 
	mov eax,a
	xor ebx,ebx 
compare:
    mov ebx,1;ebx����������1����1�����߼���
	cmp eax,0  ; while (n >0)
	je out_return ;�������0 ֱ���˳����أ��������
	and ebx,eax
	cmp ebx,0
	je right_move  
	shr eax,1
	jmp compare
right_move:
	inc edx
	shr eax,1;
	jmp compare
out_return:
	mov eax,edx
	ret	
BitCount endp
	
start: 
   
    ;�˴���Ӵ���εĹ��ܴ���
    invoke scanf,offset szInFmtStr,offset scanf1,offset scanf2,offset scanf3,offset scanf4,offset scanf5
    invoke BitCount,scanf1
    mov count1,eax
    invoke BitCount,scanf2
    mov count2,eax
    invoke BitCount,scanf3
    mov count3,eax
    invoke BitCount,scanf4
    mov count4,eax
    invoke BitCount,scanf5
    mov count5,eax
    invoke printf,offset szOutFmtStr,count1,count2,count3,count4,count5
    ;��ֹ����
    invoke scanf,offset szInFmtStr,offset scanf1,offset scanf2,offset scanf3,offset scanf4,offset scanf5
    invoke ExitProcess,NULL ;�����˳�
end start;  ����ν���



