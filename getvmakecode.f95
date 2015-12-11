SUBROUTINE getvmakecode(VmakeCode)

!Search and return vmakecode depending on user input

   IMPLICIT NONE
   INTEGER, INTENT (OUT) :: VmakeCode
   CHARACTER :: Vmake*11


   DO
      CALL SYSTEM("clear")
      WRITE (*,100) "Police Information System"
100     FORMAT(T30,a)
      WRITE (*,150) "Record - Vehicle Make"
150     FORMAT(T30,a,//)
     CALL displayvmake
      WRITE(*, "(/, T25, a,T35)", ADVANCE = "NO") "Vehicle Make: ";  READ(*, "(a11)") Vmake
      CALL searchvmake(Vmake, VmakeCode) 
      IF(VmakeCode == -1) THEN
         WRITE(*, "(T20, a)", ADVANCE = "NO") "Non-Existant Vehicle Make. Press enter to retry; "; READ*,
         CYCLE
      END IF
      EXIT
   END DO

END SUBROUTINE getvmakecode
