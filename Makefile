# "make all" builds the executable as well as the "printbig" library designed
# to test linking external code

.PHONY : all
all : mx.native mx.o

# "make microc.native" compiles the compiler
#
# The _tags file controls the operation of ocamlbuild, e.g., by including
# packages, enabling warnings
#
# See https://github.com/ocaml/ocamlbuild/blob/master/manual/manual.adoc

mx.native : mx.bc
	opam exec -- \
	ocamlbuild -use-ocamlfind mx.native -pkgs llvm,llvm.analysis,llvm.bitreader

# "make clean" removes all generated files

mx : mx.c
	cc -o mx -DBUILD_TEST mx.c

mx.bc : mx.c
	clang -emit-llvm -o mx.bc -c mx.c -Wno-varargs

.PHONY : clean
clean :
	ocamlbuild -clean
	rm -rf testall.log ocamlllvm *.diff *.exe *.s *.ll *.bc *.o tests/*.exe tests/*.s tests/*.ll



