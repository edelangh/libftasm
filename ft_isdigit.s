# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isdigit.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/24 13:56:38 by edelangh          #+#    #+#              #
#    Updated: 2015/03/27 18:17:42 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_isdigit

; rdi rsi rdx
; edi esi edx

_ft_isdigit:
	enter	0, 0

	cmp		edi, '0'
	jl		nope
	cmp		edi, '9'
	jg		nope
	jmp		yep

yep:
	mov		rax, 1
	jmp		end
nope:
	mov		rax, 0
	jmp		end
end:
	leave
	ret
