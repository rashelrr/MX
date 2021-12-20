module L = Llvm
module A = Ast
open Sast 

module StringMap = Map.Make(String)

(* translate : Sast.program -> Llvm.module *)
let translate (globals, functions) =
  let context    = L.global_context () in
  let llmem = L.MemoryBuffer.of_file "mx.bc" in
  let llm = Llvm_bitreader.parse_bitcode context llmem in

  let the_module = L.create_module context "MX" in

  let i32_t      = L.i32_type    context
  and i8_t       = L.i8_type     context
  and i1_t       = L.i1_type     context
  and float_t    = L.double_type context
  and string_t   = L.pointer_type (L.i8_type context)
  and void_t     = L.void_type   context
  and matrix_t   = L.pointer_type (match L.type_by_name llm "struct.Matrix" with
      None -> raise (Failure "struct.Matrix not defined")
    | Some t -> t)
  in
  

  (* Return the LLVM type for a MicroC type *)
  let ltype_of_typ = function
      A.Int   -> i32_t
    | A.Bool  -> i1_t
    | A.String-> string_t
    | A.Float -> float_t
    | A.Void  -> void_t
    | A.Matrix _ -> matrix_t
  in

  (* Create a map of global variables after creating each *)
  let global_vars : L.llvalue StringMap.t =
    let global_var m (t, n) = 
      let init = match t with
          A.Float -> L.const_float (ltype_of_typ t) 0.0
        | _ -> L.const_int (ltype_of_typ t) 0
      in StringMap.add n (L.define_global n init the_module) m in
    List.fold_left global_var StringMap.empty globals in

  let printf_t : L.lltype = 
      L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
  let printf_func : L.llvalue = 
      L.declare_function "printf" printf_t the_module in

  let printbig_t : L.lltype =
      L.function_type i32_t [| i32_t |] in
  let printbig_func : L.llvalue =
      L.declare_function "printbig" printbig_t the_module in

  let init_matrix_t = 
      L.function_type matrix_t [| i32_t; i32_t |] in
  let init_matrix_f = 
      L.declare_function "initMatrix" init_matrix_t the_module in

  let store_matrix_t = 
      L.function_type matrix_t [|matrix_t; i32_t|] in
  let store_matrix_f = 
      L.declare_function "store" store_matrix_t the_module in

  let print_matrix_t = 
      L.function_type matrix_t [|matrix_t|] in
  let print_matrix_f = 
      L.declare_function "display" print_matrix_t the_module in

  let transpose_t = 
      L.function_type matrix_t [|matrix_t|] in
  let transpose_f = 
      L.declare_function "transpose" transpose_t the_module in

  let mxAdd_t = 
      L.function_type matrix_t [|matrix_t; matrix_t|] in
  let mxAdd_f = 
      L.declare_function "mxAdd" mxAdd_t the_module in

  let mxSub_t = 
      L.function_type matrix_t [|matrix_t; matrix_t|] in
  let mxSub_f = 
      L.declare_function "mxSub" mxSub_t the_module in

  let mxMult_t = 
      L.function_type matrix_t [|matrix_t; matrix_t|] in
  let mxMult_f = 
      L.declare_function "mxMult" mxMult_t the_module in

  let identity_t = 
      L.function_type matrix_t [|i32_t|] in
  let identity_f = 
      L.declare_function "identity" identity_t the_module in

  let mxScale_t = 
      L.function_type matrix_t [|matrix_t;i32_t|] in
  let mxScale_f = 
      L.declare_function "mxScale" mxScale_t the_module in

  (* Dummy Function to test that built in functions can take multiple arguments *)
  let twoFunc_t = 
      L.function_type matrix_t [|i32_t;i32_t|] in
  let twoFunc_f = 
      L.declare_function "twoFunc" twoFunc_t the_module in

  let transformation_t = 
      L.function_type matrix_t [|matrix_t;i32_t|] in
  let transformation_f = 
      L.declare_function "transformation" transformation_t the_module in

  let numCols_t = 
      L.function_type i32_t [|matrix_t|] in
  let numCols_f = 
      L.declare_function "numCols" numCols_t the_module in

  let numRows_t = 
      L.function_type i32_t [|matrix_t|] in
  let numRows_f = 
      L.declare_function "numRows" numRows_t the_module in
      

  (* Define each function (arguments and return type) so we can 
     call it even before we've created its body *)
  let function_decls : (L.llvalue * sfunc_decl) StringMap.t =
    let function_decl m fdecl =
      let name = fdecl.sfname
      and formal_types = 
	Array.of_list (List.map (fun (t,_) -> ltype_of_typ t) fdecl.sformals)
      in let ftype = L.function_type (ltype_of_typ fdecl.styp) formal_types in
      StringMap.add name (L.define_function name ftype the_module, fdecl) m in
    List.fold_left function_decl StringMap.empty functions in
  
  (* Fill in the body of the given function *)
  let build_function_body fdecl =
    let (the_function, _) = StringMap.find fdecl.sfname function_decls in
    let builder = L.builder_at_end context (L.entry_block the_function) in

    let int_format_str = L.build_global_stringptr "%d\n" "fmt" builder
    and str_format_str = L.build_global_stringptr "%s" "fmt" builder
    and float_format_str = L.build_global_stringptr "%g\n" "fmt" builder in

    (* Construct the function's "locals": formal arguments and locally
       declared variables.  Allocate each on the stack, initialize their
       value, if appropriate, and remember their values in the "locals" map *)
    let local_vars =
      let add_formal m (t, n) p = 
        L.set_value_name n p;
	let local = L.build_alloca (ltype_of_typ t) n builder in
        ignore (L.build_store p local builder);
	StringMap.add n local m 

      (* Allocate space for any locally declared variables and add the
       * resulting registers to our map *)
      and add_local m (t, n) =
	let local_var = L.build_alloca (ltype_of_typ t) n builder
	in StringMap.add n local_var m 
      in

      let formals = List.fold_left2 add_formal StringMap.empty fdecl.sformals
          (Array.to_list (L.params the_function)) in
      List.fold_left add_local formals fdecl.slocals 
    in

    (* Return the value for a variable or formal argument.
       Check local names first, then global names *)
    let lookup n = try StringMap.find n local_vars
                   with Not_found -> StringMap.find n global_vars
    in

    (* Construct code for an expression; return its value *)
    let rec expr builder ((_, e) : sexpr) = match e with
	SLiteral i  -> L.const_int i32_t i
      | SBoolLit b                    -> L.const_int i1_t (if b then 1 else 0)
      | SStringlit l                  -> L.build_global_stringptr l "tmp" builder
      | SFliteral l                   -> L.const_float_of_string float_t l
      | SNoexpr                       -> L.const_int i32_t 0
      | SId s                         -> L.build_load (lookup s) s builder
      | SMx (l, rows, cols)       -> 
      
      let m = L.build_call init_matrix_f [| L.const_int i32_t rows; L.const_int i32_t cols |] "init_matrix" builder in 
      let flat_list = List.flatten l in 
      ignore( List.map (fun v -> L.build_call store_matrix_f [| m ; L.const_int i32_t v |] "store_matrix" builder) flat_list ); m

      | SAssign (s, e) -> let e' = expr builder e in
                          ignore(L.build_store e' (lookup s) builder); e'
      
      | SBinop ((A.Float,_ ) as e1, op, e2) ->
	  let e1' = expr builder e1
	  and e2' = expr builder e2 in
	  (match op with 
	    A.Add     -> L.build_fadd
	  | A.Sub     -> L.build_fsub
	  | A.Mult    -> L.build_fmul
	  | A.Div     -> L.build_fdiv 
	  | A.Equal   -> L.build_fcmp L.Fcmp.Oeq
	  | A.Neq     -> L.build_fcmp L.Fcmp.One
	  | A.Less    -> L.build_fcmp L.Fcmp.Olt
	  | A.Leq     -> L.build_fcmp L.Fcmp.Ole
	  | A.Greater -> L.build_fcmp L.Fcmp.Ogt
	  | A.Geq     -> L.build_fcmp L.Fcmp.Oge
	  | A.And | A.Or | A.Mxadd | A.Mxsub | A.Mxtimes | A.Mxscale ->
	      raise (Failure "internal error: semant should have rejected and/or on float")
	  ) e1' e2' "tmp" builder

      | SBinop (e1, op, e2) ->
	  let e1' = expr builder e1
	  and e2' = expr builder e2 in
	  (match op with
	    A.Add     -> L.build_add e1' e2' "tmp" builder
	  | A.Sub     -> L.build_sub e1' e2' "tmp" builder
	  | A.Mult    -> L.build_mul e1' e2' "tmp" builder
    | A.Div     -> L.build_sdiv e1' e2' "tmp" builder
	  | A.And     -> L.build_and e1' e2' "tmp" builder
	  | A.Or      -> L.build_or e1' e2' "tmp" builder
	  | A.Equal   -> L.build_icmp L.Icmp.Eq e1' e2' "tmp" builder
	  | A.Neq     -> L.build_icmp L.Icmp.Ne e1' e2' "tmp" builder
	  | A.Less    -> L.build_icmp L.Icmp.Slt e1' e2' "tmp" builder
	  | A.Leq     -> L.build_icmp L.Icmp.Sle e1' e2' "tmp" builder
	  | A.Greater -> L.build_icmp L.Icmp.Sgt e1' e2' "tmp" builder
	  | A.Geq     -> L.build_icmp L.Icmp.Sge e1' e2' "tmp" builder
    | A.Mxadd   -> L.build_call mxAdd_f [| e1'; e2' |] "mxAdd" builder
    | A.Mxsub   -> L.build_call mxSub_f [| e1'; e2' |] "mxSub" builder
    | A.Mxtimes -> L.build_call mxMult_f [| e1'; e2' |] "mxMult" builder
    | A.Mxscale -> L.build_call mxScale_f [| e1'; e2' |] "mxScale" builder
    
    )


      | SUnop(op, ((t, _) as e)) ->
          let e' = expr builder e in
	  (match op with
	    A.Neg when t = A.Float -> L.build_fneg e' "tmp" builder
	  | A.Neg                  -> L.build_neg e' "tmp" builder
    | A.Transpose            -> L.build_call transpose_f [| e' |] "transpose" builder
    | A.Not                  -> L.build_not e' "tmp" builder)

      | SCall ("print", [e]) | SCall ("printb", [e]) ->
	  L.build_call printf_func [| int_format_str ; (expr builder e) |]
	    "printf" builder

      | SCall ("printbig", [e]) ->
	  L.build_call printbig_func [| (expr builder e) |] "printbig" builder

      | SCall ("print_matrix", [e]) ->
	  L.build_call print_matrix_f [| (expr builder e) |] "printbig" builder

      | SCall ("transpose", [e]) ->
	  L.build_call transpose_f [| (expr builder e) |] "transpose" builder

      | SCall ("printf", [e]) -> 
	  L.build_call printf_func [| float_format_str ; (expr builder e) |]
	    "printf" builder

      | SCall ("prints", [e]) ->                                                  
      L.build_call printf_func [| str_format_str ; (expr builder e) |] "printf" builder

      | SCall ("twoFunc", [e1; e2]) ->                                                  
      L.build_call twoFunc_f [| (expr builder e1); (expr builder e2) |] "twoFunc" builder

      | SCall ("transformation", [e1; e2]) ->                                                  
      L.build_call transformation_f [| (expr builder e1); (expr builder e2) |] "transformation" builder

      | SCall ("identity", [e]) ->                                                  
      L.build_call identity_f [| (expr builder e) |] "identity" builder

      | SCall ("numCols", [e]) ->                                                  
      L.build_call numCols_f [| (expr builder e) |] "numCols" builder

      | SCall ("numRows", [e]) ->                                                  
      L.build_call numRows_f [| (expr builder e) |] "numRows" builder

      | SCall (f, args) ->
         let (fdef, fdecl) = StringMap.find f function_decls in
	 let llargs = List.rev (List.map (expr builder) (List.rev args)) in
	 let result = (match fdecl.styp with 
                        A.Void -> ""
                      | _ -> f ^ "_result") in
         L.build_call fdef (Array.of_list llargs) result builder
    in
    
    (* LLVM insists each basic block end with exactly one "terminator" 
       instruction that transfers control.  This function runs "instr builder"
       if the current block does not already have a terminator.  Used,
       e.g., to handle the "fall off the end of the function" case. *)
    let add_terminal builder instr =
      match L.block_terminator (L.insertion_block builder) with
	Some _ -> ()
      | None -> ignore (instr builder) in
	
    (* Build the code for the given statement; return the builder for
       the statement's successor (i.e., the next instruction will be built
       after the one generated by this call) *)

    let rec stmt builder = function
	SBlock sl -> List.fold_left stmt builder sl
      | SExpr e -> ignore(expr builder e); builder 
      | SReturn e -> ignore(match fdecl.styp with
                              (* Special "return nothing" instr *)
                              A.Void -> L.build_ret_void builder 
                              (* Build return statement *)
                            | _ -> L.build_ret (expr builder e) builder );
                     builder
      | SIf (predicate, then_stmt, else_stmt) ->
         let bool_val = expr builder predicate in
	 let merge_bb = L.append_block context "merge" the_function in
         let build_br_merge = L.build_br merge_bb in (* partial function *)

	 let then_bb = L.append_block context "then" the_function in
	 add_terminal (stmt (L.builder_at_end context then_bb) then_stmt)
	   build_br_merge;

	 let else_bb = L.append_block context "else" the_function in
	 add_terminal (stmt (L.builder_at_end context else_bb) else_stmt)
	   build_br_merge;

	 ignore(L.build_cond_br bool_val then_bb else_bb builder);
	 L.builder_at_end context merge_bb

      | SWhile (predicate, body) ->
	  let pred_bb = L.append_block context "while" the_function in
	  ignore(L.build_br pred_bb builder);

	  let body_bb = L.append_block context "while_body" the_function in
	  add_terminal (stmt (L.builder_at_end context body_bb) body)
	    (L.build_br pred_bb);

	  let pred_builder = L.builder_at_end context pred_bb in
	  let bool_val = expr pred_builder predicate in

	  let merge_bb = L.append_block context "merge" the_function in
	  ignore(L.build_cond_br bool_val body_bb merge_bb pred_builder);
	  L.builder_at_end context merge_bb

      (* Implement for loops as while loops *)
      | SFor (e1, e2, e3, body) -> stmt builder
	    ( SBlock [SExpr e1 ; SWhile (e2, SBlock [body ; SExpr e3]) ] )
    in

    (* Build the code for each statement in the function *)
    let builder = stmt builder (SBlock fdecl.sbody) in

    (* Add a return if the last block falls off the end *)
    add_terminal builder (match fdecl.styp with
        A.Void -> L.build_ret_void
      | A.Float -> L.build_ret (L.const_float float_t 0.0)
      | t -> L.build_ret (L.const_int (ltype_of_typ t) 0))
  in

  List.iter build_function_body functions;
  the_module