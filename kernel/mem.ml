external get : int -> bytes = "_mem_get" [@@noalloc]
external malloc : int -> bytes = "_mem_malloc" [@@noalloc]

let getb m = Char.code (Bytes.unsafe_get m 0);;
let setb m v = Bytes.unsafe_set m 0 @@ Char.chr v;;
let getc m = Bytes.unsafe_get m 0;;
let setc m v = Bytes.unsafe_set m 0 v;;
let alloc n = malloc n;;
