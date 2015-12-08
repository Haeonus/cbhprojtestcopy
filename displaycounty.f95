SUBROUTINE displaycounty

!----------------------------------------------------------------------------------------
!  Hayden Martz
!  18 November 2015
!
!  Computer Based Honors Freshman Seminar
!  Section 1
!  Darren Evans-Young
!
!  Program: Display county Database 
!           
!  Input: Read in county database 
!  Output: Display Information
!---------------------------------------------------------------------------------------

  IMPLICIT NONE
  
  !Declare Variables
  INTEGER :: I,Column, Row, NumRecords,NumRows, ColPos, ColWidth, Code 
  CHARACTER :: List(23)*100, Data*12

  !Initialize Variables
  Column = 1
  Row = 1
  NumRows = 23
  ColWidth = 30

  !Clear List Array
  DO I=1, NumRows
    List(i) = " "
  END DO
  !File open get length
  READ(8, "(I2)",REC = 1) NumRecords  

  DO I=1, NumRecords
    ColPos = (Column-1)*ColWidth
    !Read Data from File
    READ (8, "(A12)", REC = I+1) Data

    !Write Data to List Array Varialbe.
    Code = I-1
    WRITE(List(Row)(ColPos+1 : ColPos+2), "(I2.2)") Code
    List(Row)(ColPos+4 : ColPos+15) = Data(1:12)

    !Adjust Column and Row Pointers 
    IF(Row>22) THEN
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

END SUBROUTINE displaycounty
