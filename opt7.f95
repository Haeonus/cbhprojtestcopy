SUBROUTINE opt7

  IMPLICIT NONE
  INTEGER :: Lengthdb, I
  CHARACTER :: Recorded*105
  WRITE (*,100) "Police Information System"
100 FORMAT(T30,a)
  WRITE (*,150) "Listing Master Database"
150 FORMAT(T31,a,//)
 
  OPEN(12, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 105)
  READ(12, "(i2)", REC = 1) Lengthdb

  DO I=2, Lengthdb
    READ(12, "(a105)", REC = I) Recorded
    WRITE(*, "(T20, a105)") Recorded
    IF(MOD((I-1),25) == 0) THEN
      WRITE(*, 100, ADVANCE = "NO") "Press Enter to View the next 25: "
      READ*,
      CALL SYSTEM("clear")
      WRITE(*, 100) "Police Information System"
      WRITE(*, 150) "Listing Master Database"
    END IF
  END DO

  WRITE(*, "(T25, a)", ADVANCE = "NO") "Press enter to return to main menu: "
  READ*, 

END SUBROUTINE opt7
