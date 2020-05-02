val get : int -> bytes
val get_vma : int -> bytes

val init : unit -> unit
val alloc : int -> bytes

val getb : bytes -> int
val setb : bytes -> int -> unit
val getc : bytes -> char
val setc : bytes -> char -> unit