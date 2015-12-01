SUBROUTINE getvmakecode(VmakeCode)

!Search and return vmakecode depending on user input

   IMPLICIT NONE
   INTEGER, INTENT (OUT) :: VmakeCode
   CHARACTER :: Vmake*11

   DO
      WRITE(*, "(T25, a,T35)", ADVANCE = "NO") "Vehicle Make: ";  READ(*, "(a11)") Vmake
      CALL searchvmake(Vmake, VmakeCode) 
      IF(VmakeCode == -1) THEN
         WRITE(*, "(T20, a)", ADVANCE = "NO") "Non-Existant Vehicle Make. Press enter to retry; "; READ*,
         CYCLE
      END IF
      EXIT
   END DO

END SUBROUTINE getvmakecode
