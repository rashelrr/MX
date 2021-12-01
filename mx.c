#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef struct Matrix {
  int num_rows;
  int num_cols;
  int** matrixAddr; // accessed [row][col]
  int buildPosition;
} Matrix;
// typedef struct matrix matrix;


Matrix* initMatrix(int a){
  printf("LMAOOOO");
};