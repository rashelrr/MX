%{ open Ast %}

%token LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET SEMI COMMA
%token PLUS MINUS TIMES DIVIDE ASSIGN EQ
%token IF ELIF ELSE WHILE FOR NOT
%token INT BOOL FLOAT STRING CONTINUE BREAK RETURN MATRIX VOID TRUE FALSE NULL
%token NEQ LT GT LEQ GEQ AND OR
%token MXPLUS MXMINUS MXMX MXSCALE 
%token <int> LITERAL
%token <string> ID FLIT
%token <array> MX
%token <string> STRINGLIT
%token EOF 

%left SEMI
%left IF ELSE ELIF
%right ASSIGN 
%left PLUS MINUS
%left TIMES DIVIDE

%start program
%type <Ast.program> program

%%

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
      INT     { Int }
    | BOOL    { Bool }
    | STRING  { String }
    | MATRIX  { Matrix }
    | VOID    { Void }  
    
vdecl_list: /* nothing */ { [] }
           | vdecl_list vdecl { $2 :: $1 }
vdecl:
        typ ID SEMI { ($1, $2) }

expr:
    LITERAL                      { Literal($1) }
    | FLIT                       { Fliteral($1) }
    | BLIT                       { BoolLit($1) }
    | ID                         { Id($1) }
    | expr PLUS expr             { Binop($1, Add, $3) }
    | expr MINUS expr            { Binop($1, Sub, $3) }
    | expr TIMES expr            { Binop($1, Mult, $3) }
    | expr DIVIDE expr           { Binop($1, Div, $3) }
    | expr EQ expr               { Binop($1, Equal, $3) }
    | expr NEQ expr              { Binop($1, Neq, $3) }
    | expr LT expr               { Binop($1, Less, $3) }
    | expr LEQ expr              { Binop($1, Leq, $3) }
    | expr GT expr               { Binop($1, Greater, $3) }
    | expr GEQ expr              { Binop($1, Geq, $3) }
    | expr AND expr              { Binop($1, And, $3) }
    | expr OR expr               { Binop($1, Or, $3) }
    | MINUS expr %prec NOT       { Unop(Neg, $2) }
    | NOT expr                   { Unop(Not, $2) }
    | ID ASSIGN expr             { Assign($1, $3) }
    | ID LPAREN args_opt RPAREN
                                 { Call($1, $3) }
    | LPAREN expr RPAREN         { $2 }