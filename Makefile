
.PHONY: leo

export OASIS_HOME=$(shell pwd)
SHELL=/bin/bash

leo:
	echo "include $(shell pwd)/util/make_dir/make.leo" > util/make_dir/make.inc
	source ./util/make_dir/config.leo && cd util/make_dir && make -j 4 -f TopMakefileOasis3 

# This rule matches any target. To compile for an architecture (TARGETNAME) ensure 
# a file called make.TARGETNAME exists in in util/make_dir 
% ::
	echo "include $(shell pwd)/util/make_dir/make.$@" > util/make_dir/make.inc
	cd util/make_dir && make -j 4 -f TopMakefileOasis3 
