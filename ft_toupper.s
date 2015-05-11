# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_toupper.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/24 14:19:17 by edelangh          #+#    #+#              #
#    Updated: 2015/03/24 14:27:08 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_toupper

; rdi rsi rdx
; edi esi edx

_ft_toupper:
	push	rbp
	mov		rbp, rsp

	mov		rax, rdi
	cmp		edi, 'a'
	jl		nope
	cmp		edi, 'z'
	jg		nope
	jmp		yep

yep:
	sub		rax, 32
	jmp		end
nope:
;	mov		rax, 0
	jmp		end
end:
	pop		rbp
	ret
