# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalnum.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/24 14:01:07 by edelangh          #+#    #+#              #
#    Updated: 2015/03/27 18:16:39 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_isalnum
	extern	_ft_isdigit
	extern	_ft_isalpha

; rdi rsi rdx
; edi esi edx
_ft_isalnum:
	enter	0, 0

	call	_ft_isdigit
	cmp		rax, 1
	jge		yep

	call	_ft_isalpha
	cmp		rax, 1
	jge		yep
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
