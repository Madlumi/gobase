mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST))) #D
outname:= $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
init: #D
	echo $(outname) #D
	sed -i 's/^outname:=.*/outname=$(outname)/' makefile #D
	mkdir out #D
	go mod init $(outname) #D
	sed -i '/.*#D.*/d' makefile #D
run:
	go run ./src/...
build:
	go build -o out ./src/...
	mv out/src out/$(outname)
local: build
	mv out/$(outname) ~/scripts/runnable/
clean:
	rm out/$(outname)
install: build
	echo "not implemented"
