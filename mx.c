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
  int *matrixAddr; // accessed [row][col]
  int buildPosition;
} Matrix;
// typedef struct matrix matrix;


// Matrix *initMatrix(int a){
//   printf("%i\n", a);
//   printf("LMAOOOO \n");
// };

Matrix *store(Matrix *m, int value){  
  int position = m->buildPosition;
  int curr_row = position / m->num_cols;
  int curr_col = position % m->num_cols;

  m->matrixAddr[position] = value;
  m->buildPosition = m->buildPosition + 1;
  return m;
}

Matrix *initMatrix( int rows, int cols ) {

  // printf("COLS + ROWS");
  // printf("ROWS %d",rows);
  // printf("COLS %d",cols);
  int size = rows * cols;
  int *p = malloc(sizeof(int*)*size);
  
  for (int i = 0; i <= size; i++)
  {
    p[i] = 0;
  }

  Matrix *result = malloc(sizeof(struct Matrix));
  result->num_cols = cols;
  result->num_rows = rows;
  result->matrixAddr = p;
  result->buildPosition = 0;
  
  return result;
}

int get(struct Matrix *m, int r, int c){
  //get m[r][c]
  int kill = 0;
  if (r > ((m->num_rows) - 1)){
    perror("row index out of range when setting matrix ");
    kill = 1;
  }
  if (c > ((m->num_cols) - 1)){
    perror("col index out of range when setting matrix ");
    kill = 1;
  }
  if(kill == 1){
    die("");
  }
  int idx = c + (r * (m->num_cols));
  return m->matrixAddr[idx];
}

void set(struct Matrix *m, int r, int c, double v){
  //set m[r][c] to v
  int kill = 0;
  if (r > ((m->num_rows) - 1)){
    perror("row index out of range when setting matrix ");
    kill = 1;
  }
  if (c > ((m->num_cols) - 1)){
    perror("col index out of range when setting matrix ");
    kill = 1;
  }
  if(kill == 1){
    die("");
  }
  int idx = c + (r * (m->num_cols));
  m->matrixAddr[idx]=v;
}

int numCols(Matrix *input) {
  int cols = input->num_cols;
  return cols;
}

int numRows(Matrix *input) {
  int rows = input->num_rows;
  return rows;
}

Matrix *mxAdd(Matrix *lhs, Matrix *rhs) {
  //check dimensions
  if (lhs->num_rows != rhs->num_rows || lhs->num_cols != rhs->num_cols) {
    die("Addition size mismatch.");
  }
  int rows = lhs->num_rows;
  int cols= lhs->num_cols;
  Matrix *result = initMatrix(rows, cols);
  for(int i = 0; i < rows; i++) {
    for(int j = 0; j < cols; j++) {
        int sum = get(lhs, i, j) + get(rhs, i, j);
        set(result, i, j, sum);
    }
  }
  return result;
}

Matrix *mxSub(Matrix *lhs, Matrix *rhs) 
{
  //check dimensions
  if (lhs->num_rows != rhs->num_rows || lhs->num_cols != rhs->num_cols) {
    die("Subtraction size mismatch.");
  }
  int rows = lhs->num_rows;
  int cols = lhs->num_cols;
  Matrix *result = initMatrix(rows, cols);
  for(int i = 0; i < rows; i++) {
    for(int j = 0; j < cols; j++) {
        int res = get(lhs, i, j) - get(rhs, i, j);
        set(result, i, j, res);
    }
  }
  return result;
}

Matrix *mxMult(Matrix *lhs, Matrix *rhs)
{
  //check dimensions
  if (lhs->num_cols != rhs->num_rows) {
    die("Multiplication size mismatch.");
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

Matrix *identity(int dim)
{
  int rows = dim;
  int cols = dim;
  Matrix *result = initMatrix(rows, cols);
  for(int i = 0; i < rows; i++) {
    for(int j = 0 ; j < cols; j++) {
      if(i == j) {
        set(result, i, j, 1);
      } else {
        set(result, i, j, 0);
      }
    }
  }
  return result;
}

Matrix *transpose(Matrix *input) {
  //switch rows and cols, get empty(i.e., zeroed matrix of transposed size, then fill)
  int rows = input->num_rows;
  int cols = input->num_cols;

  Matrix *result = initMatrix(cols, rows);
  for(int i = 0; i < rows; i++) {
    for(int j = 0; j < cols; j++) {
        set(result, j, i, get(input,i,j));
    }
  }
  return result;
}

Matrix *transformation(Matrix *input, int num) {
  //check dimensions
  if(input->num_rows != 2) {
    die("Invalid matrix size for 2D transformations");
  }
  int rows = input->num_rows;
  int cols = input->num_cols;
  Matrix *result = initMatrix(rows, cols);
  Matrix *tmp = initMatrix(2, 2);
  switch(num) {
    case 1 :
      printf("Reflection in line y = x:\n");
      set(tmp, 0, 0, 0);
      set(tmp, 0, 1, 1);
      set(tmp, 1, 0, 1);
      set(tmp, 1, 1, 0);
      result = mxMult(tmp, input);      
      break;
    case 2 :
      printf("Reflection in line y = -x:\n");
      set(tmp, 0, 0, 0);
      set(tmp, 0, 1, -1);
      set(tmp, 1, 0, -1);
      set(tmp, 1, 1, 0);
      result = mxMult(tmp, input);
      break;
    case 3 :
      printf("Reflection in x-axis:\n");
      set(tmp, 0, 0, 1);
      set(tmp, 0, 1, 0);
      set(tmp, 1, 0, 0);
      set(tmp, 1, 1, -1);
      result = mxMult(tmp, input);
      break;
    case 4 :
      printf("Reflection in y-axis:\n");
      set(tmp, 0, 0, -1);
      set(tmp, 0, 1, 0);
      set(tmp, 1, 0, 0);
      set(tmp, 1, 1, 1);
      result = mxMult(tmp, input);
      break;
    case 5 :
      printf("Rotation 90° clockwise:\n");
      set(tmp, 0, 0, 0);
      set(tmp, 0, 1, 1);
      set(tmp, 1, 0, -1);
      set(tmp, 1, 1, 0);
      result = mxMult(tmp, input);
      break;
    case 6 :
      printf("Rotation 180°:\n");
      set(tmp, 0, 0, -1);
      set(tmp, 0, 1, 0);
      set(tmp, 1, 0, 0);
      set(tmp, 1, 1, -1);
      result = mxMult(tmp, input);
      break;
    case 7 :
      printf("Rotation 90° anticlockwise:\n");
      set(tmp, 0, 0, 0);
      set(tmp, 0, 1, -1);
      set(tmp, 1, 0, 1);
      set(tmp, 1, 1, 0);
      result = mxMult(tmp, input);
      break;
    default :
      printf("Invalid input.");
  }
  return result;
}

void display(Matrix *input) {
  int row = input->num_rows;
  int col = input->num_cols;
  printf("\n");
  for(int i = 0; i < row; i++) {
    for(int j = 0; j < col; j++) {
      if (j == 0) {
        printf("[ %i,", get(input, i, j));
      } else if (j == col - 1) {
        printf(" %i ]", get(input, i, j));
      } else {
        printf(" %i,", get(input, i, j));
      }
    }
    printf("\n");
  }
}

void twoFunc(int a, int b){
  printf("%d\n%d\n",a,b);
}
