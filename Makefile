NAME	=	exit
AS	=	as
LD	=	ld
CC	=	$(LD)
AS_FLAGS	= 
LD_FLAGS	=

SRC	=	exit.s
OBJ	=	$(SRC:%.s=$(OBJ_PATH)%.o)
SRC_PATH	=	src/
OBJ_PATH	=	.bin/

all: $(NAME) 

$(OBJ_PATH)%.o: $(SRC_PATH)%.s
	$(AS) $(AS_FLAGS) $< -o $@

$(OBJ_PATH):
	mkdir $(OBJ_PATH)

$(NAME): $(SRC_PATH) $(OBJ_PATH) $(OBJ) Makefile
	$(LD) $(LD_FLAGS) $(OBJ) -o $(NAME)

clean:
	rm -rf $(OBJ_PATH)

fclean: clean
	rm -f $(NAME)

re: fclean all

FORCE:

.PHONY: all clean fclean re FORCE
