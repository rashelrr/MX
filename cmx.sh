#!/bin/bash

IN=$1
arrIN=(${IN//./ })
PROGRAM = ${arrIN[0]}

make all
./mx.native "${arrIN[0]}.mx" > "${arrIN[0]}.ll"
llc -relocation-model=pic "${arrIN[0]}.ll" > "${arrIN[0]}.s"
cc -o "${arrIN[0]}.exe" "${arrIN[0]}.s" mx.o -lm
"./${arrIN[0]}.exe"