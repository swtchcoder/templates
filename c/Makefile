include config.mk

SRC=$(shell find source -name '*.c')
OBJ=$(SRC:.c=.o)
CFLAGS=$(BASE_CFLAGS)

all: .clangd release

.clangd: config.mk
	printf "CompileFlags:\n" > .clangd
	printf "  Add:\n" >> .clangd
	for flag in $(BASE_CFLAGS) $(DEBUG_CFLAGS); do \
		printf "    - %s\n" "$$flag" >> .clangd; \
	done

debug: CFLAGS+=$(DEBUG_CFLAGS)
debug: build

release: CFLAGS+=$(RELEASE_CFLAGS)
release: build

source/%.o: source/%.c
	@echo "CC $<"
	@$(CC) -o $@ $(CFLAGS) -c $<

$(OBJ): config.mk

build: build/$(NAME)
build/$(NAME): $(OBJ)
	@echo "LD build/$(NAME)"
	@mkdir -p build
	@$(CC) -o build/$(NAME) $(OBJ) $(LDFLAGS)

install: release
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f build/$(NAME) $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/$(NAME)

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(NAME)

clean:
	rm -rf build
	rm -f $(OBJ)

.PHONY: all debug release build install clean
