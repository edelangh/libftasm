# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strsub.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/27 15:38:52 by edelangh          #+#    #+#              #
#    Updated: 2015/03/27 18:13:52 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_strsub
	extern	_ft_strnew
	extern	_ft_memcpy

;rdi esi   rdx
;s1  start len
_ft_strsub:
	enter	40, 0

	mov		qword [rbp - 8], rdi
	mov		qword [rbp - 16], 0
	mov		dword [rbp - 16], esi
	mov		qword [rbp - 24], rdx
	mov		qword [rbp - 32], 0

	test	rdi, rdi
	jz		end
	mov		rdi, qword [rbp - 24]
	call	_ft_strnew
	mov		qword [rbp - 32], rax

	mov		rdi, qword [rbp - 32]
	sub		rdi, qword [rbp - 16]
	mov		rsi, qword [rbp - 8]
	mov		rdx, qword [rbp - 24]
	add		rdx, qword [rbp - 16]
	call	_ft_memcpy

end:
	mov		rax, qword [rbp - 32]
	leave
	ret
