(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cdr (cdr s)))
)

(define (sign x)
  (cond ((< x 0) -1)
  	((= 0 x) 0)
  	((> x 0) 1 ) )
)

(define (square x) (* x x))

(define (pow b n)
  (cond ((= n 0) 1)
  	((even? n) (square (pow b (/ n 2))))
  	((odd? n) (* b (pow b (- n 1))))))

(define (ordered? s)
  (cond 
  	((null? s) true)
  	((null? (cdr s)) true)
  	((and (= (length s) 2) (= (car s) (cadr s))) true)
  	((< (car s) (cadr s)) (ordered? (cdr s)))
  	(else false)
))