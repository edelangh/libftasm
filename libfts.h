/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libft.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/03/23 11:14:30 by edelangh          #+#    #+#             */
/*   Updated: 2015/03/27 17:16:58 by edelangh         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFT_H
# define LIBFT_H

#include <string.h>
void	ft_bzero();
size_t	ft_strlen(char *s);
char	*ft_strcat(char *dest, const char *src);
int		ft_puts(const char *s);
int		ft_isalpha(char c);
int		ft_isdigit(char c);
int		ft_isalnum(char c);
int		ft_isascii(char c);
int		ft_isprint(char c);
int		ft_tolower(char c);
int		ft_toupper(char c);
void	*ft_memset(void *s, int c, size_t nb);
void	*ft_memcpy(void *dst, const void *src, size_t nb);
char	*ft_strdup(char *s);
void	ft_cat(int fd);
int		ft_atoi(char *s);
void	*ft_memalloc(size_t size);
char	*ft_itoa(int i);
char	*ft_strnew(size_t i);
char	*ft_strjoin(char *s1, char *s2);
char	*ft_strfjoin(char *s1, char *s2, int f1, int f2);
char	*ft_strchr(char *s, char c);
char	*ft_strsub(char *str, unsigned int start, size_t len);
#endif
