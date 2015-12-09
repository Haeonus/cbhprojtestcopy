SUBROUTINE getvtypecode(VtypeCode)

!Test, searches and returns teh code for vtype depending on what is entered.

   IMPLICIT NONE
   INTEGER, INTENT(OUT) :: VtypeCode
   CHARACTER :: Vtype*15

   CALL SYSTEM("clear")
   WRITE (*,100) "Police Information System"
100  FORMAT(T30,a)
   WRITE (*,150) "Add Record - Vehicle Type"
150  FORMAT(T30,a,//)

  DO
      CALL displayvtype
      WRITE(*, "(/, T25, a,T35)", ADVANCE = "NO") "Vehicle Type: ";  READ(*, "(a15)") Vtype
      CALL searchvtype(Vtype, VtypeCode) 
      IF(VtypeCode == -1) THEN
         WRITE(*, "(T20, a)", ADVANCE = "NO") "Non-Existant Vehicle Type. Press enter to retry; "; READ*,
         CYCLE
PRINT*, Vtypecode; READ*,
      ELSE IF(Vtypecode > 9) THEN
         WRITE(*, "(T20, a)", ADVANCE = "NO") "Vehicle indexes above 9 are not yet supported. Press enter to retry: "
         READ*,
         CYCLE
      END IF
      EXIT
   END DO

END SUBROUTINE getvtypecode
