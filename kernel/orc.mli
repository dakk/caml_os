type t
type kevent
module type Ktask

val init: unit -> t
val add_task: t -> (module Ktask) -> t
val loop: t -> unit
val (<<): t -> kevent -> t
val (>>): t -> kevent option