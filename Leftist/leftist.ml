(* Implementation for "leftist.mli" *)
(* Author: Piotr Wojtczak *)



(* Type implementing a priority queue with leftist trees *)

type 'a queue =
	| Null
	| Node of 'a queue * 'a * 'a queue * int
	
	
(* Exception thrown when trying to access elements from an empty queue *)

exception Empty


(* Empty queue constructor *)

let empty = Null
	

	
(********************************************************)
(*                                                      *)	
(* Internal functions, not accesable from the interface *)
(*                                                      *)
(********************************************************)


(* Constructor creating a queue containing a single element *)

let singleton x = Node( Null, x, Null, 1 )


(* Function returning the shortest path in the tree  *)
(* Because of the characteristics of the leftist     *)
(* it is the right path starting from the root       *)

let rank = function
	| Null 				-> 0
	| Node (_, _, _, r) -> r
	
	

(********************************************************)




(******************************************************)
(*                                                    *)	
(*         Implementation of the interface            *)
(*                                                    *)
(******************************************************)


(* Function returning whether the given queue is empty *)

let is_empty  = function
	| Null 	-> true
	| _		-> false


(* Function merging two queues into one   *)

let rec join q1 q2 =
	match q1, q2 with
		| Null, s | s, Null 					-> s
		| Node(l, v1, r, _), Node(_, v2, _, _) 	->
			if v1 > v2 then
				join q2 q1						(* Add always to the lowest priority *)
			else
				let merged = join r q2 in		(* Merge q2 with the right subtree of q1 *)
				if rank l < rank merged then
					Node(merged, v1, l, rank l + 1)
				else
					Node(l, v1, merged, rank merged + 1)
		


(* Function adding an element to the queue *)

let add e q = join (singleton e) q


(* Function returning the top element of a given queue *)

let get_min = function
	| Null 				-> raise Empty
	| Node(_, e, _, _)  -> e


(* Function deleting the top element from the queue 		  *)
(* It return the tuple (e, q') containing mentioned element e *)
(* and q' being the new queue after removal					  *)

let delete_min = function
	| Null 				-> raise Empty
	| Node(l, e, r, _) 	-> (e, join l r)



(******************************************************)