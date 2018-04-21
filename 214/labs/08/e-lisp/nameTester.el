;;; nameTester.el simulates and tests an e-LISP Name type.
;;;
;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;; Completed by: Chan Kim (ck45)
;;; Date: 4/4/2018
;;;

(setq load-path (cons "." load-path))
("." "/usr/share/emacs/25.3/site-lisp" "/usr/share/emacs/site-lisp" "/usr/share/emacs/25.3/lisp" "/usr/share/emacs/25.3/lisp/vc" "/usr/share/emacs/25.3/lisp/url" "/usr/share/emacs/25.3/lisp/textmodes" "/usr/share/emacs/25.3/lisp/progmodes" "/usr/share/emacs/25.3/lisp/play" "/usr/share/emacs/25.3/lisp/org" "/usr/share/emacs/25.3/lisp/nxml" "/usr/share/emacs/25.3/lisp/net" ...)

(load "Name.el")
t



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A simple driver for our Name functions. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (require 'cl)                              ; Common Lisp's assert
  (setq aName (Name "John" "Paul" "Jones"))  ; build a Name

  (assert (equal (getFirst aName) "John" ))  ; test it
  (assert (equal (getMiddle aName) "Paul" ))
  (assert (equal (getLast aName) "Jones" ))
  (assert (equal (getFullName aName) "John Paul Jones" ))

  (setq buf (get-buffer "nameTester.el"))    ; buf = this buffer
  (assert (eq (printName aName buf) aName) )
  (terpri buf)                               ; newline
  (princ "All tests passed!" buf)            ; feedback
  (terpri buf))                              ; newline
John Paul Jones
All tests passed!
t


