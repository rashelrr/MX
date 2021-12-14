#include <stdlib.h>
#include <stdio.h>
#include <string.h>

//We stole this library from Xirtam and added a bunch of stuff they did not have

int debug = 0;

static void die(const char *message)
{
    perror(message);
    exit(1);

}

typedef struct Matrix {
  int num_rows;
  int num_cols;
  int* matrixAddr; // accessed [row][col]
  int buildPosition;
} Matrix;
// typedef struct matrix matrix;


// Matrix* initMatrix(int a){
//   printf("%i\n", a);
//   printf("LMAOOOO \n");
// };

Matrix* store(Matrix *m, int value){
  printf("LMAOOOO \n");
  printf("%i\n", value);
  printf("LMAOOOO \n");
  
  m->num_cols = 3;
  m->num_rows = 2;
  int position = m->buildPosition;
  int curr_row = position / m->num_cols;
  int curr_col = position % m->num_cols;

  m->matrixAddr[position] = value;
  m->buildPosition = m->buildPosition + 1;
  return m;
}

Matrix* initMatrix( int rows, int cols ) {
  int size = rows * cols;
  int *p = malloc(sizeof(int)*size);
  
  for (int i = 0; i <= size; i++)
  {
    p[i] = 0;
  }

  Matrix* result = malloc(sizeof(struct Matrix));
  result->num_cols = cols;
  result->num_rows = rows;
  result->matrixAddr = p;
  result->buildPosition = 0;
  return result;
}

int get(struct Matrix* m, int r,int c){
  //get m[r][c]
  int kill = 0;
  if (r>((m->num_rows)-1)){
    perror("row index out of range when setting matrix ");
    kill = 1;
  }
  if (c>((m->num_cols)-1)){
    perror("col index out of range when setting matrix ");
    kill = 1;
  }
  if(kill==1){
    die("");
  }
  int idx = c + (r * (m->num_cols));
  return m->matrixAddr[idx];
}

void set( struct matrix* m,int r,int c,double v){
  //set m[r][c] to v
  int kill = 0;
  if (r>((m->num_rows)-1)){
    perror("row index out of range when setting matrix ");
    kill = 1;
  }
  if (c>((m->num_cols)-1)){
    perror("col index out of range when setting matrix ");
    kill = 1;
  }
  if(kill==1){
    die("");
  }
  int idx = c + (r * (m->num_cols));
  m->matrixAddr[idx]=v;
}

void display(Matrix* input) {
    int row = input->num_rows;
    int col = input->num_cols;
    for(int i = 0; i<row; i++) {
        for(int j=0; j<col; j++) {
          if (j == 0) {
            printf("%i", get(input,i,j));
          } else {
          printf(" %i", get(input,i,j));
          }
        }
        printf("\n");
    }
}


