;;; tempTester.el simulates and tests an e-LISP Temp type.
;;;
;;; Prof: Dr. Adams, for CS 214 at Calvin College.
;;; Student: Chan Kim (ck45)
;;; Date: 4/9/2018
;;;

(setq load-path (cons "." load-path))
("." "/usr/share/emacs/25.3/site-lisp" "/usr/share/emacs/site-lisp" "/usr/share/emacs/25.3/lisp" "/usr/share/emacs/25.3/lisp/vc" "/usr/share/emacs/25.3/lisp/url" "/usr/share/emacs/25.3/lisp/textmodes" "/usr/share/emacs/25.3/lisp/progmodes" "/usr/share/emacs/25.3/lisp/play" "/usr/share/emacs/25.3/lisp/org" "/usr/share/emacs/25.3/lisp/nxml" "/usr/share/emacs/25.3/lisp/net" ...)


(load "Temp.el")
t


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A simple driver for our Temp functions. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (require 'cl)                              
  (setq baseTemp (Temp 0.0 ?C))
  (setq limitTemp (Temp 0.0 ?C))  ; build Temps

  (readTemp baseTemp)
  (readTemp limitTemp)
  (setq stepValue (string-to-number (read-from-minibuffer "Enter the setp value: ")))

  (setq buf (get-buffer "tempTester.el"))    ; buf = this buffer
  (princ (getFullTemp baseTemp) buf)
  (princ "\n" buf)
  (princ (getFullTemp limitTemp) buf)
  (princ "\n" buf)
  (princ stepValue buf)
  (princ "\n" buf)      
  (while (lessThan baseTemp limitTemp)
    (printTemp baseTemp buf)           
    (raise baseTemp stepValue))
)
   0.00 F
 100.00 C
2.5
   0.00 F	 -17.78 C	 255.37 K
   4.50 F	 -15.28 C	 257.87 K
   9.00 F	 -12.78 C	 260.37 K
  13.50 F	 -10.28 C	 262.87 K
  18.00 F	  -7.78 C	 265.37 K
  22.50 F	  -5.28 C	 267.87 K
  27.00 F	  -2.78 C	 270.37 K
  31.50 F	  -0.28 C	 272.87 K
  36.00 F	   2.22 C	 275.37 K
  40.50 F	   4.72 C	 277.87 K
  45.00 F	   7.22 C	 280.37 K
  49.50 F	   9.72 C	 282.87 K
  54.00 F	  12.22 C	 285.37 K
  58.50 F	  14.72 C	 287.87 K
  63.00 F	  17.22 C	 290.37 K
  67.50 F	  19.72 C	 292.87 K
  72.00 F	  22.22 C	 295.37 K
  76.50 F	  24.72 C	 297.87 K
  81.00 F	  27.22 C	 300.37 K
  85.50 F	  29.72 C	 302.87 K
  90.00 F	  32.22 C	 305.37 K
  94.50 F	  34.72 C	 307.87 K
  99.00 F	  37.22 C	 310.37 K
 103.50 F	  39.72 C	 312.87 K
 108.00 F	  42.22 C	 315.37 K
 112.50 F	  44.72 C	 317.87 K
 117.00 F	  47.22 C	 320.37 K
 121.50 F	  49.72 C	 322.87 K
 126.00 F	  52.22 C	 325.37 K
 130.50 F	  54.72 C	 327.87 K
 135.00 F	  57.22 C	 330.37 K
 139.50 F	  59.72 C	 332.87 K
 144.00 F	  62.22 C	 335.37 K
 148.50 F	  64.72 C	 337.87 K
 153.00 F	  67.22 C	 340.37 K
 157.50 F	  69.72 C	 342.87 K
 162.00 F	  72.22 C	 345.37 K
 166.50 F	  74.72 C	 347.87 K
 171.00 F	  77.22 C	 350.37 K
 175.50 F	  79.72 C	 352.87 K
 180.00 F	  82.22 C	 355.37 K
 184.50 F	  84.72 C	 357.87 K
 189.00 F	  87.22 C	 360.37 K
 193.50 F	  89.72 C	 362.87 K
 198.00 F	  92.22 C	 365.37 K
 202.50 F	  94.72 C	 367.87 K
 207.00 F	  97.22 C	 370.37 K
 211.50 F	  99.72 C	 372.87 K
nil

   0.00 K
 212.00 F
20.0
-459.67 F	-273.15 C	   0.00 K
-423.67 F	-253.15 C	  20.00 K
-387.67 F	-233.15 C	  40.00 K
-351.67 F	-213.15 C	  60.00 K
-315.67 F	-193.15 C	  80.00 K
-279.67 F	-173.15 C	 100.00 K
-243.67 F	-153.15 C	 120.00 K
-207.67 F	-133.15 C	 140.00 K
-171.67 F	-113.15 C	 160.00 K
-135.67 F	 -93.15 C	 180.00 K
 -99.67 F	 -73.15 C	 200.00 K
 -63.67 F	 -53.15 C	 220.00 K
 -27.67 F	 -33.15 C	 240.00 K
   8.33 F	 -13.15 C	 260.00 K
  44.33 F	   6.85 C	 280.00 K
  80.33 F	  26.85 C	 300.00 K
 116.33 F	  46.85 C	 320.00 K
 152.33 F	  66.85 C	 340.00 K
 188.33 F	  86.85 C	 360.00 K
nil


