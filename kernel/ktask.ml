type kevent = int;;

module type Ktask = sig
  type t

  val name : string
  val init : unit -> t
  val handle : t -> kevent -> t
end