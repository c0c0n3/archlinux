
BIN = bin
sources = $(wildcard src/*)
src-tar = $(BIN)/src.tar
src-2-tar = src/bahamas-font src/gtk-3.0


$(src-tar) : $(sources)
	mkdir -p $(BIN)
	tar cf $(src-tar) --transform='s,src/,,' $(src-2-tar) 
	cp src/malys-inversio.install $(BIN)/
	cp src/PKGBUILD $(BIN)/

	cd $(BIN) && makepkg -g >> PKGBUILD   # NB this generates the MD5
	cd $(BIN) && makepkg

	@echo "************************************************************"
	@echo "    To install the package: cd bin && pacman -U <pkg>.xz    "

.PHONY : all
all : $(src-tar)

.PHONY : clean
clean :
	rm -rf $(BIN)

