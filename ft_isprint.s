# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isprint.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/24 14:15:44 by edelangh          #+#    #+#              #
#    Updated: 2015/03/27 18:18:00 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_isprint

; rdi rsi rdx
; edi esi edx
_ft_isprint:
	enter	0, 0

	cmp		edi, ' '
	jl		nope
	cmp		edi, '~'
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
