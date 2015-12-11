SUBROUTINE searchvmake(Data, RecNumber)

!Search through vmake.db for the numbervalue of vmake.

   IMPLICIT NONE
   CHARACTER, INTENT(IN) :: Data*11
   CHARACTER :: Test*11, ReadIn*11
   INTEGER, INTENT(OUT) :: RecNumber
   INTEGER :: I, Lengthdb, LengthData, ErrorCode
   LOGICAL :: IntegerIn

   READ(10, "(I2)", REC = 1) Lengthdb
   IntegerIn = ((IACHAR(Data(1:1))>=48.AND.IACHAR(Data(1:1))<=57).AND.(IACHAR(Data(2:2))<=57).AND.IACHAR(Data(2:2))>=47&
                 .OR.IACHAR(Data(2:2)) == 32)

   IF(IntegerIn) THEN
      READ(Data, "(I2)",IOSTAT = ErrorCode) RecNumber
      IF(RecNumber <1 .OR. RecNumber>Lengthdb) THEN
         RecNumber = -1
         RETURN
      ELSE IF(ErrorCode == 0) THEN
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
      READ(10, "(a11)", REC = I+1) Test
      IF(Test(1:LEN(ReadIn)) == ReadIn) THEN
         RecNumber = I
         RETURN
      END IF
   END DO
   RecNumber = -1

END SUBROUTINE searchvmake
