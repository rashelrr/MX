{ open Microcparse }

(* Taken from the MicroC slides, needs to be changed *)

let digit = [’0’ - ’9’]

rule token = parse
    [’ ’ ’\t’ ’\r’ ’\n’] { token lexbuf }
    | "/*" { comment lexbuf }
    | "if" { IF } | ’(’ { LPAREN } | ’=’ { ASSIGN }
    | "else" { ELSE } | ’)’ { RPAREN } | "==" { EQ } | ">" { GT }
    | "for" { FOR } | ’{’ { LBRACE } | "!=" { NEQ } | ">=" { GEQ }
    | "while" { WHILE } | ’}’ { RBRACE } | ’<’ { LT } | "&&" { AND }
    | "return" { RETURN } | ’;’ { SEMI } | "<=" { LEQ } | "||" { OR }
    | "int" { INT } | ’+’ { PLUS } | ’,’ { COMMA } | "!" { NOT }
    | "bool" { BOOL } | ’-’ { MINUS } | "true" { BLIT(true) }
    | "float" { FLOAT } | ’*’ { TIMES } | "false" { BLIT(false) }
    | "void" { VOID } | ’/’ { DIVIDE }
    | digit+ as lxm { LITERAL(int_of_string lxm) }
    | digit+ ’.’ digit* ([’e’ ’E’] [’+’ ’-’]? digits)? as lxm { FLIT(lxm) }
    | [’a’-’z’ ’A’-’Z’][’a’-’z’ ’A’-’Z’ ’0’-’9’ ’_’]* as lxm { ID(lxm) }
    | eof { EOF }
    | _ as ch { raise (Failure("illegal character " ^ Char.escaped ch)) }

and comment = parse
    "*/" { token lexbuf }
    | _ { comment lexbuf }
