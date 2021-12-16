{ open Parser }



let digit = ['0' - '9']
let digits = digit+

rule token = parse
        [' ' '\t' '\r' '\n']    { token lexbuf }
    | "/*"                  { comment lexbuf }
    | "#"                   { singlecomment lexbuf }

    | '{'                   { LBRACE } 
    | '}'                   { RBRACE } 
    | '['                   { LBRACKET } 
    | ']'                   { RBRACKET }
    | '('                   { LPAREN } 
    | ')'                   { RPAREN } 

    | "if"                  { IF } 
    | "elif"                { ELIF }
    | "else"                { ELSE } 

    | "while"               { WHILE } 
    | "for"                 { FOR } 
    | "continue"            { CONTINUE }
    | "break"               { BREAK }

    | '='                   { ASSIGN }     
    | '+'                   { PLUS }  
    | '-'                   { MINUS } 
    | '*'                   { TIMES }
    | '/'                   { DIVIDE }

    | "+."                  { MXPLUS }
    | "-."                  { MXMINUS }
    | "*."                  { MXMX }
    | "**."                 { MXSCALE }
    | '''                   { TRANSPOSE } (* ASK TA - CHANGE TO ^ *)

    | "=="                  { EQ } 
    | ">"                   { GT }
    | '<'                   { LT } 
    | "<="                  { LEQ }     
    | "!="                  { NEQ } 
    | ">="                  { GEQ }
    | "!"                   { NOT }

    | "||"                  { OR }
    | "&&"                  { AND }

    | ';'                   { SEMI } 
    | ','                   { COMMA } 

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

    | '"' ([^ '"']* as lit) '"' { STRINGLIT(lit) }        

    | digit+ as lxm                                                 { LITERAL(int_of_string lxm) }
    | digit+ '.' digit* (['e' 'E'] ['+' '-']? digits)? as lxm       { FLIT(lxm) }
    | ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm        { ID(lxm) }                   
    | eof                                                           { EOF }
    | _ as ch                                                       { raise (Failure("illegal character " ^ Char.escaped ch)) }

and comment = parse
    "*/" { token lexbuf }
    | _ { comment lexbuf }
    
and singlecomment = parse
    "\n" { token lexbuf }
    | _ { singlecomment lexbuf }
