(define (problem strips-logistic2)
   (:domain logistic-strips)
   (:objects Tampines Bedok Changi Package1 Truck1)
   (:init (LOCATION Tampines) (LOCATION Bedok) (LOCATION Changi)
		(PACKAGE Package1) 
		(TRUCK Truck1)
		(truck-at-loc Tampines)
		(package-at-loc Package1 Bedok) )

    (:goal (package-at-loc Package1 Changi) )
)
