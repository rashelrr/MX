{ open Microcparse }

(* Taken from the MicroC slides, needs to be changed *)

let digit = [’0’ - ’9’]

rule token = parse
    [’ ’ ’\t’ ’\r’ ’\n’]    { token lexbuf }
    | "/*"                  { comment lexbuf }
    | "#"                   { singlecomment lexbuf }

    | ’{’                   { LBRACE } 
    | ’}’                   { RBRACE } 
    | ’[’                   { LBRACKET } 
    | ']'                   { RBRACKET }
    | ’(’                   { LPAREN } 
    | ’)’                   { RPAREN } 

    | "if"                  { IF } 
    | "elif"                { ELIF }
    | "else"                { ELSE } 

    | "while"               { WHILE } 
    | "for"                 { FOR } 
    | "continue"            { CONTINUE }
    | "break"               { BREAK }

    | ’=’                   { ASSIGN }     
    | ’+’                   { PLUS } 
    | ’-’                   { MINUS } 
    | ’*’                   { TIMES }
    | ’/’                   { DIVIDE }

    | '+.'                  { MXPLUS }
    | '-.'                  { MXMINUS }
    | '*.'                  { MXMX }
    | '**.'                 { MXSCALE }
    | "'"                   { TRANSPOSE } (* ASK TA - CHANGE TO ^ *)

    | "=="                  { EQ } 
    | ">"                   { GT }
    | ’<’                   { LT } 
    | "<="                  { LEQ }     
    | "!="                  { NEQ } 
    | ">="                  { GEQ }
    | "!"                   { NOT }

    | "||"                  { OR }
    | "&&"                  { AND }

    | ’;’                   { SEMI } 
    | ’,’                   { COMMA } 

    | "int"                 { INT } 
    | "Matrix"              { MATRIX }
    | "String"              { STRING }   
    | "bool"                { BOOL } 
    | "true"                { BLIT(true) }
    | "false"               { BLIT(false) }
    | "float"               { FLOAT } 
    | "void"                { VOID } 
    | "return"              { RETURN }
    | "null"                { NULL }

    | ’" ’                  { STRINGLIT ( string ( Buf . create 100) lexbuf ) }        

    | digit+ as lxm                                                 { LITERAL(int_of_string lxm) }
    | digit+ ’.’ digit* ([’e’ ’E’] [’+’ ’-’]? digits)? as lxm       { FLIT(lxm) }
    | [’a’-’z’ ’A’-’Z’][’a’-’z’ ’A’-’Z’ ’0’-’9’ ’_’]* as lxm        { ID(lxm) }                   
    | eof                                                           { EOF }
    | _ as ch                                                       { raise (Failure("illegal character " ^ Char.escaped ch)) }

and comment = parse
    "*/" { token lexbuf }
    | _ { comment lexbuf }
    
and singlecomment = parse
    "\n" { token lexbuf }
    | _ { singlecomment lexbuf }
    
and string buf = parse
    | [^ ’ " ’ ’\n ’ ’\\ ’]+ as content         { Buf . add_string buf content; string buf lexbuf }
    | ’\n ’                                     { Buf . add_string buf " \ n " ; Lex . new_line lexbuf ; string buf lexbuf }
    | ’\\ ’ ’" ’                                { Buf . add_char buf ’" ’; string buf lexbuf }
    | ’\\ ’                                     { Buf . add_char buf ’\\ ’; string buf lexbuf }
    | ’" ’                                      { Buf . contents buf } 

