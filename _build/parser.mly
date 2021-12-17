%{ open Ast %}

%token LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET SEMI COMMA TRANSPOSE
%token PLUS MINUS TIMES DIVIDE ASSIGN EQ
%token IF ELIF ELSE WHILE FOR NOT NOELSE
%token INT BOOL FLOAT STRING CONTINUE BREAK RETURN MATRIX VOID NULL
%token NEQ LT GT LEQ GEQ AND OR
%token MXPLUS MXMINUS MXMX MXSCALE 
%token <int> LITERAL
%token <string> ID FLIT
%token <bool> BLIT
%token <string> STRINGLIT
%token EOF

%nonassoc NOELSE
%nonassoc ELSE
%right ASSIGN 
%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS MXPLUS MXMINUS
%left TIMES DIVIDE MXMX MXSCALE
%right NOT
%left TRANSPOSE

%start program
%type <Ast.program> program

%%
/*test ignore this rashel*/
program: decls EOF { $1 }

decls: /* nothing */ { ([], []) }
| decls vdecl { (($2 :: fst $1), snd $1) }
| decls fdecl { (fst $1, ($2 :: snd $1)) }

fdecl:  typ ID LPAREN formals_opt RPAREN
        LBRACE vdecl_list stmt_list RBRACE {
        { typ = $1; fname = $2; formals = List.rev $4;
          locals = List.rev $7; body = List.rev $8 } }

formals_opt: /* nothing */ { [] }
            | formal_list { $1 }

formal_list: typ ID { [($1,$2)] }
             | formal_list COMMA typ ID { ($3,$4) :: $1 }
             
typ: 
      INT           { Int }
    | BOOL          { Bool }
    | STRING        { String }
    | FLOAT         { Float  }
    | INT MATRIX    { Matrix(Int) }
    | VOID          { Void }  
    
vdecl_list: /* nothing */ { [] }
           | vdecl_list vdecl { $2 :: $1 }

vdecl:
          typ ID SEMI                              { ($1, $2) }
     /*   | typ ID ASSIGN expr SEMI                  { ($1,$2, Assign($2,$4))} 
        | INT   typ ID SEMI                        { ($2, $3) }   int matrix m;
        | FLOAT typ ID SEMI                        { ($2, $3) }  */

matrix_literal:
          LBRACKET row_list RBRACKET                                    { List.rev $2 }            /* ASK TA */

row_list:
          /* nothing */                                                 { [] }
          | LBRACKET elems_list RBRACKET                                { [List.rev $2] }      /* Matrix m = [[1,2,3]] */
          | row_list COMMA LBRACKET elems_list RBRACKET                 { (List.rev $4)::$1 }    /* Matrix m = [[1,2,3],[4,5,6],[7,8,9]] */
                                                                                        /* Matrix m = [,[1,2,3]] */     

elems_list:
            LITERAL                                 { [$1] }
          | elems_list COMMA LITERAL                { $3::$1 }  /* ASK TA */

expr:
    LITERAL                      { Literal($1) }
    | FLIT                       { Fliteral($1) }
    | BLIT                       { BoolLit($1) }
    | ID                         { Id($1) }
    | STRINGLIT                  { Stringlit($1) }
    | matrix_literal             { Mx($1) } 
    | expr PLUS expr             { Binop($1, Add, $3) }
    | expr MINUS expr            { Binop($1, Sub, $3) }
    | expr TIMES expr            { Binop($1, Mult, $3) }
    | expr DIVIDE expr           { Binop($1, Div, $3) }
    | expr MXPLUS expr           { Binop( $1, Mxadd,$3) }
    | expr MXMINUS expr          { Binop( $1, Mxsub, $3) }
    | expr MXMX expr             { Binop( $1, Mxtimes, $3) }
    | expr MXSCALE expr          { Binop( $1, Mxscale, $3) }
    | expr TRANSPOSE             { Unop( Transpose, $1) } /* our transpose operation */
    | expr EQ expr               { Binop($1, Equal, $3) }
    | expr NEQ expr              { Binop($1, Neq, $3) }
    | expr LT expr               { Binop($1, Less, $3) }
    | expr LEQ expr              { Binop($1, Leq, $3) }
    | expr GT expr               { Binop($1, Greater, $3) }
    | expr GEQ expr              { Binop($1, Geq, $3) }
    | expr AND expr              { Binop($1, And, $3) }
    | expr OR expr               { Binop($1, Or, $3) }
    | MINUS expr %prec NOT       { Unop(Neg, $2) }      /*   Ask TA about this */
    | NOT expr                   { Unop(Not, $2) }        
    | ID ASSIGN expr             { Assign($1, $3) }
    | ID LPAREN args_opt RPAREN  { Call($1, $3) }
    | LPAREN expr RPAREN         { $2 }

/* Matrix m = [[1,2,3],[4,5,6]] */

stmt:
    expr SEMI                                                 { Expr $1               }
  | RETURN expr_opt SEMI                                      { Return $2             }
  | LBRACE stmt_list RBRACE                                   { Block(List.rev $2)    }
  | IF LPAREN expr RPAREN stmt %prec NOELSE                   { If($3, $5, Block([])) } 
  | IF LPAREN expr RPAREN stmt ELSE stmt                      { If($3, $5, $7)        }
  | FOR LPAREN expr_opt SEMI expr SEMI expr_opt RPAREN stmt   { For($3, $5, $7, $9)   }
  | WHILE LPAREN expr RPAREN stmt                             { While($3, $5)         }

stmt_list:
    /* nothing */  { [] }
  | stmt_list stmt { $2 :: $1 }

expr_opt:
/* nothing */ { Noexpr }
| expr { $1 }

args_opt:
/* nothing */ { [] }
| args_list { List.rev $1 }

args_list:
expr { [$1] }
| args_list COMMA expr { $3 :: $1 }



