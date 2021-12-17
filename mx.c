#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

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
  int position = m->buildPosition;
  int curr_row = position / m->num_cols;
  int curr_col = position % m->num_cols;

  m->matrixAddr[position] = value;
  m->buildPosition = m->buildPosition + 1;
  return m;
}

Matrix* initMatrix( int rows, int cols ) {

  // printf("COLS + ROWS");
  // printf("ROWS %d",rows);
  // printf("COLS %d",cols);
  int size = rows * cols;
  int *p = malloc(sizeof(int*)*size);
  
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

void set( struct Matrix* m,int r,int c,double v){
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

Matrix* mxAdd(Matrix* lhs, Matrix* rhs) {
  //check dimensions
  if (lhs->num_rows != rhs->num_rows || lhs->num_cols != rhs->num_cols) {
    perror("Addition size mismatch.");
  }
  int rows = lhs->num_rows;
  int cols= lhs->num_cols;
  Matrix *result = initMatrix(rows, cols);
  for(int i=0; i < rows; i++) {
    for(int j=0; j < cols; j++) {
        int sum = get(lhs,i,j)+get(rhs,i,j);
        set(result,i,j,sum);
    }
  }

  return result;
}

Matrix *mxSub(Matrix *lhs, Matrix *rhs) 
{
  //check dimensions
  if (lhs->num_rows != rhs->num_rows || lhs->num_cols != rhs->num_cols) {
    perror("Subtraction size mismatch.");
  }
  int rows = lhs->num_rows;
  int cols = lhs->num_cols;
  Matrix *result = initMatrix(rows, cols);
  for(int i=0; i < rows; i++) {
    for(int j = 0; j < cols; j++) {
        int result = get(lhs,i,j)-get(rhs,i,j);
        set(result,i,j,result);
    }
  }
  return result;
}

Matrix *mxMult(Matrix *lhs, Matrix *rhs)
{
  //check dimensions
  if (lhs->num_cols != rhs->num_rows) {
    perror("Multiplication size mismatch.");
  }
  int rows = lhs->num_rows;
  int cols = rhs->num_cols;
  Matrix *result = initMatrix(rows, cols);
  for(int i = 0; i < rows; i++) {
    for(int j = 0 ; j < cols; j++) {
    	for(int k = 0; k < rhs->num_rows; k++) {
    	  set(result,i,j,get(result,i,j) + (get(lhs,i,k) * get(rhs,k,j)));
    	}
    }
  }

  return result;
}

Matrix *mxScale(Matrix *input, int scalar)
{
  int rows = input->num_rows;
  int cols = input->num_cols;
  Matrix *result = initMatrix(rows, cols);
  for(int i = 0; i < rows; i++) {
    for(int j = 0 ; j < cols; j++) {  
    	int product = scalar * get(input,i,j);
    	set(result, i, j, product);
    }
  }
  return result;
}

Matrix *identity(int rows, int cols)
{
  //check dimensions
  if (rows != cols) {
    perror("Matrix size mismatch.");
  }
  Matrix *id = initMatrix(rows, cols);
  for(int i = 0; i < rows; i++) {
    for(int j = 0 ; j < cols; j++) {
      if(rows == cols) {
        set(id, i, j, 1);
      } else {
        set(id, i, j, 0);
      }
    }
  }
  return id;
}

Matrix *rotation2D(double theta)
{
  //translate angle into radians
  const double pi = 4. * atan(1.);
  double rads = (theta * pi) / 180;
  //create rotation matrix
  Matrix *result = initMatrix(2, 2);
  set(result, 0, 0, cos(rads));
  set(result, 0, 1, -sin(rads));
  set(result, 1, 0, sin(rads));
  set(result, 1, 1, cos(rads));
  
  return result;
}

Matrix *rotation3D(double theta)
{
  //translate angle into radians
  const double pi = 4. * atan(1.);
  double rads = (theta * pi) / 180;
  //create rotation matrix
  Matrix *result = initMatrix(3, 3);
  set(result, 0, 0, cos(rads));
  set(result, 0, 1, -sin(rads));
  set(result, 1, 0, sin(rads));
  set(result, 1, 1, cos(rads));
  for(int i = 2; i < 3; i++) {
    for(int j = 2; j < 3; j++ {
      if(i == j) {
        set(result, i, j, 1);
      } else {
        set(result, i, j, 0);
      }
    }
  }
  return result;
}

Matrix* transpose(Matrix* input) {
  //switch rows and cols, get empty(i.e., zeroed matrix of transposed size, then fill)
  int rows = input->num_rows;
  int cols = input->num_cols;

  printf("NOW PRINTING:\nROWS:%d\nCOLS:%d", rows, cols);
  Matrix *result = initMatrix(cols, rows);
  for(int i=0; i<rows; i++) {
    for(int j=0; j<cols; j++) {
        set(result, j,i, get(input,i,j));
    }
  }
  return result;
}

void display(Matrix* input) {
    int row = input->num_rows;
    int col = input->num_cols;
    for(int i = 0; i<row; i++) {
        for(int j=0; j<col; j++) {
          if (j == 0) {
            printf("[ %i,", get(input,i,j));
          } else if (j == col - 1) {
            printf(" %i ]", get(input,i,j));
          } else {
          printf(" %i,", get(input,i,j));
          }
        }
        printf("\n");
    }
}
