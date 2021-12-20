; ModuleID = 'MX'
source_filename = "MX"

%struct.Matrix = type { i32, i32, i32*, i32 }

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.2 = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1
@tmp = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.3 = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.4 = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.5 = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.6 = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.7 = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.8 = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.9 = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.10 = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.11 = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.12 = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.13 = private unnamed_addr constant [47 x i8] c"==============================================\00", align 1
@tmp.14 = private unnamed_addr constant [6 x i8] c"Done!\00", align 1

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

declare %struct.Matrix* @initMatrix(i32, i32)

declare %struct.Matrix* @store(%struct.Matrix*, i32)

declare %struct.Matrix* @display(%struct.Matrix*)

declare %struct.Matrix* @transpose(%struct.Matrix*)

declare %struct.Matrix* @mxAdd(%struct.Matrix*, %struct.Matrix*)

declare %struct.Matrix* @mxSub(%struct.Matrix*, %struct.Matrix*)

declare %struct.Matrix* @mxMult(%struct.Matrix*, %struct.Matrix*)

declare %struct.Matrix* @identity(i32)

declare %struct.Matrix* @mxScale(%struct.Matrix*, i32)

declare %struct.Matrix* @twoFunc(i32, i32)

declare %struct.Matrix* @transformation(%struct.Matrix*, i32)

declare i32 @numCols(%struct.Matrix*)

declare i32 @numRows(%struct.Matrix*)

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
  %g = alloca %struct.Matrix*
  %h = alloca %struct.Matrix*
  %i = alloca %struct.Matrix*
  %j = alloca %struct.Matrix*
  %k = alloca %struct.Matrix*
  %l = alloca %struct.Matrix*
  %colsa = alloca i32
  %colsn = alloca i32
  %rows = alloca i32
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
  %identity = call %struct.Matrix* @identity(i32 3)
  store %struct.Matrix* %identity, %struct.Matrix** %g
  %g51 = load %struct.Matrix*, %struct.Matrix** %g
  %mxScale = call %struct.Matrix* @mxScale(%struct.Matrix* %g51, i32 4)
  store %struct.Matrix* %mxScale, %struct.Matrix** %h
  %e52 = load %struct.Matrix*, %struct.Matrix** %e
  %transformation = call %struct.Matrix* @transformation(%struct.Matrix* %e52, i32 2)
  store %struct.Matrix* %transformation, %struct.Matrix** %i
  %a53 = load %struct.Matrix*, %struct.Matrix** %a
  %numCols = call i32 @numCols(%struct.Matrix* %a53)
  store i32 %numCols, i32* %colsa
  %n54 = load %struct.Matrix*, %struct.Matrix** %n
  %numCols55 = call i32 @numCols(%struct.Matrix* %n54)
  store i32 %numCols55, i32* %colsn
  %n56 = load %struct.Matrix*, %struct.Matrix** %n
  %numRows = call i32 @numRows(%struct.Matrix* %n56)
  store i32 %numRows, i32* %rows
  %rows57 = load i32, i32* %rows
  %tmp = add i32 4, %rows57
  store i32 %tmp, i32* %rows
  %m58 = load %struct.Matrix*, %struct.Matrix** %m
  %printbig = call %struct.Matrix* @display(%struct.Matrix* %m58)
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp, i32 0, i32 0))
  %n59 = load %struct.Matrix*, %struct.Matrix** %n
  %printbig60 = call %struct.Matrix* @display(%struct.Matrix* %n59)
  %printf61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp.3, i32 0, i32 0))
  %f62 = load %struct.Matrix*, %struct.Matrix** %f
  %printbig63 = call %struct.Matrix* @display(%struct.Matrix* %f62)
  %printf64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp.4, i32 0, i32 0))
  %printf65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp.5, i32 0, i32 0))
  %c66 = load %struct.Matrix*, %struct.Matrix** %c
  %printbig67 = call %struct.Matrix* @display(%struct.Matrix* %c66)
  %printf68 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp.6, i32 0, i32 0))
  %d69 = load %struct.Matrix*, %struct.Matrix** %d
  %printbig70 = call %struct.Matrix* @display(%struct.Matrix* %d69)
  %printf71 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp.7, i32 0, i32 0))
  %g72 = load %struct.Matrix*, %struct.Matrix** %g
  %printbig73 = call %struct.Matrix* @display(%struct.Matrix* %g72)
  %printf74 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp.8, i32 0, i32 0))
  %h75 = load %struct.Matrix*, %struct.Matrix** %h
  %printbig76 = call %struct.Matrix* @display(%struct.Matrix* %h75)
  %printf77 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp.9, i32 0, i32 0))
  %i78 = load %struct.Matrix*, %struct.Matrix** %i
  %printbig79 = call %struct.Matrix* @display(%struct.Matrix* %i78)
  %printf80 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp.10, i32 0, i32 0))
  %colsa81 = load i32, i32* %colsa
  %printf82 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %colsa81)
  %printf83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp.11, i32 0, i32 0))
  %colsn84 = load i32, i32* %colsn
  %printf85 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %colsn84)
  %printf86 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp.12, i32 0, i32 0))
  %rows87 = load i32, i32* %rows
  %printf88 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %rows87)
  %printf89 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @tmp.13, i32 0, i32 0))
  %printf90 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @tmp.14, i32 0, i32 0))
  ret i32 0
}
