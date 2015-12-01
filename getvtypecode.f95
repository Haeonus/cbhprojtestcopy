SUBROUTINE getvtypecode(VtypeCode)

!Test, searches and returns teh code for vtype depending on what is entered.

   IMPLICIT NONE
   INTEGER, INTENT(OUT) :: VtypeCode
   CHARACTER :: Vtype*15

   DO
      WRITE(*, "(T25, a,T35)", ADVANCE = "NO") "Vehicle Type: ";  READ(*, "(a15)") Vtype
      CALL searchvtype(Vtype, VtypeCode) 
      IF(VtypeCode == -1) THEN
         WRITE(*, "(T20, a)", ADVANCE = "NO") "Non-Existant Vehicle Type. Press enter to retry; "; READ*,
         CYCLE
      END IF
      EXIT
   END DO

END SUBROUTINE getvtypecode
