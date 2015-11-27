SUBROUTINE ldmaster

!----------------------------------------------------------------------------------------
!  Hayden Martz
!  20  November 2015
!
!  Computer Based Honors Freshman Seminar
!  Section 1
!  Darren Evans-Young
!
!  Program: Load Police1 and Police2 Database 
!           
!  Input: Read in Sequential County Files [police1.data and police2.data] 
!  Output: Write to Direct Master Database [master.db]
!---------------------------------------------------------------------------------------

  IMPLICIT NONE

  INTEGER :: Counter, ErrorCode
  CHARACTER :: Datap1*3, Datap2*2, Datap3*78, Datap4*22

  OPEN(7, FILE = "police1.data")
  OPEN(8, FILE = "police2.data")
  OPEN(12, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 105)

  Counter = 0
  ErrorCode = 0

  DO
    READ(7, 100, IOSTAT = ErrorCode) Datap1, Datap2, Datap3, Datap4
  100 FORMAT(a3, 1x, a2, 1x, a78, 1x, a22)

    IF (ErrorCode /= 0) EXIT
    Counter = Counter + 1
    
    WRITE(12, 200, REC = Counter +1) Datap1, Datap2, Datap3, Datap4
  200 FORMAT(a3, a2, a78, a22)
  END DO

  DO
    READ(8, 100, IOSTAT = ErrorCode) Datap1, Datap2, Datap3, Datap4
    
    IF (ErrorCode /= 0) EXIT
    Counter = Counter + 1

    WRITE(12, 200, REC = Counter +1) Datap1, Datap2, Datap3, Datap4
  END DO

  WRITE (12, "(I2)", REC = 1) Counter

  CALL bubblesort

  Close(7); Close(8); Close(9)

END SUBROUTINE ldmaster
