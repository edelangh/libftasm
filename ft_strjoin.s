# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strjoin.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/27 14:45:05 by edelangh          #+#    #+#              #
#    Updated: 2015/03/27 18:40:25 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_strjoin
	extern	_ft_strcat
	extern	_malloc
	extern	_ft_strlen

_ft_strjoin:
	enter	40, 0

	mov		qword [rbp - 8], rdi
	mov		qword [rbp - 16], rsi
	mov		qword [rbp - 24], 1
	mov		qword [rbp - 32], rax

	call	_ft_strlen
	add		qword [rbp - 24], rax

	mov		rdi, qword [rbp - 16]
	call	_ft_strlen
	add		qword [rbp - 24], rax

	mov		rdi, qword [rbp - 24]
	call	_malloc
	mov		qword [rbp - 32], rax
	test	rax, rax
	jz		end

	mov		rdi, qword [rbp - 32]
	mov		rsi, qword [rbp - 8]
	call	_ft_strcat

	mov		rdi, qword [rbp - 32]
	mov		rsi, qword [rbp - 16]
	call	_ft_strcat

	mov		rax, qword [rbp - 32]
end:
	leave
	ret
