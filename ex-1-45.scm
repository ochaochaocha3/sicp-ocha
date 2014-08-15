;; Exercise 1.45
(load "./ch-1.scm")
(load "./ex-1-43.scm")

;; 4 乗根
;; 平均緩和法 1 回
;; (define (fourth-root x)
;;   (fixed-point (average-damp
;;                  (lambda (y) (/ x (cube y))))
;;                1.0))

;; 平均緩和法 2 回
(define (fourth-root x)
  (fixed-point ((repeated average-damp 2)
                 (lambda (y) (/ x (cube y))))
               1.0))

;; 5 乗根
;; 平均緩和法 2 回
(define (fifth-root x)
  (fixed-point ((repeated average-damp 2)
                 (lambda (y) (/ x (expt y 4))))
               1.0))

;; 6 乗根
;; 平均緩和法 2 回
(define (sixth-root x)
  (fixed-point ((repeated average-damp 2)
                 (lambda (y) (/ x (expt y 5))))
               1.0))

;; 7 乗根
;; 平均緩和法 2 回
(define (seventh-root x)
  (fixed-point ((repeated average-damp 2)
                 (lambda (y) (/ x (expt y 6))))
               1.0))

;; 8 乗根
;; 平均緩和法 2 回
;; (define (eighth-root x)
;;   (fixed-point ((repeated average-damp 2)
;;                  (lambda (y) (/ x (expt y 7))))
;;                1.0))

;; 平均緩和法 3 回
(define (eighth-root x)
  (fixed-point ((repeated average-damp 3)
                 (lambda (y) (/ x (expt y 7))))
               1.0))

;; 16 乗根
;; 平均緩和法 3 回
;; (define (sixteenth-root x)
;;   (fixed-point ((repeated average-damp 3)
;;                  (lambda (y) (/ x (expt y 15))))
;;                1.0))

;; 平均緩和法 4 回
(define (sixteenth-root x)
  (fixed-point ((repeated average-damp 4)
                 (lambda (y) (/ x (expt y 15))))
               1.0))

;; 一般化
(define (log2 x)
  (/ (log x) (log 2)))

(define (nth-root x n)
  (fixed-point ((repeated average-damp
                          (floor (log2 n)))
                (lambda (y) (/ x (expt y (- n 1)))))
               1.0))
