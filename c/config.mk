NAME=project
CC=cc
BASE_CFLAGS=-Wall -Wextra -pedantic -std=c99 -D_POSIX_C_SOURCE=200809L -I$(PWD)/include '-DNAME="$(NAME)"'
DEBUG_CFLAGS=-g -O0 -DDEBUG
RELEASE_CFLAGS=-Os
LDFLAGS=
