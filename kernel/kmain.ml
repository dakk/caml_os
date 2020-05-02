external clear_screen : unit -> unit = "clear_screen" [@@noalloc]
external put_char : char -> unit = "put_char" [@@noalloc]

(* let a = ref(true); *)


let rec kmain () =
  Mem.init ();
  clear_screen ();
  String.iter put_char "Hello";
  Vid.putc 'V';
  (* Vid.puts "Hello"; *)
  let a = Mem.get_vma 0x000b8000 in
  Bytes.unsafe_set a 0 'c';

  let b = Mem.alloc 1 in
  let _ = Mem.setc b 'B' in 
  Mem.setc a @@ Mem.getc b;
  String.iter Vid.putc "V";
;;

kmain ();;