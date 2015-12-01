SUBROUTINE getcountycode(CountyCode)

!Searches for county code info from what is entered.

   IMPLICIT NONE
   INTEGER, INTENT(OUT) :: CountyCode
   CHARACTER :: County*12
   DO
      WRITE(*, "(T25, a,T35)", ADVANCE = "NO") "County: ";  READ(*, "(a12)") County
      CALL searchcounty(County, CountyCode) 
      IF(CountyCode == -1) THEN
         WRITE(*, "(T20, a)", ADVANCE = "NO") "Non-Existant County. Press enter to retry; "; READ*,
         CYCLE
      END IF
      EXIT
   END DO


END SUBROUTINE getcountycode