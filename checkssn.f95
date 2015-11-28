SUBROUTINE checkssn(SSNIn, InvalidSSN, ErrorCode, SSNOut)

!Checks to make sure SSN passed into it is a valid SSN, returns INVALID logical value as true if invalid.

  IMPLICIT NONE
  CHARACTER, INTENT(IN) :: SSNIn*12
  CHARACTER, INTENT(OUT) ::SSNOut*9
  INTEGER :: ErrorCode2, TestSSN, I, CharValue
  INTEGER, INTENT(IN) :: ErrorCode
  LOGICAL, INTENT(OUT) :: InvalidSSN


    InvalidSSN = .FALSE.
    IF(ErrorCode /= 0 .OR. SSNIn(12:12) /=" ") THEN
      InvalidSSN = .TRUE.
    ELSE IF(SSNIn(4:4) == "-" .AND. SSNIn(7:7) == "-") THEN
       SSNOut(1:3) = SSNIn(1:3)
       SSNOut(4:5) = SSNIn(5:6)
       SSNOut(6:9) = SSNIn(8:11)
    ELSE
      SSNOut = SSNIn(1:9)
    END IF

    DO I=1, 9
      CharValue = IACHAR(SSNOut(I:I))
      IF(CharValue<48 .OR. CharValue>57) THEN
         InvalidSSN = .TRUE.
         EXIT
      END IF
    END DO
END SUBROUTINE checkssn
