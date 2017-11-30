(* Variant type priority queue implemented using *)
(* leftist trees and pure functional programming *)



(* Priority queue type containing elements of type 'a *)

type 'a queue


(* Empty queue constructor *)

val empty : 'a queue


(* [add e q] returns a queue constructed by adding *)
(* element e to the given priority queue q 		   *)
(******** It's time complexity is O(log n) *********)

val add : 'a -> 'a queue -> 'a queue


(* Exception raised when trying to access elements from an empty queue *)

exception Empty


(* Function returning the top element of the queue (lowest priority *)
(***************** It's time complexity is O(1) *********************)

val get_min : 'a queue -> 'a


(* Function deleting the top element from the queue Q		  *)
(* and returning a tuple (e, q') where e is the top element   *)
(* and q' is the priority queue constructed after the removal *)
(* If Q is empty then Empty exception is being thrown		  *)
(************* It's time complexity is O(log n)	***************)

val delete_min : 'a queue -> 'a * 'a queue


(* [join q1 q2] returns a queue being the result of joining q1 and q2 *)
(***************** It's time complexity is O(log n) *******************)

val join : 'a queue -> 'a queue -> 'a queue


(* Function returning whether the given queue is empty or not *)
(************** It's time complexity is O(1) ******************)

val is_empty : 'a queue -> bool