external clear_screen : unit -> unit = "clear_screen" [@@noalloc]
external put_char : char -> unit = "put_char" [@@noalloc]

(* let b = ref('c');; *)
(* let b = ref('C');; *)

type zz = { mutable c: char };;
let z = { c= 'C'; };;

let rec kmain () =
  let a = ref('C') in a := 'Z'; 
  (* qua funziona, se lo sposto fuori no: dunque non posso usarlo globalmente; se lo metto dentro non
    fa la alloc; e' la alloc che in goni caso faulta *)
  (* Mem.init (); *)
  (* clear_screen (); *)
  (* Mem.alloc 1; *)
  (* String.iter put_char "Hello"; *)
  put_char !a;
  a:='C';
  put_char !a;
  (* String.iter (fun x -> put_char x) !b; *)
  (* Vid.putc !a; *)
  (* Vid.puts "Hello"; *)
  (* let a = Mem.get_vma 0x000b8000 in
  Bytes.unsafe_set a 0 'c';

  let b = Mem.alloc 1 in
  let _ = Mem.setc b 'B' in 
  Mem.setc a @@ Mem.getc b;
  String.iter Vid.putc "V"; *)
;;


kmain ();;