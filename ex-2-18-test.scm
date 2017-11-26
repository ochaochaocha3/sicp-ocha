;; 問題2.18のテスト

(use gauche.test)
(test-start "問題2.18")

(load "./ex-2-18.scm")

(test "空リスト -> 空リスト"
      (list)
      (lambda () (my-reverse (list))))

(test "要素数1 -> そのまま"
      (list 1)
      (lambda () (my-reverse (list 1))))

(test "問題文の例"
      (list 25 16 9 4 1)
      (lambda () (my-reverse (list 1 4 9 16 25))))

(test "空リスト -> 空リスト（末尾再帰）"
      (list)
      (lambda () (my-reverse-tail (list))))

(test "要素数1 -> そのまま（末尾再帰）"
      (list 1)
      (lambda () (my-reverse-tail (list 1))))

(test "問題文の例（末尾再帰）"
      (list 25 16 9 4 1)
      (lambda () (my-reverse-tail (list 1 4 9 16 25))))

(test-end :exit-on-failure #t)
