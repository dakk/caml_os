type t

val init: unit -> t
val clear: t -> t
val putc: t -> char -> t
val puts: t -> string -> t