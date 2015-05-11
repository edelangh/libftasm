# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memalloc.s                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/24 17:12:14 by edelangh          #+#    #+#              #
#    Updated: 2015/03/27 18:14:47 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_memalloc
	extern	_malloc
	extern	_ft_bzero
; rdi rsi rdx

_ft_memalloc:
	enter		24, 0
	mov			rax, 0
	cmp			rdi, 0
	je			end

malloc:

	mov		qword [rbp - 8], rdi
	call	_malloc
	test	rax, rax
	jz		end
	mov		qword [rbp - 16], rax
	mov		rdi, rax
	mov		rsi, qword [rbp - 8]
	call	_ft_bzero
	mov		rax, qword [rbp - 16]
end:
	leave
	ret
