external clear_screen : unit -> unit = "clear_screen" [@@noalloc]
external put_char : char -> unit = "put_char" [@@noalloc]
external skip_char : int -> unit = "skip_char" [@@noalloc]

(* let a = ref(true); *)
type t = {a: int};;
let c = {a= 12};;

external _mem_isetb : int -> char -> unit = "_mem_isetb" [@@noalloc]

let rec kmain () =
  let c = {c with a=13} in
  clear_screen ();
  Vid.clear ();
  Vid.putc 'l';
  put_char 'H';
  put_char 'e';
  put_char 'l';
  put_char 'l';
  put_char 'o';
  skip_char 2;
  put_char 'W';
  put_char 'o';
  put_char 'r';
  put_char 'l';
  put_char 'd';
  put_char '!';
  _mem_isetb 0 'c';
  _mem_isetb 2 'a';
;;

kmain ();;