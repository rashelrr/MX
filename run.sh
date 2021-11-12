#!/bin/bash

make 
./mx.native gcd.mx > gcd.ll
llc -relocation-model=pic gcd.ll > gcd.s
cc -o gcd.exe gcd.s
./gcd.exe
