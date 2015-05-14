;; Exercise 2.11

(add-load-path "." :relative)
(load "ch-2.scm")

(define (mul-interval x y)
  (let ((ux (upper-bound x))
        (lx (lower-bound x))
        (uy (upper-bound y))
        (ly (lower-bound y)))
    (cond ((and (> lx 0) (> ux 0))
           (cond ((and (> ly 0) (> uy 0))
                  (make-interval (* lx ly) (* ux uy)))
                 ((and (< ly 0) (< uy 0))
                  (make-interval (* ux ly) (* lx uy)))
                 (else
                   (make-interval (* ux ly) (* ux uy)))))
          ((and (< lx 0) (< ux 0))
           (cond ((and (> ly 0) (> uy 0))
                  (make-interval (* lx uy) (* ux ly)))
                 ((and (< ly 0) (< uy 0))
                  (make-interval (* ux uy) (* lx ly)))
                 (else
                   (make-interval (* lx uy) (* lx ly)))))
          (else
            (cond ((and (> ly 0) (> uy 0))
                   (make-interval (* lx uy) (* ux uy)))
                  ((and (< ly 0) (< uy 0))
                   (make-interval (* ux ly) (* lx ly)))
                  (else ; この場合のみ大小関係が 1 通りにならない
                    (let ((p1 (* lx ly))  ; > 0
                          (p2 (* lx uy))  ; < 0
                          (p3 (* ux ly))  ; < 0
                          (p4 (* ux uy))) ; > 0
                      (make-interval (min p2 p3)
                                     (max p1 p4)))))))))
