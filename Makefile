# "make all" builds the executable as well as the "printbig" library designed
# to test linking external code

.PHONY : all
all : mx.native

# "make microc.native" compiles the compiler
#
# The _tags file controls the operation of ocamlbuild, e.g., by including
# packages, enabling warnings
#
# See https://github.com/ocaml/ocamlbuild/blob/master/manual/manual.adoc

mx.native :
	opam exec -- \
	ocamlbuild -use-ocamlfind mx.native

# "make clean" removes all generated files

.PHONY : clean
clean :
	ocamlbuild -clean
	rm -rf testall.log ocamlllvm *.diff *.exe *.s *.ll
