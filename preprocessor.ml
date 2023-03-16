let rec add_to_assoc_list k v lst = 
  match lst with
  | [] -> [(k, [v])]
  | (k', vs)::t -> 
      if k' = k then (k', v::vs)::t
      else (k', vs)::add_to_assoc_list k v t
  
let swap_map m = 
  let add_to_map (p, cs) acc =
    List.fold_left (fun acc c -> add_to_assoc_list c p acc) acc cs in
  let res = List.fold_right add_to_map m [] in
  List.map (fun (k, vs) -> (k, List.rev vs)) res

(* let new_map = swap_map map *)
let return_participants tuple = match tuple with (_, p) -> p
let return_course tuple = match tuple with (c, _) -> c