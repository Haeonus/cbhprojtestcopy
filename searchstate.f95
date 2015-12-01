SUBROUTINE searchstate(Data, RecNumber)

!Search through state.db for the numbervalue of state.

   IMPLICIT NONE
   CHARACTER, INTENT(IN) :: Data*18
   CHARACTER :: Test*18
   INTEGER, INTENT(OUT) :: RecNumber
   INTEGER :: I, Lengthdb
   LOGICAL :: IntegerIn

   READ(7, "(I2)", REC = 1) Lengthdb
   IntegerIn = ((IACHAR(Data(1:1))>=48.AND.IACHAR(Data(1:1))<=57).AND.(IACHAR(Data(2:2))<=57).AND.IACHAR(Data(2:2))>=47&
                 .OR.IACHAR(Data(2:2)) == 32)
   IF((IntegerIn.AND. Data(3:) == ""  )) THEN
      READ(Data, "(I2)") RecNumber
      IF (RecNumber <1 .OR. RecNumber>Lengthdb) RecNumber = -1
      RETURN
   END IF


   DO I=1, Lengthdb
      READ(7, "(a18)", REC = I+1) Test
      IF(Test(1:2) == Data(1:2) .OR. Test(3:LEN(Data)) == Data) THEN
         RecNumber = I
         RETURN
      END IF
   END DO
   RecNumber = -1

END SUBROUTINE searchstate
