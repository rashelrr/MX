; ModuleID = 'MX'
source_filename = "MX"

%struct.Matrix = type { i32, i32, i32*, i32 }

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@fmt.2 = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1
@tmp = private unnamed_addr constant [6 x i8] c"Done!\00", align 1

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

declare %struct.Matrix* @initMatrix(i32, i32)

declare %struct.Matrix* @store(%struct.Matrix*, i32)

declare %struct.Matrix* @display(%struct.Matrix*)

define i32 @main() {
entry:
  %m = alloca %struct.Matrix*
  %f = alloca %struct.Matrix*
  %init_matrix = call %struct.Matrix* @initMatrix(i32 4, i32 2)
  %store_matrix = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 2)
  %store_matrix1 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 3)
  %store_matrix2 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 6)
  %store_matrix3 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 4)
  %store_matrix4 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 7)
  %store_matrix5 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 8)
  %store_matrix6 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 9)
  %store_matrix7 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 7)
  store %struct.Matrix* %init_matrix, %struct.Matrix** %m
  %m8 = load %struct.Matrix*, %struct.Matrix** %m
  %printbig = call %struct.Matrix* @display(%struct.Matrix* %m8)
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @tmp, i32 0, i32 0))
  ret i32 0
}
