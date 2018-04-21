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
  (if (and (>= degrees -459.6) (char-equal scale ?F))
      (setq return t)
    (if (and (>= degrees -273.15) (char-equal scale ?C))
	(setq return t)
      (if (and (>= degrees 0.0) (char-equal scale ?K))
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
;;; getScale extracts the scale of a Temp object.;
;;; Receive: theTemp, a Temp.                       
;;; Return: the scale in theTemp.             
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun getScale(theTemp)
  (car (cdr theTemp) ) )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setDegrees sets the degrees of a Temp object.;
;;; Receive: theTemp, a Temp; degrees, float.                       
;;; Return: theTemp with new degrees.           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun setDegrees(theTemp degrees)
  (setcar theTemp degrees)
theTemp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setScale sets the scale of a Temp object.;
;;; Receive: theTemp, a Temp; scale, char.                       
;;; Return: theTemp with a new scale.             
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
      (setDegrees theTemp (+ 32.0 (* 1.8 (getDegrees theTemp)))))
  (if (char-equal (getScale theTemp) ?K)
    (progn (setScale theTemp ?F)
      (setDegrees theTemp (- (* 1.8 (getDegrees theTemp)) 459.67))
      )))        
theTemp)

(defun setCelsius(theTemp)
  (if (char-equal (getScale theTemp) ?F)
    (progn (setScale theTemp ?C)
      (setDegrees theTemp (/ (- (getDegrees theTemp) 32.0) 1.8)))
  (if (char-equal (getScale theTemp) ?K)
    (progn (setScale theTemp ?C)
      (setDegrees theTemp (- (getDegrees theTemp) 273.15)))
  ))        
theTemp)

(defun setKelvin(theTemp)
  (if (char-equal (getScale theTemp) ?C)
    (progn (setScale theTemp ?K)
      (setDegrees theTemp (+ 273.15 (getDegrees theTemp))))
  (if (char-equal (getScale theTemp) ?F)
    (progn (setScale theTemp ?K)
      (setDegrees theTemp (* (+ 459.67 (getDegrees theTemp)) (/ 5.0 9.0))))
  ))        
theTemp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; readTemp(theTemp) reads degrees and scale                
;;; Receive: theTemp, a Temp.                     
;;; PRE: theTemp has been initialized.             
;;; Return: sets up degrees and scale if it is valid 
;;;         otherwise prints an invalid message.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun readTemp(theTemp)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; raise(theTemp degrees) incriments degrees               
;;; Receive: theTemp, a Temp; degrees, float.                     
;;; PRE: theTemp and degrees have been initialized.             
;;; Return: incriments degrees.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun raise(theTemp degrees)
  (setDegrees theTemp (+ (getDegrees theTemp) degrees))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; lower(theTemp degrees) decriments degrees               
;;; Receive: theTemp, a Temp; degrees, float.                     
;;; PRE: theTemp and degrees have been initialized.             
;;; Return: decriments degrees otherwise prints an invalid message. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun lower(theTemp degrees)
  (if (isValid (- (getDegrees theTemp) degrees) (getScale theTemp))
    (setDegrees theTemp (- (getDegrees theTemp) degrees)))
theTemp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; equals(baseTemp limitTemp) retrieves baseTemp = limitTemp               
;;; Receive: baseTemp, a Temp; limitTemp, a Temp.                     
;;; PRE: baseTemp and limitTemp have been initialized.             
;;; Return: true or false.  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun equals(baseTemp limitTemp)
  (let ((copyBase (copy-sequence baseTemp))
    (copyLimit (copy-sequence limitTemp)))
    (setCelsius copyBase)
    (setCelsius copyLimit)
    (= (getDegrees copyBase) (getDegrees copyLimit)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; lessThan(baseTemp limitTemp) retrieves baseTemp < limitTemp               
;;; Receive: baseTemp, a Temp; limitTemp, a Temp.                     
;;; PRE: baseTemp and limitTemp have been initialized.             
;;; Return: true or false.  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun lessThan(baseTemp limitTemp)
  (let ((copyBase (copy-sequence baseTemp))
    (copyLimit (copy-sequence limitTemp)))
    (setCelsius copyBase)
    (setCelsius copyLimit)
    (< (getDegrees copyBase) (getDegrees copyLimit)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFullTemp returns a full Temp in degrees scale order. 
;;; Return: degrees, scale.           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun getFullTemp (theTemp)
   (concat (format "%7.2f" (getDegrees theTemp)) " " (char-to-string (getScale theTemp))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; printTemp displays a Temp object.         
;;; Receive: theTemp, a Temp,                 
;;;          buffer, the Temp of a buffer.   
;;; Output: the strings in theTemp to buffer. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun printTemp (theTemp buf)
  (let ((copyTemp (copy-sequence theTemp)))
   (princ (getFullTemp (setFahrenheit theTemp)) buf)
   (princ "\t" buf)
   (princ (getFullTemp (setCelsius theTemp)) buf)
   (princ "\t" buf)
   (princ (getFullTemp (setKelvin theTemp)) buf)
   (princ "\n" buf))      
   theTemp )
