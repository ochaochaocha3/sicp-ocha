;; 問題2.28のテスト

(use gauche.test)
(test-start "問題2.28")

(load "./ex-2-28.scm")

(define x (list (list 1 2) (list 3 4)))

(test-section "再帰プロセス版")

(test "(1 2 3)"
      (list 1 2 3)
      (lambda () (fringe (list 1 2 3))))

(test "((1 2) (3 4))"
      (list 1 2 3 4)
      (lambda () (fringe x)))

(test "(((1 2) (3 4)) ((1 2) (3 4)))"
      (list 1 2 3 4 1 2 3 4)
      (lambda () (fringe (list x x))))

(test-section "反復プロセス版")

(test "(1 2 3)"
      (list 1 2 3)
      (lambda () (fringe-rec (list 1 2 3))))

(test "((1 2) (3 4))"
      (list 1 2 3 4)
      (lambda () (fringe-rec x)))

(test "(((1 2) (3 4)) ((1 2) (3 4)))"
      (list 1 2 3 4 1 2 3 4)
      (lambda () (fringe-rec (list x x))))

(test-end :exit-on-failure #t)
