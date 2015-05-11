# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_atoi.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/26 14:01:28 by edelangh          #+#    #+#              #
#    Updated: 2015/03/27 18:18:47 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global	_ft_atoi

;rdi rsi rdx

isneg:
	mov		rcx, 1
	inc		rbx
	jmp		while

_ft_atoi:
	enter	0, 0

	mov		rax, 0
	test	rdi, rdi
	jz		end
	push	rbx
	mov		rbx, 0

	cmp		byte [rdi + rbx], '-'
	je		isneg
	mov		rcx, 0

while:
	cmp		byte [rdi + rbx], '9'
	jg		endwhile
	cmp		byte [rdi + rbx], '0'
	jl		endwhile

	imul	rax, 10
	add		al, [rdi + rbx]
	sub		al, '0'
	inc		rbx
	jmp		while

endwhile:
	cmp		rcx, 0
	je		signed
	neg		rax
signed:
	pop		rbx
end:
	leave
	ret
