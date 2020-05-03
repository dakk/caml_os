external get : int -> bytes = "_mem_get" [@@noalloc]
external get_vma : int -> bytes = "_mem_get_vma" [@@noalloc]
external malloc : int -> bytes = "_mem_malloc" [@@noalloc]

let stack_ptr = get_vma 0x0;;

let getb m = Char.code (Bytes.unsafe_get m 0);;
let setb m v = Bytes.unsafe_set m 0 @@ Char.chr v;;
let getc m = Bytes.unsafe_get m 0;;
let setc m v = Bytes.unsafe_set m 0 v;;

let init () = setb (get_vma 0x0) 1;; 

let alloc n = 
  let adr' = malloc n in
  (* let stack_ptr = get_vma 0x100 in
  let actual_value = getb stack_ptr in
  setb stack_ptr @@ actual_value + n;
  let m = get_vma actual_value in *)
  setb adr' 0;
  adr'
;;
