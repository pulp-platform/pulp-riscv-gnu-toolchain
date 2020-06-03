PKG_DIR=$(CURDIR)/install

build:
	./configure --prefix=$(PKG_DIR) --with-arch=rv32imcxgap9 --with-cmodel=medlow --enable-multilib
	make all install
	cp riscv.ld $(PKG_DIR)/riscv32-unknown-elf/lib

strip:
	-find $(PKG_DIR)/libexec | xargs strip
	-find $(PKG_DIR)/bin | xargs strip

checkout:
	git submodule update --init