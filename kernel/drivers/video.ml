type t = {
  x: int;
  y: int;
  attr: int
};;

let _VCOL = 80;;
let _VLINE = 25;;
let _VMEM = 0xB8000;;

(* let name = "Vid";; *)

let init () = {
  x= 0;
  y= 0;
  attr= 0x1e;
};;

(* let set_attr a = _vattr := a;; *)

let clear vt = 
  let color = Char.chr vt.attr in
  let rec cl n = match n with
  | n when n >= (_VCOL * _VLINE) -> ()
  | n -> 
    Bytes.unsafe_set (Mem.get @@ _VMEM + n * 2) 0 ' ';
    Bytes.unsafe_set (Mem.get @@ _VMEM + n * 2 + 1) 0 color;
    cl @@ n+1
  in cl 0;
  { vt with x=0; y=0 }
;;

let putc vt c =
  let color = Char.chr vt.attr in 
  if c = '\n' || c = '\r' then { vt with x=0; y=vt.y+1 } else (
    Bytes.unsafe_set (Mem.get @@ _VMEM + vt.y * _VCOL * 2 + vt.x * 2) 0 c; 
    Bytes.unsafe_set (Mem.get @@ _VMEM + vt.y * _VCOL * 2 + vt.x * 2 + 1) 0 color;
    if (vt.x + 1) >= _VCOL then { vt with x=0; y=vt.y+1} else { vt with x=vt.x+1 }
  )
;;

let puts vt s = 
  let l = String.length s in
  let rec ite vt' i = match i with
    n when i=l -> vt'
  | _ -> ite (putc vt' @@ String.get s i) (i+1)
  in ite vt 0
;;
