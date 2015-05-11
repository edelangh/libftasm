/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: edelangh <edelangh@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/03/23 11:10:35 by edelangh          #+#    #+#             */
/*   Updated: 2015/03/30 13:11:48 by edelangh         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libfts.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

void	ft_bzero_test()
{
	char	*s1;
	char	*s2;
	char	*s3 = "Salut les amis !";
	int		len = strlen(s3);
	int		c;

	dprintf(1, "bzero test:\n");
	s1 = strdup(s3);
	s2 = strdup(s3);
	ft_bzero(s1, len);
	ft_bzero(NULL, len);
	bzero(s2, len);
	if ((c = memcmp(s1, s2, len)))
		dprintf(1, "Error: diff '%d'\n%s\n%s\n", c, s1, s2);
	else if (len != (int)strlen(s3))
		dprintf(1, "Error:len %d\n", len);
	else
		dprintf(1, "Ok\n");
}

void	ft_strlen_test()
{
	int		len1;
	int		len2;
	char	*s1 = "Salut les amis !\n";

	dprintf(1, "strlen test:\n");
	len1 = ft_strlen(s1);
	len2 = strlen(s1);
	if (len1 != len2)
		dprintf(1, "Error\n");
	else
		dprintf(1, "Ok\n");
	len1 = ft_strlen(NULL);
	len2 = 0; //strlen(NULL);
	if (len1 != len2)
		dprintf(1, "Error\n");
	else
		dprintf(1, "Ok\n");
	len1 = ft_strlen("");
	len2 = strlen("");
	if (len1 != len2)
		dprintf(1, "Error\n");
	else
		dprintf(1, "Ok\n");
}

void	ft_strcat_test()
{
	dprintf(1, "strcat test:\n");
	char	*(tab[4]) = {"Salut ", "les ", "amis !\n", NULL};
	char	*s1;
	char	*s2;
	int		i;

	i = -1;
	s1 = malloc(1000);
	s1[0] = 0;
	s2 = malloc(1000);
	s2[0] = 0;
	while (tab[++i])
	{
		s1 = ft_strcat(s1, tab[i]);
		s2 = strcat(s2, tab[i]);
	}
	if (strcmp(s1, s2))
		dprintf(1, "Error :diff \n'%s'\n'%s'\n", s1, s2);
	else
		dprintf(1, "Ok\n");
	s1 = ft_strcat(NULL, "check");
	dprintf(1, "Ok\n");
}

void	ft_puts_test()
{
	int		res;
	dprintf(1, "puts test:\n");

	res = puts("Salut");
	if (res != ft_puts("Salut"))
		dprintf(1, "diff res:%d\n", res);
	res = puts("");
	if (res != ft_puts(""))
		dprintf(1, "diff res:%d\n", res);
	res = puts("Cool non ? Attention au NULL !");
	if (res != ft_puts("Cool non ? Attention au NULL !"))
		dprintf(1, "diff res:%d\n", res);
	res = puts(NULL);
	if (res != ft_puts(NULL))
		dprintf(1, "diff res:%d\n", res);
	res = puts("On a encore u de la chance !");
	if (res != ft_puts("On a encore u de la chance !"))
		dprintf(1, "diff res:%d\n", res);
}

void	ft_isalpha_test()
{
	char	c = 0;
	dprintf(1, "isalpha test:\n");
	while (++c != 0)
	{
		if (ft_isalpha(c) != ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')))
		{
			dprintf(1, "Error :diff '%d':'%c': res:%d\n", c, c, ft_isalpha(c));
			return ;
		}
	}
	dprintf(1, "Ok\n");
}

void	ft_isdigit_test()
{
	char	c = 0;
	dprintf(1, "isdigit test:\n");
	while (++c != 0)
	{
		if (ft_isdigit(c) != ((c >= '0' && c <= '9')))
		{
			dprintf(1, "Error :diff '%d':'%c': res:%d\n", c, c, ft_isdigit(c));
			return ;
		}
	}
	dprintf(1, "Ok\n");
}

void	ft_isalnum_test()
{
	char	c = 0;
	dprintf(1, "isalnum test:\n");
	while (++c != 0)
	{
		if (ft_isalnum(c) != ((c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')))
		{
			dprintf(1, "Error :diff '%d':'%c': res:%d\n", c, c, ft_isalnum(c));
			return ;
		}
	}
	dprintf(1, "Ok\n");
}

void	ft_isascii_test()
{
	char	c = 0;
	dprintf(1, "isascii test:\n");
	while (++c != 0)
	{
		if (ft_isascii(c) != isascii(c))
		{
			dprintf(1, "Error :diff '%d':'%c': res:%d\n", c, c, ft_isascii(c));
			return ;
		}
	}
	dprintf(1, "Ok\n");
}

void	ft_isprint_test()
{
	char	c = 0;
	dprintf(1, "isprint test:\n");
	while (++c != 0)
	{
		if (ft_isprint(c) != (c >= ' ' && c <= '~'))
		{
			dprintf(1, "Error :diff '%d':'%c': res:%d\n", c, c, ft_isprint(c));
			return ;
		}
	}
	dprintf(1, "Ok\n");
}

void	ft_toupper_test()
{
	char	c = 0;

	dprintf(1, "toupper test:\n");
	while (++c != 0)
	{
		if (ft_toupper(c) != (c >= 'a' && c <= 'z' ? c - 32 : c))
		{
			dprintf(1, "Error :diff '%d':'%c': res:%d\n", c, c, ft_toupper(c));
			return ;
		}
	}
	dprintf(1, "Ok\n");
}

void	ft_tolower_test()
{
	char	c = 0;

	dprintf(1, "tolower test:\n");
	while (++c != 0)
	{
		if (ft_tolower(c) != (c >= 'A' && c <= 'Z' ? c + 32 : c))
		{
			dprintf(1, "Error :diff '%d':'%c': res:%d\n", c, c, ft_tolower(c));
			return ;
		}
	}
	dprintf(1, "Ok\n");
}

void	ft_memset_test()
{
	char	*s1;
	char	*s2;

	dprintf(1, "memset test:\n");
	s1 = malloc(1000);
	bzero(s1, 1000);
	s2 = malloc(1000);
	bzero(s2, 1000);

	s1 = memset(s1, 'a', 100);
	s2 = ft_memset(s2, 'a', 100);
	if (memcmp(s1, s2, 1000))
		dprintf(1, "Error :diff\n");
	else
		dprintf(1, "Ok\n");
	s1 = memset(s1, 'g', 0);
	s2 = ft_memset(s2, 'g', 0);
	if (memcmp(s1, s2, 1000))
		dprintf(1, "Error :diff\n");
	else
		dprintf(1, "Ok\n");
}

void	ft_memcpy_test()
{
	char	*s1;
	char	*s2;

	dprintf(1, "memcpy test:\n");
	s1 = malloc(1000);
	bzero(s1, 1000);
	s2 = malloc(1000);
	bzero(s2, 1000);

	s1 = memcpy(s1, "Salut comment ca va ?", 30);
	s2 = ft_memcpy(s2, "Salut comment ca va ?", 30);
	if (memcmp(s1, s2, 1000))
		dprintf(1, "Error :diff\n");
	else
		dprintf(1, "Ok\n");

	s1 = memcpy(s1, "", 0);
	s2 = ft_memcpy(s2, "", 0);
	if (memcmp(s1, s2, 1000))
		dprintf(1, "Error :diff\n");
	else
		dprintf(1, "Ok\n");
	s1 = ft_memcpy(s1, NULL, 10);
}

void	ft_strdup_test()
{
	char	*s1;
	char	*s2;

	dprintf(1, "strdup test:\n");

	s1 = strdup("Salut comment ca va ?");
	s2 = ft_strdup("Salut comment ca va ?");
	if (strcmp(s1, s2))
		dprintf(1, "Error :diff\n");
	else
		dprintf(1, "Ok\n");

	s1 = strdup("");
	s2 = ft_strdup("");
	if (strcmp(s1, s2))
		dprintf(1, "Error :diff\n");
	else
		dprintf(1, "Ok\n");

	s2 = ft_strdup(NULL);
	if (s2 != NULL)
		dprintf(1, "Error :diff\n");
	else
		dprintf(1, "Ok\n");
}

void	ft_memalloc_test()
{
	void	*s1;
	void	*s2;

	dprintf(1, "memalloc test:\n");
	s1 = malloc(1000);
	bzero(s1, 1000);
	s2 = ft_memalloc(1000);
	dprintf(1, "ptr:%p\n", s2);
	dprintf(1, "ptr:%p\n", s1);
	if (memcmp(s1, s2, 1000))
		dprintf(1, "Error :diff\n");
	else
		dprintf(1, "Ok\n");

	s1 = malloc(0);
	bzero(s1, 0);
	s2 = ft_memalloc(0);
	if (memcmp(s1, s2, 0))
		dprintf(1, "Error :diff\n");
	else
		dprintf(1, "Ok\n");
}

void	ft_strnew_test()
{
	void	*s1;
	void	*s2;

	dprintf(1, "strnew test:\n");
	s1 = malloc(1001);
	bzero(s1, 1001);
	s2 = ft_strnew(1001);
	dprintf(1, "ptr:%p\n", s2);
	dprintf(1, "ptr:%p\n", s1);
	if (memcmp(s1, s2, 1001))
		dprintf(1, "Error :diff\n");
	else
		dprintf(1, "Ok\n");

	s1 = malloc(1);
	bzero(s1, 1);
	s2 = ft_strnew(0);
	if (memcmp(s1, s2, 1))
		dprintf(1, "Error :diff\n");
	else
		dprintf(1, "Ok\n");
}

void	ft_atoi_test()
{
	char	*s1;

	dprintf(1, "atoi test:\n");
	s1 = "987";
	dprintf(1, "%s = %d\n", s1, ft_atoi(s1));
	s1 = "-42";
	dprintf(1, "%s = %d\n", s1, ft_atoi(s1));
	s1 = "7";
	dprintf(1, "%s = %d\n", s1, ft_atoi(s1));
	s1 = "0";
	dprintf(1, "%s = %d\n", s1, ft_atoi(s1));
	s1 = NULL;
	dprintf(1, "%s = %d\n", s1, ft_atoi(s1));
}

void	ft_itoa_test()
{
	int		s1;

	dprintf(1, "itoa test:\n");
	s1 = 987;
	dprintf(1, "%d = %s\n", s1, ft_itoa(s1));
	s1 = -42;
	dprintf(1, "%d = %s\n", s1, ft_itoa(s1));
	s1 = 7;
	dprintf(1, "%d = %s\n", s1, ft_itoa(s1));
	s1 = 0;
	dprintf(1, "%d = %s\n", s1, ft_itoa(s1));
	s1 = -1000;
	dprintf(1, "%d = %s\n", s1, ft_itoa(s1));
	s1 = -2000;
	dprintf(1, "%d = %s\n", s1, ft_itoa(s1));
	s1 = -3500;
	dprintf(1, "%d = %s\n", s1, ft_itoa(s1));
}

void	ft_strjoin_test()
{
	char	*s1;
	char	*s2;

	dprintf(1, "strjoin test:\n");
	s1 = "Salut ";
	s2 = "les amis";
	dprintf(1, "'%s' + '%s' = '%s'\n", s1, s2, ft_strjoin(s1, s2));
	s1 = "Salut les amis";
	s2 = " !!!";
	dprintf(1, "'%s' + '%s' = '%s'\n", s1, s2, ft_strjoin(s1, s2));
	s1 = "";
	s2 = "les amis";
	dprintf(1, "'%s' + '%s' = '%s'\n", s1, s2, ft_strjoin(s1, s2));
	s1 = NULL;
	s2 = "les amis";
	dprintf(1, "'%s' + '%s' = '%s'\n", s1, s2, ft_strjoin(s1, s2));
	s1 = "Salut ";
	s2 = NULL;
	dprintf(1, "'%s' + '%s' = '%s'\n", s1, s2, ft_strjoin(s1, s2));
}

void	ft_strfjoin_test()
{
	char	*s1;
	char	*s2;

	dprintf(1, "strfjoin test:\n");
	s1 = strdup("Salut ");
	s2 = strdup("les amis");
	dprintf(1, "'%s' + '%s' = '%s'\n", s1, s2, ft_strfjoin(s1, s2, 1, 1));
	s1 = strdup("Salut les amis");
	s2 = strdup(" !!!");
	dprintf(1, "'%s' + '%s' = '%s'\n", s1, s2, ft_strfjoin(s1, s2, 1 ,1));
	s1 = strdup("");
	s2 = strdup("les amis");
	dprintf(1, "'%s' + '%s' = '%s'\n", s1, s2, ft_strfjoin(s1, s2, 1, 1));
	s1 = NULL;
	s2 = strdup("les amis");
	dprintf(1, "'%s' + '%s' = '%s'\n", s1, s2, ft_strfjoin(s1, s2, 1, 1));
	s1 = strdup("Salut ");
	s2 = NULL;
	dprintf(1, "'%s' + '%s' = '%s'\n", s1, s2, ft_strfjoin(s1, s2, 1, 1));
}

void	ft_strchr_test()
{
	char	*s1;
	char	c;

	dprintf(1, "strchr test:\n");
	s1 = "salut les amis !";
	c = 'l';
	dprintf(1, "'%c' in '%s' = '%s'\n", c, s1, ft_strchr(s1, c));
	s1 = "salut les lamisl !";
	c = 'l';
	dprintf(1, "'%c' in '%s' = '%s'\n", c, s1, ft_strchr(s1, c));
	s1 = "salut les amis !";
	c = '\0';
	dprintf(1, "'\\0' in '%s' = '%s'\n", s1, ft_strchr(s1, c));
	s1 = "Amis !";
	c = 'l';
	dprintf(1, "'%c' in '%s' = '%s'\n", c, s1, ft_strchr(s1, c));
	s1 = NULL;
	c = 'l';
	dprintf(1, "'%c' in '%s' = '%s'\n", c, s1, ft_strchr(s1, c));
}

void	ft_strsub_test()
{
	char			*str;
	unsigned int	s;
	size_t			len;

	dprintf(1, "strsub test:\n");

	str = "Salut les amis";
	s = 1;
	len = 7;
	dprintf(1, "str:'%s', start:%d, len:%zu res:'%s'\n", str, s, len, ft_strsub(str, s, len));
	str = "Salut les amis";
	s = 5;
	len = 7;
	dprintf(1, "str:'%s', start:%d, len:%zu res:'%s'\n", str, s, len, ft_strsub(str, s, len));
	str = "Salut les amis";
	s = 0;
	len = 7;
	dprintf(1, "str:'%s', start:%d, len:%zu res:'%s'\n", str, s, len, ft_strsub(str, s, len));
	str = "Salut les amis";
	s = 0;
	len = 0;
	dprintf(1, "str:'%s', start:%d, len:%zu res:'%s'\n", str, s, len, ft_strsub(str, s, len));
	str = NULL;
	s = 5;
	len = 7;
	dprintf(1, "str:'%s', start:%d, len:%zu res:'%s'\n", str, s, len, ft_strsub(str, s, len));
	str = "Salut les amis";
	s = 5;
	len = 0;
	dprintf(1, "str:'%s', start:%d, len:%zu res:'%s'\n", str, s, len, ft_strsub(str, s, len));
}

int		main(void)
{
	ft_bzero_test();
	ft_strlen_test();
	ft_strcat_test();
	ft_puts_test();
	ft_isalpha_test();
	ft_isdigit_test();
	ft_isalnum_test();
	ft_isascii_test();
	ft_isprint_test();
	ft_tolower_test();
	ft_toupper_test();
	ft_memset_test();
	ft_memcpy_test();
	ft_strdup_test();
	ft_memalloc_test();
	ft_strnew_test();
	ft_atoi_test();
	ft_itoa_test();
	ft_strjoin_test();
	ft_strfjoin_test();
	ft_strchr_test();
	ft_strsub_test();
	return (0);
}
