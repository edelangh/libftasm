#var
CC = gcc
NASM = ~/.brew/bin/nasm
NAME = libfts.a
CFLAGS = -Wall -Wextra -Werror # -ltermcap #-L/usr/X11/lib -lmlx -lXext -lX11
NFLAGS = #-Wall -Wextra -Werror # -ltermcap #-L/usr/X11/lib -lmlx -lXext -lX11
OBJDIR = obj/

SRCS_C = 
SRCS_S = \
		ft_strlen.s \
		ft_strcat.s \
		ft_puts.s \
		ft_isalpha.s \
		ft_isalnum.s \
		ft_isdigit.s \
		ft_isascii.s \
		ft_isprint.s \
		ft_toupper.s \
		ft_tolower.s \
		ft_memset.s \
		ft_memcpy.s \
		ft_strdup.s \
		ft_cat.s \
		ft_memalloc.s \
		ft_atoi.s \
		ft_itoa.s \
		ft_bzero.s \
		ft_strnew.s \
		ft_strjoin.s \
		ft_strfjoin.s \
		ft_strchr.s \
		ft_strsub.s

HEADER = libfts.h
OBJS_C = $(addprefix $(OBJDIR),$(subst .c,.o,$(SRCS_C)))
OBJS_S = $(addprefix $(OBJDIR),$(subst .s,.o,$(SRCS_S)))
OBJS = $(OBJS_C) $(OBJS_S)
INCLUDES = -I.


.PHONY: all clean fclean re proper

all: $(NAME)

$(NAME): $(OBJS) $(HEADER)
	ar rc $(NAME) $(OBJS)
	ranlib $(NAME)

$(OBJS): | $(OBJDIR)

$(OBJDIR)%.o : %.s $(HEADER)
	$(NASM) $(NCFLAGS) -f macho64 $< -o $@

$(OBJDIR)%.o : %.c $(HEADER)
	$(CC) $(CFLAGS) -c $< -o $@ $(INCLUDES)

$(OBJDIR):
	@if [ ! -d "$(OBJDIR)" ]; then \
		mkdir $(OBJDIR);\
		fi

clean:
	rm -rf $(OBJS)
	rm -rf $(OBJDIR)

fclean: clean
	rm -rf $(NAME)

proper: all clean

re: fclean all
