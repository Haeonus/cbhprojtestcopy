SUBROUTINE getcolorcodetop(ColorCode)

!Get info from user, search, and return codes for top and bottom colors.

   IMPLICIT NONE
   INTEGER, INTENT(OUT) :: ColorCode
   CHARACTER :: VColor*25

   CALL SYSTEM("clear")
   WRITE (*,100) "Police Information System"
100  FORMAT(T30,a)
   WRITE (*,150) "Add Record - Vehicle Color (Top)"
150  FORMAT(T30,a,//)

  DO
      CALL displaycolor
      WRITE(*, "(T25, a,T35)", ADVANCE = "NO") "Vehicle Color (Top): ";  READ(*, "(a25)") VColor
      CALL searchcolor(VColor, ColorCode) 
      IF(ColorCode == -1) THEN
        WRITE(*, "(T20, a)", ADVANCE = "NO") "Non-Existant Vehicle Color. Press enter to retry; "; READ*,
         CYCLE
      END IF
      EXIT
   END DO

END SUBROUTINE getcolorcodetop
