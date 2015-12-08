SUBROUTINE displaystate

!----------------------------------------------------------------------------------------
!  Hayden Martz
!  18 November 2015
!
!  Computer Based Honors Freshman Seminar
!  Section 1
!  Darren Evans-Young
!
!  Program: Display state Database 
!           
!  Input: Read in state database 
!  Output: Display Information
!---------------------------------------------------------------------------------------

  IMPLICIT NONE
  
  !Declare Variables
  INTEGER :: I,Column, Row, NumRecords,NumRows, ColPos, ColWidth, Code 
  CHARACTER :: List(17)*100, Data*24

  !Initialize Variables
  Column = 1
  Row = 1
  NumRows = 17
  ColWidth = 30

  !Clear List Array
  DO I=1, NumRows
    List(i) = " "
  END DO

  !File open, get length
  READ(7, "(I2)",REC = 1) NumRecords  

  DO I=1, NumRecords
    ColPos = (Column-1)*ColWidth
    
    !Read Data from File
    READ (7, "(A24)", REC = I+1) Data

    !Write Data to List Array Varialbe.
    Code = I
    WRITE(List(Row)(ColPos+1 : ColPos+2), "(I2.2)") Code
    List(Row)(ColPos+4 : ColPos+5) = Data(1:2)
    List(Row)(ColPos+7 : ColPos+27) = Data(3:)

    !Adjust Column and Row Pointers 
    IF(Row>16) THEN
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

END SUBROUTINE displaystate
