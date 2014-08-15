;; Exercise 2.6

;; Church 数を普通の整数に変換して出力する
(define (p n)
  (define (inc x) (+ x 1))
  (display ((n inc) 0))
  (newline))

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one   (lambda (f) (lambda (x) (f x))))
(define two   (lambda (f) (lambda (x) (f (f x)))))
(define three (lambda (f) (lambda (x) (f (f (f x))))))
(define four  (lambda (f) (lambda (x) (f (f (f (f x)))))))
(define five  (lambda (f) (lambda (x) (f (f (f (f (f x))))))))
(define six   (lambda (f) (lambda (x) (f (f (f (f (f (f x)))))))))
(define seven (lambda (f) (lambda (x) (f (f (f (f (f (f (f x))))))))))
(define eight (lambda (f) (lambda (x) (f (f (f (f (f (f (f (f x)))))))))))
(define nine
  (lambda (f) (lambda (x) (f (f (f (f (f (f (f (f (f x))))))))))))
(define ten
  (lambda (f) (lambda (x) (f (f (f (f (f (f (f (f (f (f x)))))))))))))

(define (add m n)
;  ((n (lambda (l) (lambda (f) (lambda (x) (f ((l f) x))))))
;   m))
  (lambda (f) (lambda (x) ((n f) ((m f) x)))))
