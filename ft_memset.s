# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memset.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/24 14:40:20 by edelangh          #+#    #+#              #
#    Updated: 2015/03/24 14:55:04 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_memset

; rdi rsi rdx

_ft_memset:
	push		rbp
	mov			rbp, rsp

	mov			rbx, rdi
	mov			rax, rsi
	mov			rcx, rdx
	cmp			rdi, 0
	je			end
	rep			stosb

end:
	mov			rax, rbx
	mov			rsp, rbp
	pop			rbp
	ret
