external get_vma : int -> bytes = "_mem_get_vma" [@@noalloc]
external get_mem : int -> bytes = "_mem_get" [@@noalloc]

type t = bytes;;

let setc m i v = String.unsafe_set m i v;;

let setb m i v = String.unsafe_set m i (char_of_int v);;

let setw m i v =
  String.unsafe_set m (2 * i) (char_of_int (v lsr 8));
  String.unsafe_set m (2 * i + 1) (char_of_int (v land 0xff))
;;