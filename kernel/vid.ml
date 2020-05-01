let _VCOL = 80;;
let _VLINE = 25;;
let _vmem = Mem.get_vma 0x000b8000;;
let _vx = ref(0);;
let _vy = ref(0);;
let _vattr = ref(0x1000 lor 0x0e00);;

let set_attr a = _vattr := a;;

let clear () = ()

let putc c =  ()
  (* Mem.setc _vmem (!_vy * _VCOL * 2 + !_vx * 2) c; 
  Mem.setb _vmem (!_vy * _VCOL * 2 + !_vx * 2 + 1) !_vattr; *)
 
  (* _vx := !_vx + 1;
  if !_vx > _VCOL then (
    _vx := 0;
    _vy := !_vy + 1
  ) else ()  *)
;;

let put_string s = ()

let scroll n = ()