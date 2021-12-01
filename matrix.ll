; ModuleID = 'MX'
source_filename = "MX"

%struct.Matrix = type { i32, i32, i32**, i32 }

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@fmt.2 = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1
@tmp = private unnamed_addr constant [6 x i8] c"Done!\00", align 1

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

declare %struct.Matrix* @initMatrix(i32)

define i32 @main() {
entry:
  %m = alloca %struct.Matrix*
  %f = alloca %struct.Matrix*
  %init_matrix = call %struct.Matrix* @initMatrix(i32 2)
  store %struct.Matrix* %init_matrix, %struct.Matrix** %m
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @tmp, i32 0, i32 0))
  ret i32 0
}
