SUBROUTINE searchcounty(Data, RecNumber)

!Search through state.db for the numbervalue of state.

   IMPLICIT NONE
   CHARACTER, INTENT(IN) :: Data*12
   CHARACTER :: Test*12, ReadIn*12
   INTEGER, INTENT(OUT) :: RecNumber
   INTEGER :: I, Lengthdb, LengthData, ErrorCode
   LOGICAL :: IntegerIn

   READ(8, "(I2)", REC = 1) Lengthdb

   IntegerIn = ((IACHAR(Data(1:1))>=48.AND.IACHAR(Data(1:1))<=57).AND.(IACHAR(Data(2:2))<=57).AND.IACHAR(Data(2:2))>=47&
                 .OR.IACHAR(Data(2:2)) == 32)

   IF(IntegerIn) THEN
      READ(Data, "(I2)", IOSTAT = ErrorCode) RecNumber
      IF (RecNumber <0 .OR. RecNumber>Lengthdb-1) THEN
         RecNumber = -1
         RETURN
      ELSE IF(ErrorCode ==0) THEN
         RETURN
      END IF
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
      READ(8, "(a18)", REC = I+1) Test
      IF(Test(1:LEN(ReadIn)) == ReadIn) THEN
         RecNumber = I - 1
         RETURN
      END IF
   END DO
   RecNumber = -1

END SUBROUTINE searchcounty
