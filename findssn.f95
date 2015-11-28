SUBROUTINE findssn(SSNIn, RecNumber)

!Finds the correct file using a recursive sorting method, searchssn.f95

  IMPLICIT NONE
  INTEGER, INTENT(IN) :: SSNIn
  INTEGER, INTENT(OUT) :: RecNumber
  INTEGER :: NumRecords

  RecNumber = 0
  READ(12, "(I2)", REC = 1) NumRecords
  CALL searchssn(SSNIn, 2, NumRecords+1, RecNumber)

END SUBROUTINE findssn
