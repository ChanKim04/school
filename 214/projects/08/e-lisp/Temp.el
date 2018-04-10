;;; Temp.el simulates an e-LISP Temp type and operations on that type.
;;;
;;; Prof: Dr. Adams, for CS 214 at Calvin College.
;;; Student: Chan Kim (ck45)
;;; Date: 4/9/2018
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Temp constructs a Temp from two values.         ;;
;;; Receive: degrees, float; scale, char            ;;
;;; Return: set to degrees, and scale.              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun Temp(degrees scale)
  (list degrees scale) )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; isValid(degrees, scale) checks the validation.        
;;; Receive: degrees, float; scale, a character.                      
;;; PRE: degrees and scale have been initialized.            
;;; Return: t or nil.   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun isValid(degrees scale)
  (if (and (char-equal scale ?F) (>= degrees -459.6))
      (setq return t)
    (if (and (char-equal scale ?C) (>= degrees -273.15))
	(setq return t)
      (if (and (char-equal scale ?K) (>= degrees 0.0))
	  (setq return t)
	(setq return nil))))
  return)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getDegrees extracts the degrees of a Temp object.;
;;; Receive: theTemp, a Temp.                       
;;; Return: the degrees in theTemp.           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun getDegrees(theTemp)
  (car theTemp) )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getDegrees extracts the scale of a Temp object.;
;;; Receive: theTemp, a Temp.                       
;;; Return: the scale in theTemp.             
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun getScale(theTemp)
  (car (cdr theTemp) ) )

(defun setDegrees(theTemp degrees)
  (setcar theTemp degrees)
theTemp)

(defun setScale(theTemp scale)
  (setf (car (cdr theTemp)) scale)
theTemp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setFahrenheit(theTemp), setCelsius(theTemp), setKelvin(theTemp)              
;;; Receive: theTemp, a Temp.                     
;;; PRE: theTemp has been initialized.             
;;; Return: sets to those scales
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun setFahrenheit(theTemp)
  (if (char-equal (getScale theTemp) ?C)
    (progn (setScale theTemp ?F)
      (setDegrees theTemp (+ 32.0 (* 1.8 (getDegrees theTemp))))
      (theTemp))
  (if (char-equal (getScale theTemp) ?K)
    (progn (setScale theTemp ?F)
      (setDegrees theTemp (- 459.67 (* 1.8 (getDegrees theTemp))))
      (theTemp))
  ))        
theTemp)

(defun setCelsius(theTemp)
  (if (char-equal (getScale theTemp) ?F)
    (progn (setScale theTemp ?C)
      (setDegrees theTemp (- 32.0 (/ 1.8 (getDegrees theTemp))))
      (theTemp))
  (if (char-equal (getScale theTemp) ?K)
    (progn (setScale theTemp ?C)
      (setDegrees theTemp (- 273.15 (getDegrees theTemp)))
      (theTemp))
  ))        
theTemp)

(defun setKelvin(theTemp)
  (if (char-equal (getScale theTemp) ?C)
    (progn (setScale theTemp ?K)
      (setDegrees theTemp (+ 273.15 (getDegrees theTemp)))
      (theTemp))
  (if (char-equal (getScale theTemp) ?F)
    (progn (setScale theTemp ?K)
      (setDegrees theTemp (+ 459.67 (/ 1.8 (getDegrees theTemp))))
      (theTemp))
  ))        
theTemp)

(defun read(theTemp)
  (setq newDegrees 0.0)
  (setq newScale ?C)
  (setq values (upcase (read-from-minibuffer "Enter a temperature with its scale: ")))
  (setq newDegrees (string-to-number values))
  (setq newScale (string-to-char (byte-to-string (aref values (- (length values) 1)))))
  (if (isValid newDegrees newScale)
    (progn (setDegrees theTemp newDegrees)
      (setScale theTemp newScale))
    (princ "Invalid value"))
theTemp)

(defun raise(theTemp degrees)
  (setDegrees theTemp (+ (getDegrees theTemp) degrees))
)

(defun lower(theTemp degrees)
  (if (isValid (- (getDegrees theTemp) degrees) (getScale theTemp))
    (setDegrees theTemp (- (getDegrees theTemp) degrees)))
theTemp)

(defun equals(baseTemp, limitTemp)
  (let (setCelsius baseTemp)
    (setCelsius limitTemp)
    (= (getDegrees baseTemp) (getDegrees limitTemp)))
)

(defun less_than(baseTemp, limitTemp)
  (let (setCelsius baseTemp)
    (setCelsius limitTemp)
    (< (getDegrees baseTemp) (getDegrees limitTemp)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFullTemp returns a full Temp in F-M-L order. 
;;; Return: myFirst, myMiddle, myLast.           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun getFullTemp (theTemp)
   (concat (getDegrees theTemp) " " (getScale theTemp)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; printTemp displays a Temp object.         
;;; Receive: theTemp, a Temp,                 
;;;          buffer, the Temp of a buffer.   
;;; Output: the strings in theTemp to buffer. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun printTemp (theTemp buf)
   (princ (getFullTemp theTemp) buf)
   theTemp )
