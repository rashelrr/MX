; ModuleID = 'MicroC'
source_filename = "MicroC"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@fmt.2 = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1
@tmp = private unnamed_addr constant [13 x i8] c"Hello World!\00", align 1

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

define i32 @main() {
entry:
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @tmp, i32 0, i32 0))
  ret i32 0
}
