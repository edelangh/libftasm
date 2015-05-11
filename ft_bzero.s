# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_bzero.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/23 11:00:46 by edelangh          #+#    #+#              #
#    Updated: 2015/03/26 18:29:12 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_bzero	;defini on function

; rdi rsi rdx

_ft_bzero:
	enter		0, 0
	mov			rbx, rdi
	mov			rax, 0
	mov			rcx, rsi
	cmp			rdi, 0
	je			end
	rep			stosb

end:
	leave
	ret
