;;; max.el searches a list for its maximum value.
;;;
;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;; Completed by: Chan Kim (ck45)
;;; Date: 4/16/2018

(setq load-path (list "."))              ; setup load-path to WD

(load "mylist.elc")                      ; load module

;;;;;;;;;;;;;;;;;;;;;;;;;
;;; test function Max. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (let
      ((buf (get-buffer "max.el"))       ; setup for output
       (list1 (list 99 88 77 66 55))     ; max is first
       (list2 (list 55 66 77 88 99))     ; max is last
       (list3 (list 55 77 99 88 66))     ; max in middle
       (list4 (list 44 55 66 77 88)))    ; max is last

    (princ list1 buf)                    ; print list1
    (terpri buf)                         ;  and a newline

    (princ list2 buf)                    ; print list2
    (terpri buf)                         ;  and a newline

    (princ list3 buf)                    ; print list3
    (terpri buf)                         ;  and a newline

    (princ list4 buf)                    ; print list4
    (terpri buf)                         ;  and a newline

    (princ "The max in list 1 is " buf)  ; print the max
    (princ (Max list1) buf)              ;  in list1
    (terpri buf)                         ;  and a newline
    (princ "The max in list 2 is " buf)  ; print the max
    (princ (Max list2) buf)              ;  in list2
    (terpri buf)                         ;  and a newline
    (princ "The max in list 3 is " buf)  ; print the max
    (princ (Max list3) buf)              ;  in list3
    (terpri buf)                       ;  and a newline
    (princ "The max in list 4 is " buf)  ; print the max
    (princ (Max list4) buf)              ;  in list4
    (terpri buf)                       ;  and a newline

    (princ "The position of 99 within list1: " buf)  ; print the search 99
    (princ (Search list1 99) buf)              ;  in list1
    (terpri buf)                         ;  and a newline
    (princ "The position of 99 within list2: " buf)  ; print the search 99
    (princ (Search list2 99) buf)              ;  in list2
    (terpri buf)                         ;  and a newline
    (princ "The position of 99 within list3: " buf)  ; print the seacrh 99
    (princ (Search list3 99) buf)              ;  in list3
    (terpri buf)                       ;  and a newline
    (princ "The position of 99 within list4: " buf)  ; print the search 99
    (princ (Search list4 99) buf)              ;  in list4
    (terpri buf)))                       ;  and a newline