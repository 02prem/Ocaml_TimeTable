# Command to compile the files
compile: preprocessor.mli preprocessor.ml driver.ml driver.mli inferencegraph.mli inferencegraph.ml chaitin.mli chaitin.ml
	ocamlc -c preprocessor.mli
	ocamlc -c preprocessor.ml
	ocamlc -c inferencegraph.mli
	ocamlc -c inferencegraph.ml
	ocamlc -c chaitin.mli
	ocamlc -c chaitin.ml
	ocamlc -c driver.mli
	ocamlc -c driver.ml
	ocamlc -o app preprocessor.cmo inferencegraph.cmo chaitin.cmo driver.cmo 

# Command to run the executable
execute:
	./app

# Command to delete the additional files
clean:
	rm preprocessor.cmi preprocessor.cmo driver.cmi driver.cmo inferencegraph.cmo inferencegraph.cmi chaitin.cmi chaitin.cmo