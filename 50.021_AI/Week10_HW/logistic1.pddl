(define (domain logistic-strips)
   (:predicates (location ?l)
		(package ?p)
		(truck ?t)
		(truck-at-loc ?l)
		(package-at-loc ?p ?l)
		(free ?t)
		(carry ?p ?t))

   (:action move
       :parameters  (?from ?to)
       :precondition (and  (location ?from) (location ?to) (truck-at-loc ?from))
       :effect (and  (truck-at-loc ?to)
		     (not (truck-at-loc ?from))))
		     
   (:action load
       :parameters (?package ?location ?truck)
       :precondition  (and  (package ?package) (location ?location) (truck ?truck)
			    (package-at-loc ?package ?location) (truck-at-loc ?location) (free ?truck))
       :effect (and (carry ?package ?truck)
		    (not (package-at-loc ?package ?location))
		    (not (free ?truck))))


   (:action unload
       :parameters  (?package  ?location ?truck)
       :precondition  (and  (package ?package) (location ?location) (truck ?truck)
			    (carry ?package ?truck) (truck-at-loc ?location))
       :effect (and (package-at-loc ?package ?location)
		    (free ?truck)
		    (not (carry ?package ?truck)))))