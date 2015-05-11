# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcat.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/23 14:23:52 by edelangh          #+#    #+#              #
#    Updated: 2015/03/27 15:01:30 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strcat

; rdi rsi rdx
_ft_strcat:
	push	rbp
	mov		rbp, rsp

	test	rdi, rdi
	jz		end
	test	rsi, rsi
	jz		end
	mov		rbx, rdi
	mov		rcx, rsi

loop1:
	cmp		byte [rbx], 0
	je		loop2
	inc		rbx
	jmp		loop1

loop2:
	cmp		byte [rcx], 0
	je		end
	mov		al, byte [rcx]
	mov		byte [rbx], al
	inc		rcx
	inc		rbx
	jmp		loop2

end:
	mov		rax, rdi
	leave
	ret
