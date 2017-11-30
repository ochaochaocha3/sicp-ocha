;; 問題2.20

;; 先頭と同じ偶奇性を持つ引数のリストを返す
(define (same-parity first . rest)
  ; フィルタ手続き（末尾再帰）
  (define (same-parity-filter pred ls acc)
    (if (null? ls)
      ; 末尾再帰版は逆順になって帰ってくるので最後に逆順にする
      (reverse acc)
      (same-parity-filter
        pred
        (cdr ls)
        (if (pred (car ls))
          (cons (car ls) acc)
          acc))))

  ; 偶奇の条件
  (let ((odd-or-even (if (odd? first)
                       odd?
                       even?)))
    (same-parity-filter odd-or-even rest (list first))))
