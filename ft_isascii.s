# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isascii.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/24 14:09:11 by edelangh          #+#    #+#              #
#    Updated: 2015/03/30 13:13:47 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_isascii

; rdi rsi rdx
; edi esi edx
_ft_isascii:
	enter	0, 0

	cmp		edi, 0
	jl		nope
	cmp		edi, 127
	
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
