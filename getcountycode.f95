SUBROUTINE getcountycode(CountyCode)

!Searches for county code info from what is entered.

   IMPLICIT NONE
   INTEGER, INTENT(OUT) :: CountyCode
   CHARACTER :: County*12

   CALL SYSTEM("clear")
   WRITE (*,100) "Police Information System"
100  FORMAT(T30,a)
   WRITE (*,150) "Add Record - County"
150  FORMAT(T30,a,//)

   DO
      CALL displaycounty
      WRITE(*, "(T25, a,T35)", ADVANCE = "NO") "County: ";  READ(*, "(a12)") County
      CALL searchcounty(County, CountyCode) 
      IF(CountyCode == -1) THEN
         WRITE(*, "(T20, a)", ADVANCE = "NO") "Non-Existant County. Press enter to retry; "; READ*,
         CYCLE
      END IF
      IF(CountyCode>9) THEN
         WRITE(*, "(T20, a)", ADVANCE = "NO") "Database currently does not support your entry, or codes above 9."
         WRITE(*, "(/, T38, a)", ADVANCE = "NO") "Press enter to continue"
      END IF
      EXIT
   END DO


END SUBROUTINE getcountycode
