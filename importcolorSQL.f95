PROGRAM importcolorSQL

!----------------------------------------------------------------------------------------
!  Hayden Martz
!  2 February 2016
!
!  Computer Based Honors Freshman Seminar
!  Section 1
!  Darren Evans-Young
!
!  Program: Print out SQL insert statements. 
!           
!  Input: Colors from color file, read sequentially
!  Output: For each color, print out a SQL insert statement
!---------------------------------------------------------------------------------------

   IMPLICIT NONE
   INTEGER :: ErrorCode
   CHARACTER :: Code*2, Abbreviation*3, Name*22

   OPEN(7, FILE="color.data")
   ErrorCode = 0

   DO
      READ(7, "(a2, a3, a22)", Iostat = ErrorCode) Abbreviation, Code, Name
      IF (ErrorCode /= 0) EXIT
      WRITE(*, 100) Code, Abbreviation, Name(:Len_TRIM(Name))
100     FORMAT("INSERT INTO Color (Code, Abbreviation, Name) VALUES (", a2, ", ", a3, ", ", a, ")")
   END DO

   CLOSE(7)

END PROGRAM importcolorSQL
