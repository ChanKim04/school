;;; nameTester.el simulates and tests an e-LISP Name type.
;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;; Completed by: Chan Kim (ck45)
;;; Date: 4/3/2018

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Name constructs a name from three strings.      ;;
;;; Receive: first, middle and last, three strings. ;;
;;; Return: the triplet (first middle last).        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun Name (first middle last)
  (list first middle last))
Name

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFirst extracts the first name of a name object.;
;;; Receive: theName, a Name.                       
;;; Return: the first string in theName.           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun getFirst (theName)
  (car theName))
getFirst

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getMiddle extracts the middle name of a name object.
;;; Receive: theName, a Name.                      
;;; Return: the second string in theName.           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun getMiddle (theName)
  (car (cdr theName)))
getMiddle

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getLast extracts the last name of a name object.
;;; Receive: theName, a Name.                    
;;; Return: the third string in theName.       
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun getLast (theName)
  (car (cdr (cdr theName))))
getLast

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFullName returns a full name in F-M-L order. 
;;; Return: myFirst, myMiddle, myLast.           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun getFullName (aName)
  (concat (getFirst aName) " " (getMiddle aName) " " (getLast aName)))
getFullName

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; printName displays a name object.         
;;; Receive: theName, a Name,                 
;;;          buffer, the name of a buffer.   
;;; Output: the strings in theName to buffer. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun printName (aName buf)
  (princ aName buf))
printName

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setFirst sets the first name of a name object.;
;;; Receive: theName, a Name,
;;;          first, a String.                       
;;; Return: the new triplet (first middle last) 
;;;         with the new first name.           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun setFirst (theName first)
  (setq aName (Name first (getMiddle theName) (getLast theName))))
setFirst

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setMiddle sets the middle name of a name object.;
;;; Receive: theName, a Name,
;;;          middle, a String.                       
;;; Return: the new triplet (first middle last) 
;;;         with the new middle name.             
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun setMiddle (theName middle)
  (setq aName (Name (getFirst theName) middle (getLast theName))))
setMiddle

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setFirst sets the last name of a name object.;
;;; Receive: theName, a Name,
;;;          last, a String.                       
;;; Return: the new triplet (first middle last) 
;;;         with the new last name.           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun setLast (theName last)
  (setq aName (Name (getFirst theName) (getMiddle theName) last)))
setLast

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; lfmi returns a full name in L-F-M(the first letter) order. 
;;; Return: myLast, myFirst, myMiddle[0].           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun lfmi (theName)
  (concat (getLast theName) ", " (getFirst theName) " " (substring (getMiddle theName) 0 1) "."))
lfmi

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; readName constructs(or reconstructs)            ;;
;;;          a name from user inputs.               ;;
;;; Receive: first, middle and last, three strings. ;;
;;; Return: the triplet (first middle last).        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun readName ()
  (princ "Enter the first name...\n")
  (setq first (read))
  (princ first) (terpri)
  (princ "Enter the middle name...\n")
  (setq middle (read))
  (princ middle) (terpri)
  (princ "Enter the last name...\n")
  (setq last (read))
  (princ last) (terpri)
  (setq aName (Name first middle last)))
readName

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A simple driver for our Name functions. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (require 'cl)                              ; assert
  (setq aName (Name "John" "Paul" "Jones"))  ; build a Name

  (assert (equal (getFirst aName) "John" ))  ; test it
  (assert (equal (getMiddle aName) "Paul" ))
  (assert (equal (getLast aName) "Jones" ))
  (assert (equal (getFullName aName) "John Paul Jones" ))

  (setq buf (get-buffer "nameTester.el"))    ; buf = this buffer
  (assert (eq (printName aName buf) aName) ) ; output
  (terpri buf)                               ; newline
  ; test for the result of the project 7.
  (setFirst aName "Dwight")
  (assert (equal (getFirst aName) "Dwight" ))
  (assert (equal (getMiddle aName) "Paul" ))
  (assert (equal (getLast aName) "Jones" ))
  (setMiddle aName "David")
  (assert (equal (getMiddle aName) "David" ))
  (assert (equal (getLast aName) "Jones" ))
  (assert (equal (getFirst aName) "Dwight" ))
  (setLast aName "Eisenhower")
  (assert (equal (getLast aName) "Eisenhower" ))
  (assert (equal (getFirst aName) "Dwight" ))
  (assert (equal (getMiddle aName) "David" ))
  (assert (equal (lfmi aName) "Eisenhower, Dwight D."))
  (printName (lfmi aName) buf)
  (terpri buf)
  ; type "first" as the first name, "middle" as the middle name, and "last" as the last name for the test.
  (readName)                                 
  (printName aName buf)
  (terpri buf)
  (assert (equal (getFirst aName) "first" ))
  (assert (equal (getMiddle aName) "middle" ))
  (assert (equal (getLast aName) "last" ))
  (princ "All tests passed!" buf)            ; feedback
  (terpri buf))                              ; newline
(John Paul Jones)
Eisenhower, Dwight D.
Enter the first name...
first
Enter the middle name...
middle
Enter the last name...
last
(first middle last)
All tests passed!
t
