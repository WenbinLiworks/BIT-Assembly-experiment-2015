.386
.model flat,stdcall
option casemap:none

;include �������
includelib msvcrt.lib
includelib user32.lib
includelib Kernel32.lib
printf proto c:dword,:vararg
ExitProcess proto stdcall:dword
.data   ;���ݶ�
    dArray dword 20,15,70,30,32,89,12
    ITEMS equ ($-dArray)/4
    szFmt byte 'dArray[%d]=%d',0ah,0;�˴����һЩ��ʼ�����ı�������
    NULL equ 0
    jumpflag byte 0
.data?
    ;�˴����һЩû�г�ʼ�����ı�������

.const
    ;�˴����һЩ��������

.code ;����ο�ʼ
start: 
   mov ecx,ITEMS-1
   i10:xor esi,esi
   mov jumpflag,0
   i20:mov eax,dArray[esi*4]
   mov ebx,dArray[esi*4+4]
   cmp eax,ebx
   jl i30
   mov dArray[esi*4],ebx
   mov dArray[esi*4+4],eax
   mov jumpflag,1
   i30:inc esi
   cmp esi,ecx
   jb i20
   cmp jumpflag,0
   je break1;
   loop i10
   break1:xor edi,edi
   i40:
   invoke printf,offset szFmt,edi,dArray[edi*4]
   inc edi
   cmp edi,ITEMS
   jb i40
   nop
   ;�˴���Ӵ���εĹ��ܴ���
   invoke ExitProcess,NULL;�����˳�
end start;  ����ν���






