SUBROUTINE gettagnumber(TagNumber)

!Gets tag number. Made seperate subroutine for consistency, debugging, and simplification.

   IMPLICIT NONE
   CHARACTER, INTENT(OUT) :: TagNumber*8

   DO
      TagNumber = ""
      WRITE(*, "(T25, a, T35)", ADVANCE = "NO") "Vehicle Tag: ";  READ(*,"(a8)") TagNumber 
      IF(LEN(TRIM(TagNumber)) <= 7) EXIT
      WRITE(*, "(T20, a)", ADVANCE = "NO") "Incorrect Tag. Press enter to retry; "; READ*
   END DO

END SUBROUTINE gettagnumber
