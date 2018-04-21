;;; lab10.el examines Lambda Functions in Emacs-LISP .
;;;
;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;; Completed by: Chan Kim (ck45)
;;; Date: 4/20/2018

;;; Part 1
(lambda (x) (+ x x)   )

((lambda (x) (+ x x)) 17)

;;; Exercise 1a:
(lambda (w x y z) (max (abs w) (abs x) (abs y) (abs z)))

((lambda (w x y z) (max (abs w) (abs x) (abs y) (abs z)) 1 2 3 4))

;;; Exercise 1b:
(lambda (x y z) (+ x y z))

((lambda (x y z) (+ x y z) 1 2 3))

(lambda (x) (null x))

((lambda (x) (null x)) 1)

(lambda () 17.2)

((lambda () 17.2))

;;; Part 2
(function abs)

#'abs

(setq double (function (lambda (x) (+ x x)) ))

(double 11)

(funcall double 11)      ; should produce 22

(setq triple (function (lambda (x) (+ x x x)) ))

(triple 11)

(funcall triple 11)      ; should produce 33


(apply '+ '(1 2 3))    ; should return 6

(apply '+ 1 2 '(3 4 5))

(apply '+ 1 '(3 4 5) 2)

(funcall '+ 1 2 3 4)

(funcall 'cons 'a '(b))

(mapcar 'evenp '(1 2 3 4))

(mapcar 'oddp '(1 2 3 4))

(mapcar 'abs '(-1 2 -3 4 -5))

(defun subtract-n (n list)
    (mapcar '(lambda (x) (- x n)) list))

(subtract-n 2 '(2 4 6))

;;; Exercise 2:
(defun sum-squares (list)
    (apply #'+ (mapcar #'(lambda (x) (* x x)) list)))

(sum-squares '(1 2 3))          ; should return 14

(sum-squares '(1 2 3 4 5))      ; should return 55

(sum-squares '(-1 -2 -3 0 1))   ; should return 15 