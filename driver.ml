let t1 () = 
  let courses = ["c1"; "c2"; "c3"; "c4"; "c5"] in
  let map = [("p1", ["c1"; "c2"]); ("p2", ["c1"; "c5"]); ("p3", ["c2"; "c3"]); ("p4", ["c2"; "c4"]); ("p5", ["c2"; "c5"]); ("p6", ["c3"; "c4"])] in

  let new_map = Preprocessor.swap_map map in 
  let edge_list = Inferencegraph.graph_maker new_map in
  let degree_list = Chaitin.findD edge_list courses in 
  let initial_colouring = Chaitin.basic_colouring courses in
  let k = ref 3 in
  let stack = List.rev (Chaitin.main edge_list degree_list courses !k) in
  let final_mapping = Chaitin.colour stack edge_list in
  let _ = Chaitin.print_timeslots final_mapping !k in
  print_endline("");;

t1 ();;