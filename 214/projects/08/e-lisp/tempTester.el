;;; tempTester.el simulates and tests an e-LISP Temp type.
;;;
;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;; Completed by: Chan Kim (ck45)
;;; Date: 4/4/2018
;;;

(setq load-path (cons "." load-path))
("." "/usr/share/emacs/25.3/site-lisp" "/usr/share/emacs/site-lisp" "/usr/share/emacs/25.3/lisp" "/usr/share/emacs/25.3/lisp/vc" "/usr/share/emacs/25.3/lisp/url" "/usr/share/emacs/25.3/lisp/textmodes" "/usr/share/emacs/25.3/lisp/progmodes" "/usr/share/emacs/25.3/lisp/play" "/usr/share/emacs/25.3/lisp/org" "/usr/share/emacs/25.3/lisp/nxml" "/usr/share/emacs/25.3/lisp/net" ...)

(load "Temp.el")
t



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A simple driver for our Name functions. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (require 'cl)                              ; Common Lisp's assert
  (setq baseTemp (Temp 0.0 ?C))
  (setq limitTemp (Temp 0.0 ?C))  ; build Temps

  (read baseTemp)
  (read limitTemp)
  (setq stepValue (string-to-number (read-from-minibuffer)))

  (setq buf (get-buffer "tempTester.el"))    ; buf = this buffer

  (while (less_than baseTemp limitTemp)
    (let ( (temp (copy-sequence baseTemp)))
    (setFahrenheit temp)
    (princ (getFullTemp temp) buf)
    (princ "\t" buf)
    (setCelsius temp)
    (princ (getFullTemp temp) buf)
    (princ "\t" buf)
    (setKelvin temp)
    (princ (getFullTemp temp) buf)
    (princ "\n" buf)
            
    (raise baseTemp stepValue)))
    (terpri buf))

  ;(assert (eq (printName aName buf) aName) )
  ;(terpri buf)                               ; newline
  ;(princ "All tests passed!" buf)            ; feedback
  ;(terpri buf))                              ; newline
John Paul Jones
All tests passed!
t


