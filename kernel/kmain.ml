external clear_screen : unit -> unit = "clear_screen" [@@noalloc]
(* external put_char : char -> unit = "put_char" [@@noalloc] *)

(* 
type zz = { mutable c: char };;
let z = { c= 'C'; };; *)

let rec kmain () =
  (* qua funziona, se lo sposto fuori no: dunque non posso usarlo globalmente; se lo metto dentro non
    fa la alloc; e' la alloc che in goni caso faulta *)
  (* Mem.init (); *)
  Vid.clear ();
  clear_screen ();
  (* Mem.alloc 1; *)
  (* String.iter put_char !b;
  put_char !bb;
  bb := 'Z';
  bb1 := 'Z';
  put_char !bb1; *)
  (* b:='Z'; *)
  (* put_char !b; *)
  (* String.iter (fun x -> put_char x) !b; *)
  Vid.putc 'z';
  Vid.putc 'a';
  Vid.putc 'c';
  List.iter Vid.putc ['a';'b'];
  (* Bytes.unsafe_set (Mem.get 0xB8000) 0 'C'; *)
  (* Vid.puts "Hello"; *)
  (* let a = Mem.get_vma 0x000b8000 in
  Bytes.unsafe_set a 0 'c';

  let b = Mem.alloc 1 in
  let _ = Mem.setc b 'B' in 
  Mem.setc a @@ Mem.getc b;
  String.iter Vid.putc "V"; *)
;;


kmain ();;