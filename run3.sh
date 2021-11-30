#!/bin/bash

make 
./mx.native matrix.mx > matrix.ll
llc -relocation-model=pic matrix.ll > matrix.s
cc -o matrix.exe matrix.s
./matrix.exe
