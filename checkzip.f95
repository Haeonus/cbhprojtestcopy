SUBROUTINE checkzip(ZipIn, InvalidZip, ErrorCode, ZipOut)

!Checks to make sure Zip passed into it is a valid Zip, returns INVALID logical value as true if invalid.

  IMPLICIT NONE
  CHARACTER, INTENT(IN) :: ZipIn*11
  CHARACTER, INTENT(OUT) ::ZipOut*9
  INTEGER :: ErrorCode2, TestZip, I, CharValue
  INTEGER, INTENT(IN) :: ErrorCode
  LOGICAL, INTENT(OUT) :: InvalidZip

    InvalidZip = .FALSE.
    IF(ErrorCode /= 0 .OR. ZipIn(11:11) /=" ") THEN
      InvalidZip = .TRUE.
      RETURN
    END IF
    IF(ZipIn(6:6) == "-") THEN
       ZipOut(1:5) = ZipIn(1:5)
       ZipOut(6:) = ZipIn(7:)
    ELSE
      ZipOut = ZipIn(1:9)
    END IF

    DO I=1, 9
      CharValue = IACHAR(ZipOut(I:I))
      IF(CharValue<48 .OR. CharValue>57) THEN
         InvalidZip = .TRUE.
         RETURN
      END IF
    END DO

END SUBROUTINE checkzip
