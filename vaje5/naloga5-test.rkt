#lang racket/base

(require rackunit/text-ui)

(require rackunit "naloga5.rkt") ;This should be your solution file

; Your solutions file should contain at the bottom the following line:
; (provide power gcd fib reverse map filter remove zip range is-palindrome)

; To run the tests just run this file: racket naloga5-test.rkt

(define all-tests
  (test-suite
   "all tests"
   
   (test-suite
    "Tests for function power"
    (check-equal? (power 2 0) 1 "power 2^0")
    (check-equal? (power 2 3) 8 "power 2^3")
    (check-equal? (power 10 3) 1000 "power 10^3")
    (check-equal? (power 1 0) 1 "power 1^0")
    (check-equal? (power 42 42) 150130937545296572356771972164254457814047970568738777235893533016064 "power 42^42")
   )

   (test-suite
    "Tests for gcd"
    (check-equal? (gcd 16 18) 2 "gcd 16,18")
    (check-equal? (gcd 24 18) 6 "gcd 24,18")
    (check-equal? (gcd 1 18) 1 "gcd 1,18")
   )

   (test-suite
    "Tests for fib"
    (check-equal? (fib 1) 1 "fib 1")
    (check-equal? (fib 2) 1 "fib 2")
    (check-equal? (fib 3) 2 "fib 3")
    (check-equal? (fib 7) 13 "fib 7")
   )

   (test-suite
    "Tests for reverse"
    (check-equal? (reverse (list 1 2 3 4)) (list 4 3 2 1) "reverse list 1-4")
    (check-equal? (reverse (list 7)) (list 7) "reverse single element list")
    (check-equal? (reverse (list 1 1 1 1 1)) (list 1 1 1 1 1) "reverse list with same elements")
    (check-equal? (reverse (list 1 2 10 9 88 33)) (list 33 88 9 10 2 1) "reverse non sequencial list")
    )

    (test-suite
     "Tests for map"
     (check-equal? (map (lambda (x) (+ x 1)) (list 1 2 3 4)) (list 2 3 4 5) "map +1 each elm")
     (check-equal? (map (lambda (x) (+ x 10)) (list -1 0 10 10)) (list 9 10 20 20) "map +10 each elm")
   )

    (test-suite
     "Tests for filter"
     (check-equal? (filter (lambda (x) (= x 1)) (list 1 2 3 4)) (list 1) "filter only 1's in a list with only one 1")
     (check-equal? (filter (lambda (x) (= x 1)) (list 1 1 1 4)) (list 1 1 1) "filter only 1's on list with more than one 1")
     (check-equal? (filter (lambda (x) (= x 1)) (list 0 2 3 4)) null "filter only 1's in a list with zero 1's")
   )

    (test-suite
     "Tests for remove"
     (check-equal? (remove 4 (list 1 2 3 4)) (list 1 2 3) "remove 4's from the list")
     (check-equal? (remove 1 (list 1 1 1 4)) (list 4) "remove 1's from the list")
     (check-equal? (remove 0 (list 1 4 7 101)) (list 1 4 7 101) "remove 0's from the list")
   )

    (test-suite
    "Tests for zip"
    (check-equal? (zip (list 1 2 3 4) (list 10 20 30 40)) (list (cons 1 10) (cons 2 20) (cons 3 30) (cons 4 40)) "zip #1")
    (check-equal? (zip (list -5 10 3 400) (list -19 -17)) (list (cons -5 -19) (cons 10 -17)) "zip #2")
    (check-equal? (zip (list 400) (list 403 -97)) (list (cons 400 403)) "zip #3")
    (check-equal? (zip (list) (list 403 -97)) (list) "zip #4 empty first list")
    (check-equal? (zip (list 100 200) (list)) (list) "zip #5 empty second list")
    (check-equal? (zip (list) (list)) (list) "zip #6 empty both lists")
   )

   (test-suite
    "Tests for range"
    (check-equal? (range 1 10 1) (list 1 2 3 4 5 6 7 8 9 10) "range 1..10 step 1")
    (check-equal? (range 1 10 2) (list 1 3 5 7 9) "range 1..10 step 2")
    (check-equal? (range -5 5 2) (list -5 -3 -1 1 3 5) "range -5..5 step 2")
    (check-equal? (range -10 10 24) (list -10) "range -10..10 step 24")
   )

   (test-suite
    "Tests for is-palindrome"  
    (check-equal? (is-palindrome (list 1 2 3 3 2 1)) #t "is-palindrome #1")
    (check-equal? (is-palindrome (list 1 2 3 4 5 6)) #f "is-palindrome #2")
    (check-equal? (is-palindrome (list 1 2 3 2 1)) #t "is-palindrome #3")
   )

  )
)

(run-tests all-tests)


