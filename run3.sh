#!/bin/bash
 
make
./mx.native matrix.mx > matrix.ll
llc -relocation-model=pic matrix.ll > matrix.s
cc -o matrix.exe matrix.s mx.o -lm
./matrix.exe
