let rec remove x = function
| [] -> failwith "x not in list"
| h::t -> if h = x then t else h::(remove x t)

let rec intersect a b = match a with
| [] -> if b = [] then [] else intersect b a
| h::t ->
    if List.mem h b then
      let b' = remove h b in
      h::(intersect t b')
    else
      intersect t b

let graph_maker map = 
  let loop map acc1 = 
    List.fold_left 
      (fun acc1 (c1, s1) -> 
        List.fold_left (fun acc2 (c2, s2) -> 
          if c1<c2 && List.length(intersect s1 s2) > 0 
            then [c1; c2]::acc2
          else acc2) 
        acc1 map) 
      acc1 map in
    loop map []

(* let edge_list = graph_maker new_map *)