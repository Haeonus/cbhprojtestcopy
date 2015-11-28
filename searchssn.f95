RECURSIVE SUBROUTINE searchssn(RecValue, MinRecord, MaxRecord, RecNumber)

  IMPLICIT NONE
  CHARACTER, INTENT(IN) :: RecValue*9
  INTEGER, INTENT(IN) :: MinRecord, MaxRecord
  INTEGER, INTENT(OUT) :: RecNumber

  CHARACTER :: TestRecValue*9, TestLastRecValue*9
  INTEGER :: Middle
  
  Middle = (MinRecord+MaxRecord)/2  

  READ(12, "(A9)", REC = Middle) TestRecValue
  READ(12, "(A9)", REC = MaxRecord) TestLastRecValue

  IF(MinRecord == MaxRecord) THEN
    RETURN
  ELSE IF(RecValue == TestRecValue) THEN
    RecNumber = Middle
    RETURN
  ELSE IF(RecValue == TestLastRecValue) THEN
    RecNumber = MaxRecord
    RETURN
  ELSE IF(RecValue < TestRecValue) THEN
    CALL searchssn(RecValue, MinRecord, Middle, RecNumber)
  ELSE IF(RecValue > TestRecValue) THEN
    CALL searchssn(RecValue, Middle, MaxRecord, RecNumber)
  END IF
END SUBROUTINE searchssn
