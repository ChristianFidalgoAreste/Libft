NAME = libft.a

AR = ar

ARFLAGS = rcs

CC = CC

CFLAGS = -Wall -Wextra -Werror

SRC = ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c ft_strlen.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c ft_strlcpy.c ft_strlcat.c ft_toupper.c ft_tolower.c ft_strchr.c ft_strrchr.c ft_strncmp.c ft_memchr.c ft_memcmp.c ft_strnstr.c ft_atoi.c ft_calloc.c ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c

OBJS = $(SRC:.c=.o)

BONUSSRC = ft_lstnew_bonus.c ft_lstadd_front_bonus.c ft_lstsize_bonus.c ft_lstlast_bonus.c ft_lstadd_back_bonus.c ft_lstdelone_bonus.c ft_lstclear_bonus.c ft_lstiter_bonus.c ft_lstmap_bonus.c

BONUSOBJS = $(BONUSSRC:.c=.o)

DEPS = $(SRC:.c=.d)

BONUSDEPS = $(BONUSSRC:.c=.d)

BONUSFILE = .bonus

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $(ARFLAGS) $(NAME) $(OBJS)

%.o: %.c Makefile
	$(CC) $(CFLAGS) -MMD -c $< -o $@

clean:
	rm -f $(OBJS) $(BONUSOBJS) $(DEPS) $(BONUSDEPS) $(BONUSFILE)

fclean: clean
	rm -f $(NAME)

re: fclean all

$(BONUSFILE): $(NAME) $(BONUSOBJS)
	touch $(BONUSFILE)
	$(AR) $(ARFLAGS) $(NAME) $(BONUSOBJS) $(OBJS)

bonus: $(BONUSFILE)

.PHONY: all clean fclean re bonus

-include $(DEPS)

-include $(BONUSDEPS)
