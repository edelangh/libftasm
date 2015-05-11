# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strfjoin.s                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/27 15:02:46 by edelangh          #+#    #+#              #
#    Updated: 2015/03/27 18:48:10 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_strfjoin
	extern	_ft_strjoin
	extern	_free


;rdi, rsi, rdx, rcx
_ft_strfjoin:
	enter	40, 0

	mov		qword [rbp - 8], rdi
	mov		qword [rbp - 16], rsi
	mov		qword [rbp - 24], 0
	mov		dword [rbp - 28], edx
	mov		dword [rbp - 32], ecx

	mov		rdi, qword [rbp - 8]
	mov		rsi, qword [rbp - 16]
	call	_ft_strjoin
	mov		qword [rbp - 24], rax

;free1
	cmp		dword [rbp - 28], 1
	je		endfree1
	mov		rdi, qword [rbp - 8]
	test	rdi, rdi
	jz		endfree1
	call	_free
endfree1:

;free2
	cmp		dword [rbp - 32], 1
	je		endfree2
	mov		rdi, qword [rbp - 16]
	test	rdi, rdi
	jz		endfree2
	call	_free
endfree2:

;end
	mov		rax, qword [rbp - 24]
end:
	leave
	ret
