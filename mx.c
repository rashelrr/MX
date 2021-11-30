#include <stdlib.h>
#include <stdio.h>
#include <string.h>

struct matrix {
  int num_rows;
  int num_cols;
  int** matrixAddr; // accessed [row][col]
  int buildPosition;
};
typedef struct matrix matrix;
