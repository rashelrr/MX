#include <stdlib.h>
#include <stdio.h>
#include <string.h>

static void die (const char *message)
{
    perror (message);
    exit (1);
}

struct matrix 
{
  int num_rows;
  int num_cols;
  int** matrixAddr; // accessed [row][col]
  int buildPosition;
};
typedef struct matrix matrix;

int debug = 0;

matrix *initMatrix (int *list_of_values, int num_rows, int num_cols)
{
	int **matrixValues = malloc (num_rows * num_cols * sizeof (int *));
	
	//set all values in the matrix equal to 0 if the list of values is NULL
	if (list_of_values == NULL)
	{
		for (int r = 0; r < num_rows; r++)
		{
			for (int c = 0; c < num_cols; c++)
			{
				matrixValues [c + (r * num_cols)] = 0;
			}
		}
	}
	
	//or load values from list of values
	else
	{
		for (int r = 0; r < num_rows; r++)
		{
			for (int c = 0; c < num_cols; c++)
			{
				int i = c + (r * num_cols);
				matrixValues[i] = list_of_values[i];
			}
		}
	}
	
	//return ptr to matrix struct
	matrix *res = malloc (sizeof (struct matrix));
	res -> num_cols = num_cols;
	res -> num_rows = num_rows;
	res -> matrixAddr = matrixValues;
	res -> buildPosition = 0;
	return res;
}

matrix *storeVal (matrix *target, int value) 
{
	int position = target -> buildPosition;
	int curr_row = position / target -> num_cols;
	int curr_col = position % target -> num_cols;
	
	target -> matrixAddr[position] = value;
	target -> buildPosition = target -> buildPosition + 1;
	return target;
}

matrix *initMatrix_CG (int num_rows, int num_cols)
{
	return initMatrix (NULL, num_rows, num_cols);
}

matrix *mxplus (matrix *lhs, matrix *rhs)
{
	//verify dimensions
	if (lhs -> nums_rows != rhs -> num_rows || lhs -> num_cols != rhs -> num_cols)
	{
		die ("matrix addition size mismatch");
	}
	
	int rows = lhs -> num_rows;
	int cols = rhs -> num_cols;
	matrix *res = initMatrix (NULL, rows, cols);
	for (int i = 0; i < rows; i++)
	{
		for (int j = 0; j < cols; j++)
		{
			int sum = lhs -> matrixAddr[i][j] + rhs -> matrixAdrr[i][j];
			res -> matrixAddr[i][j] = sum;
		}
	}
	return res;
}

matrix *mxminus (matrix *lhs, matrix *rhs)
{
	//verify dimensions
	if (lhs -> nums_rows != rhs -> num_rows || lhs -> num_cols != rhs -> num_cols)
	{
		die ("matrix subtraction size mismatch");
	}
	
	int rows = lhs -> num_rows;
	int cols = rhs -> num_cols;
	matrix *res = initMatrix (NULL, rows, cols);
	for (int i = 0; i < rows; i++)
	{
		for (int j = 0; j < cols; j++)
		{
			int sub = lhs -> matrixAddr[i][j] - rhs -> matrixAdrr[i][j];
			res -> matrixAddr[i][j] = sub;
		}
	}
	return res;
}

matrix *mxmx (matrix *lhs, matrix *rhs)
{
	//verify dimensions
	if (lhs -> num_cols != rhs -> num_rows)
	{
		die ("matrix multiplication dimensions mismatch");
	}
	int rows = lhs -> num_rows;
	int cols = rhs -> num_cols;
	matrix *res = initmatrix (NULL, rows, cols);
	for (int i = 0; i < rows; i++)
	{
		for (int j = 0; j < cols; j++)
		{
			for (int k = 0; k < rhs -> num_rows; k++)
			{
				res -> matrixAddr[i][j] += lhs -> matrixAddr[i][k] * rhs -> matrixAddr[k][j];
			}
		}
	}
	return res;
}

matrix *mxScale (int scalar, matrix *input)
{

	int rows = input -> num_rows;
	int cols = input -> num_cols;
	matrix *res = initmatrix (NULL, rows, cols);
	for (int i = 0; i < rows; i++)
	{
		for (int j = 0; j < cols; j++)
		{
			for (int k = 0; k < rhs -> num_rows; k++)
			{
				int prod = scalar * input -> matrixAddr[i][j];
				res -> matrixAddr[i][j] = prod;
			}
		}
	}
	return res;
}

matrix *transpose(matrix *input)
{
	int rows = input -> num_rows;
	int cols = input -> num_cols;
	matrix *res = initMatrix (NULL, rows, cols);
	
	for (int i = 0; i < rows; i++)
	{
		for (int j = 0; j < cols; j++)
		{
			res -> matrixAddr[i][j] = input -> matrixAddr[j][i];
		}
	}
	
	return res;
}	

