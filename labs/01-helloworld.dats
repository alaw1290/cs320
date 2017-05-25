implement main0 () = () where {
	val a = 1 // these are bindings
	val b = 2
	val c = a
	val _ = println! "Hello World!" // this is a wildcard binding () can be used in place of _
}


//implement main0 () = let
//	val _ = println! "Hello World!"
//in
//	()
//end
