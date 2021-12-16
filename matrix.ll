; ModuleID = 'MX'
source_filename = "MX"

%struct.Matrix = type { i32, i32, i32*, i32 }

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@fmt.2 = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1
@tmp = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.3 = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.4 = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.5 = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.6 = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.7 = private unnamed_addr constant [6 x i8] c"Done!\00", align 1

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

declare %struct.Matrix* @initMatrix(i32, i32)

declare %struct.Matrix* @store(%struct.Matrix*, i32)

declare %struct.Matrix* @display(%struct.Matrix*)

declare %struct.Matrix* @transpose(%struct.Matrix*)

declare %struct.Matrix* @mxAdd(%struct.Matrix*, %struct.Matrix*)

declare %struct.Matrix* @mxSub(%struct.Matrix*, %struct.Matrix*)

declare %struct.Matrix* @mxMult(%struct.Matrix*, %struct.Matrix*)

define i32 @main() {
entry:
  %m = alloca %struct.Matrix*
  %n = alloca %struct.Matrix*
  %f = alloca %struct.Matrix*
  %a = alloca %struct.Matrix*
  %b = alloca %struct.Matrix*
  %c = alloca %struct.Matrix*
  %d = alloca %struct.Matrix*
  %e = alloca %struct.Matrix*
  %init_matrix = call %struct.Matrix* @initMatrix(i32 4, i32 3)
  %store_matrix = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 2)
  %store_matrix1 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 3)
  %store_matrix2 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 4)
  %store_matrix3 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 6)
  %store_matrix4 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 4)
  %store_matrix5 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 5)
  %store_matrix6 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 7)
  %store_matrix7 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 8)
  %store_matrix8 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 1)
  %store_matrix9 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 9)
  %store_matrix10 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 7)
  %store_matrix11 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix, i32 8)
  store %struct.Matrix* %init_matrix, %struct.Matrix** %m
  %init_matrix12 = call %struct.Matrix* @initMatrix(i32 2, i32 3)
  %store_matrix13 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix12, i32 1)
  %store_matrix14 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix12, i32 2)
  %store_matrix15 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix12, i32 4)
  %store_matrix16 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix12, i32 3)
  %store_matrix17 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix12, i32 4)
  %store_matrix18 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix12, i32 5)
  store %struct.Matrix* %init_matrix12, %struct.Matrix** %n
  %init_matrix19 = call %struct.Matrix* @initMatrix(i32 2, i32 3)
  %store_matrix20 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix19, i32 1)
  %store_matrix21 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix19, i32 2)
  %store_matrix22 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix19, i32 4)
  %store_matrix23 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix19, i32 3)
  %store_matrix24 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix19, i32 4)
  %store_matrix25 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix19, i32 5)
  store %struct.Matrix* %init_matrix19, %struct.Matrix** %a
  %init_matrix26 = call %struct.Matrix* @initMatrix(i32 2, i32 2)
  %store_matrix27 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix26, i32 2)
  %store_matrix28 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix26, i32 2)
  %store_matrix29 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix26, i32 2)
  %store_matrix30 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix26, i32 2)
  store %struct.Matrix* %init_matrix26, %struct.Matrix** %e
  %init_matrix31 = call %struct.Matrix* @initMatrix(i32 3, i32 4)
  %store_matrix32 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix31, i32 1)
  %store_matrix33 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix31, i32 2)
  %store_matrix34 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix31, i32 3)
  %store_matrix35 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix31, i32 4)
  %store_matrix36 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix31, i32 4)
  %store_matrix37 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix31, i32 5)
  %store_matrix38 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix31, i32 2)
  %store_matrix39 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix31, i32 3)
  %store_matrix40 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix31, i32 7)
  %store_matrix41 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix31, i32 5)
  %store_matrix42 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix31, i32 2)
  %store_matrix43 = call %struct.Matrix* @store(%struct.Matrix* %init_matrix31, i32 3)
  store %struct.Matrix* %init_matrix31, %struct.Matrix** %f
  %m44 = load %struct.Matrix*, %struct.Matrix** %m
  %transpose = call %struct.Matrix* @transpose(%struct.Matrix* %m44)
  store %struct.Matrix* %transpose, %struct.Matrix** %m
  %a45 = load %struct.Matrix*, %struct.Matrix** %a
  %n46 = load %struct.Matrix*, %struct.Matrix** %n
  %mxAdd = call %struct.Matrix* @mxAdd(%struct.Matrix* %a45, %struct.Matrix* %n46)
  store %struct.Matrix* %mxAdd, %struct.Matrix** %b
  %a47 = load %struct.Matrix*, %struct.Matrix** %a
  %n48 = load %struct.Matrix*, %struct.Matrix** %n
  %mxSub = call %struct.Matrix* @mxSub(%struct.Matrix* %a47, %struct.Matrix* %n48)
  store %struct.Matrix* %mxSub, %struct.Matrix** %c
  %e49 = load %struct.Matrix*, %struct.Matrix** %e
  %n50 = load %struct.Matrix*, %struct.Matrix** %n
  %mxMult = call %struct.Matrix* @mxMult(%struct.Matrix* %e49, %struct.Matrix* %n50)
  store %struct.Matrix* %mxMult, %struct.Matrix** %d
  %m51 = load %struct.Matrix*, %struct.Matrix** %m
  %printbig = call %struct.Matrix* @display(%struct.Matrix* %m51)
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp, i32 0, i32 0))
  %n52 = load %struct.Matrix*, %struct.Matrix** %n
  %printbig53 = call %struct.Matrix* @display(%struct.Matrix* %n52)
  %printf54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp.3, i32 0, i32 0))
  %f55 = load %struct.Matrix*, %struct.Matrix** %f
  %printbig56 = call %struct.Matrix* @display(%struct.Matrix* %f55)
  %printf57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp.4, i32 0, i32 0))
  %b58 = load %struct.Matrix*, %struct.Matrix** %b
  %printbig59 = call %struct.Matrix* @display(%struct.Matrix* %b58)
  %printf60 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp.5, i32 0, i32 0))
  %c61 = load %struct.Matrix*, %struct.Matrix** %c
  %printbig62 = call %struct.Matrix* @display(%struct.Matrix* %c61)
  %printf63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp.6, i32 0, i32 0))
  %d64 = load %struct.Matrix*, %struct.Matrix** %d
  %printbig65 = call %struct.Matrix* @display(%struct.Matrix* %d64)
  %printf66 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @tmp.7, i32 0, i32 0))
  ret i32 0
}
