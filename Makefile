RELEASE_NAME := $(shell git tag | tail -n 1 | head -c -1)

translations:
	@# Create/update ts files
	lupdate multiupv2.pro
	@# Start Linguist to do the translation work for english
	linguist *.ts
	@# Compile the .qm file
	lrelease multiupv2.pro

build:
	mkdir -p ./build

poc:
	mkdir -p ./poc

compile: build
	cd ./build && qmake ../multiupv2.pro && make -j

clean:
	rm -rf ./build
	rm *.tar.gz

deb:
	./make_deb_package.sh

gnulinux_archive: compile poc
	@echo Build archive for $(RELEASE_NAME)
	tar cjvf poc/multiup-manager_gnulinux_$(RELEASE_NAME).tar.gz ./build/multiup

release: gnulinux_archive deb
