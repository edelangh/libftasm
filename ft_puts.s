# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_puts.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/23 18:52:04 by edelangh          #+#    #+#              #
#    Updated: 2015/03/24 15:16:01 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

%define SYSCALL(n) 0x2000000 | n
%define WRITE 4

section .data
	nl		db	10
	null	db	"(null)", 0

section .text
	global	_ft_puts
	extern	_ft_strlen
; rdi rsi rdx
; edi esi edx

_ft_puts:
	push	rbp
	mov		rbp, rsp

	cmp		rdi, 0
	jne		print
	mov		rdi, null

print:
	push	rdi
	call	_ft_strlen
	pop		rdi

	mov		r8, rdi
	push	rdi
	push	rsi
	push	rbx

	mov		rdi, 1
	mov		rsi, r8
	mov		rdx, rax
	mov		rax, SYSCALL(WRITE)
	syscall

printnl:
	mov		rdi, 1
	mov		rsi, nl
	mov		rdx, 1
	mov		rax, SYSCALL(WRITE)
	syscall

	pop		rdi
	pop		rbx
	pop		rsi
	mov		rax, 10

	pop		rbp
	ret
