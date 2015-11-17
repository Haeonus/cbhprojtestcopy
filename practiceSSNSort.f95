PROGRAM practiceSSNSort

INTEGER :: rc
CHARACTER :: Code*11, Data*100, PreviousSSN*11, WorkingSSn*11
LOGICAL :: DoneSearching

  OPEN(7, FILE="practicessn.data")
 
    PreviousSSN = "000-00-0000"
    DoneSearching = .FALSE.
DO 
    REWIND(7)
    WorkingSSN = "999-99-9999"
    DO !Get the next smallest SSN in file (After PreviousSSN)
      READ(7,100,IOSTAT=rc) Code, Data
    100 FORMAT(A11, A100)
      IF (Code < WorkingSSN .AND. Code>PreviousSSN) THEN
        WorkingSSN = Code
      END IF
      IF(rc /=0) EXIT
    END DO
    IF(WorkingSSN == "999-99-9999" .AND. Code /= "999-99-9999") THEN
      EXIT
    END IF
    PreviousSSN=WorkingSSN
    PRINT *, 
    PRINT *, PreviousSSN 
    READ *,
    IF(DoneSearching) EXIT
END DO

CLOSE(7)

END PROGRAM practiceSSNSort
