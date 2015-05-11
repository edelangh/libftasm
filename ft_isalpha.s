# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalpha.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/24 13:32:05 by edelangh          #+#    #+#              #
#    Updated: 2015/03/27 18:16:54 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_isalpha

; rdi rsi rdx
; edi esi edx

_ft_isalpha:
	enter	0, 0

	cmp		edi, 'a'
	jge		ismin
	cmp		edi, 'A'
	jge		ismaj
	jmp		nope

ismaj:
	cmp		edi, 'Z'
	jle		yep
	jmp		nope
ismin:
	cmp		edi, 'z'
	jle		yep
	jmp		nope
yep:
	mov		rax, 1
	jmp		end
nope:
	mov		rax, 0
	jmp		end
end:
	leave
	ret
