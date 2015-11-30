SUBROUTINE searchvmake(Data, RecNumber)

!Search through vmake.db for the numbervalue of vmake.

  IMPLICIT NONE
  CHARACTER, INTENT(IN) :: Data*11
  CHARACTER :: Test*11, ReadIn*11
  INTEGER, INTENT(OUT) :: RecNumber
  INTEGER :: I, Lengthdb, LengthData

  READ(10, "(I2)", REC = 1) Lengthdb
  IF(((IACHAR(Data(1:1))>=48 .AND. IACHAR(Data(2:2))<57) .AND. Data(3:) == ""  )) THEN
    READ(Data, "(I2)") RecNumber
    IF(RecNumber <1 .OR. RecNumber>Lengthdb) RecNumber = -1
    RETURN
  END IF

  ReadIn = Data

  ! Convert to Upper Casei
  LengthData = LEN(ReadIn)
  DO I=1, LengthData
    IF(IACHAR(ReadIn(I:I)) >90) THEN
      ReadIn(I:I) = ACHAR(IACHAR(ReadIn(I:I)) - 32)
    END IF
  END DO

  DO I=1, Lengthdb
    READ(10, "(a11)", REC = I+1) Test
    IF(Test(1:LEN(ReadIn)) == ReadIn) THEN
      RecNumber = I + 1
      RETURN
    END IF
  END DO
  RecNumber = -1

END SUBROUTINE searchvmake
