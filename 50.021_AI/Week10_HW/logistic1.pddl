(define (domain logistic-strips)
   (:predicates 
        (LOCATION ?x) (PACKAGE ?x) (TRUCK ?x)
		(at-location ?x) (at-package ?x ?y) 
        (carry ?x ?y))


   (:action move 
        :parameters (?x ?y)
		:precondition (and (LOCATION ?x) (LOCATION ?y)
			    (at-location ?x))
		:effect (and (at-location ?y) (not (at-location ?x)) ) )

    (:action pick-up 
        :parameters (?x ?y)
		:precondition (and (PACKAGE ?x) (LOCATION ?y)
				(at-package ?x) (at-location ?y))
		:effect (and (load ?x ?y) (not (at-package ?x ?y)) ) )

    
    (:action drop 
        :parameters (?x ?y)
		:precondition (and (PACKAGE ?x) (LOCATION ?y)
				(at-location ?y))
		:effect (and (not (carry ?x ?y)) (at-package ?x ?y) ) )
)


