# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strnew.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/27 12:22:18 by edelangh          #+#    #+#              #
#    Updated: 2015/03/27 18:12:12 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_strnew
	extern	_malloc
	extern	_ft_bzero
; rdi rsi rdx

_ft_strnew:
	enter		24, 0
	inc			rdi

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
