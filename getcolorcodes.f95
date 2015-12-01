SUBROUTINE getcolorcodes(ColorCode)

!Get info from user, search, and return codes for top and bottom colors.

   IMPLICIT NONE
   INTEGER, INTENT(OUT) :: ColorCode
   CHARACTER :: VColor*25

   DO
      WRITE(*, "(T25, a,T35)", ADVANCE = "NO") "Vehicle Color (Top): ";  READ(*, "(a25)") VColor
      CALL searchcolor(VColor, ColorCode) 
      IF(ColorCode == -1) THEN
        WRITE(*, "(T20, a)", ADVANCE = "NO") "Non-Existant Vehicle Color. Press enter to retry; "; READ*,
         CYCLE
      END IF
      EXIT
   END DO

END SUBROUTINE getcolorcodes
