SUBROUTINE getzipcode(ZipCodeOut)

!Asks for a zipcode, checks to make sure it is correct, and then returns the output (no hyphen)

   IMPLICIT NONE
   CHARACTER, INTENT(OUT) :: ZipCodeOut*9
   CHARACTER :: ZipCodeIn*11
   LOGICAL :: InvalidZip
   INTEGER :: ErrorCode
   DO
      WRITE(*, "(T25, a,T35)", ADVANCE = "NO") "Zip Code: ";  READ(*, "(a11)", IOSTAT = ErrorCode) ZipCodeIn
      CALL checkzip(ZipCodeIn, InvalidZip, ErrorCode, ZipCodeOut)
      IF(InvalidZip) THEN
         WRITE(*, "(T20, A)", ADVANCE = "NO") "Invalid Zip Code entered. Press enter to retry: "
         READ *,
         CYCLE
      END IF
      EXIT
   END DO
 
END SUBROUTINE getzipcode
