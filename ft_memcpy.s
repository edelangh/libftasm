# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/24 14:53:22 by edelangh          #+#    #+#              #
#    Updated: 2015/03/30 13:21:46 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_memcpy

; rdi rsi rdx

_ft_memcpy:
	enter		8, 0

	mov			rax, rdi
	mov			rcx, rdx
	cmp			rdi, 0
	je			end
	cmp			rsi, 0
	je			end
	rep movsb

end:
	leave
	ret

