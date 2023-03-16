type degree =
{
  node: string;
  count: int
}
type node_colour =  
{
  node : string;
  colour : int
}

val findD : string list list -> string list -> degree list
val modify_courses : 'a -> 'a list -> 'a list
val least_degree_node : int -> degree list -> string
val least_degree : int -> degree list -> int
val updateEList : 'a list list -> 'a -> 'a list list
val main : string list list -> degree list -> string list -> int -> string list
val edgeloop : 'a list list -> 'a -> int
val basic_colouring : string list -> node_colour list
val isPresent : 'a -> 'a list -> 'a list list -> bool
val getColour : string -> string list list -> node_colour list -> int
val colour : string list -> string list list -> node_colour list
val find_courses : int -> node_colour list -> string list
val print_timeslots : node_colour list -> int -> unit 