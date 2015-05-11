# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_cat.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/24 15:45:17 by edelangh          #+#    #+#              #
#    Updated: 2015/03/27 18:15:55 by edelangh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

%define BUFF_SIZE 81
%define SYSCALL(n) 0x2000000 | n
%define READ 3
%define WRITE 4

section		.bss
	buf		resb	BUFF_SIZE

section		.text
	global	_ft_cat

; rdi rsi rdx

_ft_cat:
	enter	0, 0

	bt		rdi, 31 ; check neg
	jc		end		; check neg
	mov		r8, rdi
read_buf:
	mov		rdi, r8
	mov		rsi, buf
	mov		rdx, BUFF_SIZE
	mov		rax, SYSCALL(READ)
	syscall
	jc		end		; Error !
	push	rax

write_buf:
	mov		rdi, 1
	mov		rsi, buf
	mov		rdx, rax
	mov		rax, SYSCALL(WRITE)
	syscall
	pop		rax
	cmp		rax, BUFF_SIZE
	jne		end
	jmp		read_buf

end:
	leave
	ret
