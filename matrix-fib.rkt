;; Matrix transform fibbonacci
; You're just squaring a 2x2 matrix n times. The following, ugly, code can be
; heavily deuglified by extracting the matrix manipulation into its own
; procedure. 
; start matrix:
; 1 1
; 1 0
;
; (p+ q) q
; q      p
;
; p' = p^2 + q^2 : p-transform
; q' = 2pq + q^2 : q-transform

(define (fibbo n)
 (fib-iter 1 0 0 1 n)) ; n transforms of initial matrix
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
         ((even? count)
          (fib-iter a
                    b
                    (p-transform p q)
                    (q-transform p q)
                    (/ count 2)))
         (else
           (fib-iter (+ (* b q)
                        (* a q)
                        (* a p))
                     (+ (* b p)
                        (* a q))
                     p
                     q
                     (- count 1)))))
(define (even? n)
  (= (remainder n 2) 0))
(define (p-transform a b)
  (+ (* a a) (* b b)))
(define (q-transform a b)
  (+ (* 2 a b) (* b b)))



