(* ********** Degree of Graph *********** *)
type degree =
{
  node: string;
  count: int
}

let rec edgeloop edge_list l = 
  match edge_list with
  [] -> 0
  | h::t -> 
    if (List.exists (fun x -> x=l) h) then 1+(edgeloop t l)
    else edgeloop t l 

let findD edge_list courses = 
  let rec courseloop edge_list courses = 
    match courses with 
    [] -> []
    | l::r -> 
      {node=l; count=(edgeloop edge_list l)}::courseloop edge_list r; 
  in courseloop edge_list courses

(* let degree_list = findD edge_list courses *)


(* ********** Basic Colouring *********** *)
type node_colour =  
{
  node : string;
  colour : int
}

let basic_colouring courses = 
  let rec loop c acc = 
    match c with
    [] -> []
    | h::t -> {node=h; colour=acc}::(loop t (acc))
  in
  loop courses 0
  
(* let initial_colouring = basic_colouring courses *)


(* ********** Creating Stack *********** *)
let rec modify_courses course courses = 
  match courses with
    [] -> []
    | h::t -> 
      if (h=course) then modify_courses course t
      else h::(modify_courses course t)

let rec least_degree_node least_degree records = 
  match records with
  [] -> failwith "Node not found"
  | h::t -> 
    if (h.count = least_degree) then h.node
    else least_degree_node least_degree t

let least_degree k records = 
  let rec loop min = function
    | [] -> 
      if min=k then failwith "Not possible"
      else min
    | h::t -> 
      if(h.count < k && h.count < min) then loop h.count t   
      else (loop min t)
  in loop k records

let rec updateEList edge_list leastDegreeC =
  match edge_list with 
  [] -> []
  | h::t -> 
    if (List.exists (fun x -> x=leastDegreeC) h) then updateEList t leastDegreeC
    else h::(updateEList t leastDegreeC)

let rec main edge_list degree_list courses k = 
  match edge_list with
  [] -> courses
  | h::t ->
    let leastDegree = least_degree k degree_list in
    let leastDegreeNode = least_degree_node leastDegree degree_list in
    let updated_edge_list = updateEList edge_list leastDegreeNode in
    let updated_courses = modify_courses leastDegreeNode courses in
    let updated_degree_list = findD updated_edge_list updated_courses in
    leastDegreeNode::(main updated_edge_list updated_degree_list updated_courses k)


(* ********** Graph Colouring *********** *)
let rec isPresent node node_list edge_list =
  match node_list with
  [] -> false
  | h::t -> 
    if ((List.mem [h; node] edge_list) || (List.mem [node; h] edge_list)) then true||(isPresent node t edge_list)
    else false||(isPresent node t edge_list)

let getColour node edge_list colour_map = 
  let rec loop node edge_list colour_map col = 
    let rec edge_loop node edge_list colour_map col =
      match colour_map with
      [] -> []
      | h::t -> 
        if (h.colour = col) then h.node::(edge_loop node edge_list t col)
        else (edge_loop node edge_list t col)
    in let node_list = edge_loop node edge_list colour_map col
    in 
    if(isPresent node node_list edge_list=true) then (loop node edge_list colour_map (col+1))
    else col
  in loop node edge_list colour_map 1

let colour stack edge_list = 
  let rec loop stack edge_list = 
    match stack with
    [] -> []
    | h::t ->
      let acc = (loop t edge_list) in    
      {node = h; colour = (getColour h edge_list acc)}::(acc)      
  in loop stack edge_list


(* *** Time Slot allocation **** *)
let rec find_courses slot mapping = 
  match mapping with
  [] -> []
  | h::t -> if(h.colour = slot) then h.node::(find_courses slot t)
            else find_courses slot t

let print_timeslots final_mapping k = 
  let rec loop acc =
    if(acc > k) then print_endline("")
    else
      let list = find_courses acc final_mapping in 
      print_string("Time Slot "^ string_of_int(acc) ^(": "));
      List.iter (fun x -> print_string(x ^ " ")) list;
      print_endline("");
      loop (acc+1)
  in
  loop 1