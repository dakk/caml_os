let _VCOL = 80;;
let _VLINE = 25;;
let _vmem = Mem.get_vma 0x000b8000;;
let _vx = Mem.alloc 1;;
let _vy = Mem.alloc 1;;
let _vattr = Mem.alloc 2;;

let set_attr a = ();; 
(* _vattr := a;; *)

let clear () = ()

let putc c = ()
  (* Bytes.unsafe_set _vmem ((Mem.getb _vy) * _VCOL * 2 + (Mem.getb _vx) * 2) c;  *)
  (* Mem.setb _vmem (!_vy * _VCOL * 2 + !_vx * 2 + 1) !_vattr;
 *)
  (* Mem.setb _vx ((Mem.getb _vx) + 1);
  if (Mem.getb _vx) > _VCOL then (
    Mem.setb _vx 0;
    Mem.setb _vy ((Mem.getb _vy) + 1);
  ) else () *)
;;

let puts s = String.iter putc s;;

let scroll n = ()