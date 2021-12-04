#!/bin/bash

make
./mx.native "$1.mx" > "$1.ll"
llc -relocation-model=pic "$1.ll" > "$1.s"
cc -o "$1.exe" "$1.s" mx.o
"./$1.exe"