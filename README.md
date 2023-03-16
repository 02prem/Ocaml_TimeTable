# Ocaml_TimeTable

## Pre-processing: 
Convert the list of tuples having list of courses taken by each participant to list of tuples having participants in each course.
Example: [("p1", ["c1"; "c2"]); ("p2", ["c1"])] to [("c1", ["p1"; "p2"]); ("c2", ["p1"])]

## Inference graph:
Create a graph of type list of list such that two nodes have an edge if any intersection of participants in both courses is not null.
