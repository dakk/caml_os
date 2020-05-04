type kevent = string * int;;

module type Ktask = sig
  type t

  val init : unit -> t
  (* val handle : t -> kevent -> t *)
end


type t = {
  ktasks: (string * (module Ktask)) list;
  events: kevent Queue.t
};;

let init () = {
  ktasks= [];
  events= Queue.create ()
};;

let add_task o t = o;;

let (<<) o e = Queue.add e o.events; o;;

let (>>) o = Queue.take_opt o.events;;

let loop o = ();;