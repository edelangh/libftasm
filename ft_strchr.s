# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strchr.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/27 15:21:34 by edelangh          #+#    #+#              #
#    Updated: 2015/03/27 15:37:54 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_strchr
	extern	_ft_strlen

; rdi sil
; s, c
error:
	mov		rax, 0
	jmp		end

_ft_strchr:
	enter	16, 0

	mov		qword [rbp - 8], rdi
	mov		qword [rbp - 16], 0

	cmp		rdi, 0
	je		error

; len untill
	mov		al, sil
	mov		rcx, 0
	sub		rcx, 1
	cld
	repne	scasb
	not		rcx
	sub		rcx, 1

checklen:
	mov		qword [rbp - 16], rcx
	mov		rdi, qword [rbp - 8]
	call	_ft_strlen
	cmp		rax, qword [rbp - 16]
	jl		error

	mov		rax, qword [rbp - 16]
	add		rax, qword [rbp - 8]
end:
	leave
	ret
