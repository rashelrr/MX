#!/bin/bash

IN=$1
arrIN=(${IN//./ })
echo ${arrIN[0]}

# make
# ./mx.native "$1.mx" > "$1.ll"
# llc -relocation-model=pic "$1.ll" > "$1.s"
# cc -o "$1.exe" "$1.s" mx.o -lm
# "./$1.exe"