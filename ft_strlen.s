# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/23 13:24:51 by edelangh          #+#    #+#              #
#    Updated: 2015/03/27 18:37:57 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strlen

; rdi rsi rdx
; edi esi edx
_ft_strlen:
	enter	0, 0

;init
	mov		al, 0
	mov		rcx, 0
	test	rdi, rdi
	jz		end

;strlen
	sub		rcx, 1
	cld
	repne	scasb
	not		rcx
	sub		rcx, 1

end:
	mov		rax, rcx
	leave
	ret
