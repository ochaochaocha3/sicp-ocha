;;; 問題2.23

(define (my-for-each proc items)
  (define (apply-proc-cdr things)
    (proc (car things))
    (cdr things))
  (define (iter things)
    (if (null? things)
      #t
      (iter (apply-proc-cdr things))))
  (iter items))
