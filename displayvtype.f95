SUBROUTINE displayvtype

!----------------------------------------------------------------------------------------
!  Hayden Martz
!  18 November 2015
!
!  Computer Based Honors Freshman Seminar
!  Section 1
!  Darren Evans-Young
!
!  Program: Display vtype Database 
!           
!  Input: Read in vtype database 
!  Output: Display Information
!---------------------------------------------------------------------------------------

  IMPLICIT NONE
  
  !Declare Variables
  INTEGER :: I,Column, Row, NumRecords,NumRows, ColPos, ColWidth, Code 
  CHARACTER :: List(5)*100, Data*15

  !Initialize Variables
  Column = 1
  Row = 1
  NumRows = 5
  ColWidth = 30

  !Clear List Array
  DO I=1, NumRows
    List(i) = " "
  END DO

  !Open File and get length
  OPEN(7, FILE="vtype.db", FORM="FORMATTED", ACCESS="DIRECT", RECL=15)
  READ(7, "(I2)",REC = 1) NumRecords  

  DO I=1, NumRecords
    ColPos = (Column-1)*ColWidth
    
    !Read Data from File
    READ (7, "(A15)", REC = I+1) Data

    !Write Data to List Array Varialbe.
    Code = I
    WRITE(List(Row)(ColPos+1 : ColPos+2), "(I2.2)") Code
    List(Row)(ColPos+4 : ColPos+18) = Data(1:15)

    !Adjust Column and Row Pointers 
    IF(Row>4) THEN
      Row = 1
      Column = Column +1
    ELSE
      Row = Row + 1
    END IF
  END DO

  !Print Data
  DO I=1, NumRows
    WRITE(*,"(T20,A100)") List(I)
  END DO

  CLOSE(7)

END SUBROUTINE displayvtype
