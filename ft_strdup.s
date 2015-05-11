# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/24 15:16:12 by edelangh          #+#    #+#              #
#    Updated: 2015/03/30 13:29:44 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_strdup
	extern	_malloc
	extern	_ft_memcpy
	extern	_ft_strlen

; rdi rsi rdx

error:
	mov		rax, 0
	jmp		end

_ft_strdup:
	enter	32, 0
	mov		qword [rbp - 8], rdi
	mov		qword [rbp - 16], 0
	mov		qword [rbp - 24], 0
	test	rdi, rdi
	jz		error

getlen:
	call	_ft_strlen
	mov		qword [rbp - 16], rax
	inc		qword [rbp - 16]

malloc:
	mov		rdi, qword [rbp - 16]
	call	_malloc
	test	rax, rax
	jz		end
	mov		qword [rbp - 24], rax

memcpy:
	mov			rdi, qword [rbp - 24]
	mov			rsi, qword [rbp - 8]
	mov			rcx, qword [rbp - 16]
	cmp			rsi, 0
	je			end
	rep			movsb


end:
	mov			rax, qword [rbp - 24]
	leave
	ret

