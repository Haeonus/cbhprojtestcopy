SUBROUTINE getstatecode(StateCode)

!Get state code form user and search for it in database. Then return code.
!Search by code, 2 Letter State code, and state name

   IMPLICIT NONE
   INTEGER, INTENT(OUT) :: StateCode
   CHARACTER :: State*24

   CALL SYSTEM("clear")
   WRITE (*,100) "Police Information System"
100  FORMAT(T30,a)
   WRITE (*,150) "Add Record - State"
150  FORMAT(T30,a,//)
 
   DO
      CALL displaystate
      WRITE(*, "(/, T25, a,T35)", ADVANCE = "NO") "State: ";  READ(*, "(a24)") State
      CALL searchstate(State, StateCode) 
      IF(StateCode == -1) THEN
         WRITE(*, "(T20, a)", ADVANCE = "NO") "Non-Existant State. Press enter to retry; "; READ*,
         CYCLE
      END IF
      EXIT
   END DO


END SUBROUTINE getstatecode
