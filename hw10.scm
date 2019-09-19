(define (accumulate combiner start n term)
	(if (= n 0) start 
		(combiner (accumulate combiner 
		start (- n 1) term) 
	(term n)))
)

(define (accumulate-tail combiner start n term)
  (if (= n 0) start 
  	(accumulate-tail combiner (combiner (term n) start) (- n 1) term)
))

(define (rle s)
	(define (helper num str cnt)
		(cond ((null? str) (cons-stream (list num cnt) nil))
			((= num (car str)) (helper num (cdr-stream str) (+ cnt 1)))
			(else (cons-stream (list num cnt) (rle str))))

  	(if (null? s) nil
  		(helper (car s) (cdr-stream s) 1)))

)