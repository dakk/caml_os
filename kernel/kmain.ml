let rec kmain () =
  let vt = Vid.init () in
  (* let vt = Vid.clear vt in *)
  let vt1 = Vid.putc vt 'z' in 
  let vt2 = Vid.putc vt1 'a' in ();
  (* let vt3 = Vid.putc vt2 'c' in (); *)
  0 + 1 * 3
;;

kmain ();;