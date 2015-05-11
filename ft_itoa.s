# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_itoa.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/26 14:34:01 by edelangh          #+#    #+#              #
#    Updated: 2015/03/27 18:14:38 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_itoa
	extern	_malloc
;rdi rsi rdx
; deca ; isneg

; divise rax par 10
;	mov		dword [rbp - 4], 10
;	cdq
;	idiv	dword [rbp - 4]
_ft_itoa:
	enter	12, 0
	mov		dword [rbp - 4], 10
	mov		dword [rbp - 8], 0
	mov		rbx, 0
	bt		rdi, 31
	jnc		intlen
	mov		dword [rbp - 8], 1
	neg		rdi
	inc		rbx
intlen:
	mov		rax, rdi
while1:
	cdq
	idiv	dword [rbp - 4]
	inc		rbx
	cmp		rax, 0
	jne		while1
endwhile1:

	inc		rbx			;+1 pour \0
	push	rdi
	mov		rdi, rbx
	call	_malloc
	pop		rdi
	test	rax, rax
	jz end
	dec		rbx
	mov		byte [rax + rbx], 0

	cmp		dword [rbp - 8], 1
	jne		while2_ini
	mov		byte [rax], '-'

while2_ini:
	mov		rcx, rax
	mov		rax, rdi
while2:
	dec		rbx
	cdq
	idiv	dword [rbp - 4]
	mov		byte [rcx + rbx], '0'
	add		byte [rcx + rbx], dl
	cmp		rax, 0
	jne		while2

endwhile2:
	mov		rax, rcx
end:
	leave
	ret
