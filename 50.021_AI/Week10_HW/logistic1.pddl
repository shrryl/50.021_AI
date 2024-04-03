(define (domain logistic-strips)
   (:predicates 
        (LOCATION ?x) (PACKAGE ?x) (TRUCK ?x)
		(truck-at-loc ?x) (package-at-loc ?x ?y) 
        (carry ?x ?y))
   
    (:action move :parameters (?x ?y)
		:precondition (and (LOCATION ?x) (LOCATION ?y)
				(truck-at-loc ?x) )
		:effect (and (truck-at-loc ?y) (not (truck-at-loc ?x)) ) )

    (:action pick-up :parameters (?x ?y)
		:precondition (and (PACKAGE ?x) (LOCATION ?y)
				(package-at-loc ?x) (truck-at-loc ?y) )
		:effect (and (carry ?x ?y) (not (package-at-loc ?x ?y)) ) )

    (:action drop :parameters (?x ?y)
		:precondition (and (PACKAGE ?x) (LOCATION ?y)
				(truck-at-loc ?y)
		:effect (and (not (carry ?x ?y)) (package-at-loc ?x ?y) ) ))
)
