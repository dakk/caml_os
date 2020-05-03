let _VCOL = 80;;
let _VLINE = 25;;
let _vmem = 0xB8000;;

let _vx = ref(0);;
let _vy = ref(0);;
let _vattr = ref(Char.chr 0x0);;

let set_attr a = _vattr := a;;

let clear () = 
  (* Mem.setb _vx 0;
  Mem.setb _vy 0; *)
  _vx := 0;
  _vy := 1;
  (* scrive sulla stessa area di memora, anche facendo alloc *)
;;

let putc c = 
  Bytes.unsafe_set (Mem.get _vmem) (!_vy * _VCOL * 2 + !_vx * 2) c; 
  Bytes.unsafe_set (Mem.get _vmem) (!_vy * _VCOL * 2 + !_vx * 2 + 1) !_vattr;
  (* Mem.setb _vx ((Mem.getb _vx) + 1); *)
  (* _vx:= !_vx + 1 *)
  (* if (Mem.getb _vx) >= _VCOL then (
    Mem.setb _vx 0;
    Mem.setb _vy ((Mem.getb _vy) + 1);
  ) else () *)
;;

let puts s = String.iter putc s;;

let scroll n = ()