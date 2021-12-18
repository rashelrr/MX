#!/bin/bash

make 
./mx.native hello.mx > hello.ll
llc -relocation-model=pic hello.ll > hello.s
cc -o hello.exe hello.s
./hello.exe
