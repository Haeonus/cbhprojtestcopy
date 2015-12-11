SUBROUTINE searchstate(Data, RecNumber)

!Search through state.db for the numbervalue of state.

   IMPLICIT NONE
   CHARACTER, INTENT(IN) :: Data*24
   CHARACTER :: Test*24
   INTEGER, INTENT(OUT) :: RecNumber
   INTEGER :: I, Lengthdb, ErrorCode
   LOGICAL :: IntegerIn

   READ(7, "(I2)", REC = 1) Lengthdb
   IntegerIn = ((IACHAR(Data(1:1))>=48.AND.IACHAR(Data(1:1))<=57).AND.((IACHAR(Data(2:2))<=57).AND.IACHAR(Data(2:2))>=47)&
                 .OR.IACHAR(Data(2:2)) == 32)
   IF(IntegerIn) THEN
      READ(Data, "(I2)", IOSTAT = ErrorCode) RecNumber
      IF ((RecNumber <1 .OR. RecNumber>Lengthdb)) THEN
         RecNumber = -1
         RETURN
      ELSE IF(ErrorCode == 0) THEN
         RETURN
      END IF
   END IF

   DO I=1, Lengthdb
      READ(7, "(a24)", REC = I+1) Test
      IF(Test(1:2) == Data(1:2) .OR. Test(3:LEN(Data)) == Data) THEN
         RecNumber = I
         RETURN
      END IF
   END DO
   RecNumber = -1

END SUBROUTINE searchstate
