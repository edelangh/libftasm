# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_tolower.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/24 14:24:18 by edelangh          #+#    #+#              #
#    Updated: 2015/03/24 14:27:17 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_tolower

; rdi rsi rdx
; edi esi edx

_ft_tolower:
	push	rbp
	mov		rbp, rsp

	mov		rax, rdi
	cmp		edi, 'A'
	jl		nope
	cmp		edi, 'Z'
	jg		nope
	jmp		yep

yep:
	add		rax, 32
	jmp		end
nope:
;	mov		rax, 0
	jmp		end
end:
	pop		rbp
	ret
