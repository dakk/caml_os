let rec kmain () =
  let orc = Orc.init () in
  (* let orc = Orc.add_task orc (module Video) in *)
  Orc.loop orc;

  let vt = Video.init () in
  (* let vt = Video.clear vt in *)
  let vt1 = Video.putc vt 'z' in 
  let vt2 = Video.putc vt1 'a' in ();
  (* let vt3 = Video.putc vt2 'c' in (); *)
  0 + 1 * 3
;;

kmain ();;