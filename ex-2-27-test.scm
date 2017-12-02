;; 問題2.27のテスト

(use gauche.test)
(test-start "問題2.27")

(load "./ex-2-27.scm")

(test-section "再帰プロセス版")

(test "(1 2 3)"
      (list 3 2 1)
      (lambda () (deep-reverse (list 1 2 3))))

(test "((1 2) (3 4))"
      (list (list 4 3) (list 2 1))
      (lambda () (deep-reverse (list (list 1 2) (list 3 4)))))

(test "(1 (2 (3 4)))"
      (list (list (list 4 3) 2) 1)
      (lambda () (deep-reverse (list 1 (list 2 (list 3 4))))))

(test-section "反復プロセス版")

(test "(1 2 3)"
      (list 3 2 1)
      (lambda () (deep-reverse-rec (list 1 2 3))))

(test "((1 2) (3 4))"
      (list (list 4 3) (list 2 1))
      (lambda () (deep-reverse-rec (list (list 1 2) (list 3 4)))))

(test "(1 (2 (3 4)))"
      (list (list (list 4 3) 2) 1)
      (lambda () (deep-reverse-rec (list 1 (list 2 (list 3 4))))))

(test-end :exit-on-failure #t)
