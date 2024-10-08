# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asaber <asaber@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/12 17:20:56 by asaber            #+#    #+#              #
#    Updated: 2024/09/12 18:33:55 by asaber           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CXX = c++
CXXFLAGS = -std=c++98 -Wall -Wextra -Werror

RM = rm -rf

SRCS = 	src/main.cpp \
		src/network/server.cpp \
		src/network/client.cpp \
		src/network/channels.cpp \
		src/Parse/Parse.cpp \
		src/function_utils/Func_Utils.cpp
OBJS = $(SRCS:.cpp=.o)
NAME = ircserv

SLEEP = sleep 2

ICYAN=\033[1;33m
CYAN=\033[1;32m
END=\033[0m

BANNER = \
"              $(CYAN)	░▒▓█▓▒░ ░▒▓███████▓▒░   ░▒▓██████▓▒░  RC$(END)  \n"\
"              $(CYAN)	░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ $(END)  \n"\
"              $(CYAN)	░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        $(END)  \n"\
"              $(CYAN)	░▒▓█▓▒░ ░▒▓███████▓▒░  ░▒▓█▓▒░        $(END)  \n"\
"              $(CYAN)	░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        $(END)  \n"\
"              $(CYAN)	░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ $(END)  \n"\
"              $(CYAN)	░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓██████▓▒░  $(END)\033[1;40m:Created by YASSIR DON-FREX YASSINE$(END)  \n"\
                                      
                                      



BANNER_LENGTH = 9

%.o : %.cpp
	@echo "$(CYAN)Compiling $<...$(END)"
	@$(CXX) $(CXXFLAGS) -c $< -o $@

all : $(NAME)

$(NAME) : $(OBJS)
	@echo "$(ICYAN)All is compiled:$(END)"
	@$(CXX) $(CXXFLAGS) $(OBJS) -o $(NAME)
	@for i in `seq 1 $(BANNER_LENGTH)`; do \
		echo $(BANNER) | sed -n "$$i p"; \
		sleep 0.02; \
	done
	@sleep 0.5
	@echo "$(ICYAN)Done !$(END)"
	@sleep 0.1
clean :
	@echo "$(ICYAN)Cleaning ...$(END)"
	@sleep 0.2
	@$(RM) $(OBJS)

fclean : clean
	@$(RM) $(NAME)

re : fclean all

.PHONY : all clean fclean re
