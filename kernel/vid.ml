let _VCOL = 80;;
let _VLINE = 25;;
let _vmem = Mem.get_vma 0x000b8000;;
(* let _vx = Mem.alloc 1;; *)
(* let _vy = Mem.alloc 1;;
let _vattr = Mem.alloc 2;; *)

let a = ref('C');;

let set_attr a = ();; 
(* _vattr := a;; *)

let clear () = ()

let putc c = 
  let _vx = Mem.alloc 1 in
  let vm = Mem.get_vma 0x000b8000 in
  (* let vy = Mem.getb _vy in *)
  Mem.setc _vx 'Z';
  let vx = Mem.getc _vx in
  Bytes.unsafe_set vm 2 vx;
  Bytes.unsafe_set vm 0 c;
  ()
  (* Bytes.unsafe_set vm ((Mem.getb _vy) * _VCOL * 2 + (Mem.getb _vx) * 2) c;  *)
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