! yearCode.f90 computes the integer code for a given academic year.
! Dr. Adams, for CS 214 at Calvin College.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

PROGRAM YearCodes

   IMPLICIT NONE                         ! disallow undeclared vars
   CHARACTER(12) :: year                 ! declare string var
                                         ! declare function

   PRINT*, 'Enter your academic year: '  ! prompt
   READ*, year                           ! get year
   PRINT*, YearCode(year)                ! call function & display

CONTAINS

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! YearCode() computes the integer code for a given academic year.!
! Receive: year, a string.                                       !
! PRE: year is one of {freshman, sophomore, junior, senior}.     !
! Return: the code corresponding to year.                        !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! Replace this line with a definition of YearCode() here ... 
FUNCTION YearCode(year) RESULT code
  IMPLICIT NONE
  CHARACTER(12) :: year
  INTEGER :: code

END FUNCTION YearCode

END PROGRAM
