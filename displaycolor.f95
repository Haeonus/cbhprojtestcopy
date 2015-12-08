SUBROUTINE displaycolor

!----------------------------------------------------------------------------------------
!  Hayden Martz
!  16 November 2015
!
!  Computer Based Honors Freshman Seminar
!  Section 1
!  Darren Evans-Young
!
!  Program: Display Color Database 
!           
!  Input: Read in Sequential Color File [color.data] 
!  Output: Display to Direct color database [color.db]
!---------------------------------------------------------------------------------------

  IMPLICIT NONE
  
  !Declare Variables
  INTEGER :: I,Column, Row, NumRecords,NumRows, ColPos, ColWidth, Code 
  CHARACTER :: List(15)*100, Data*25

  !Initialize Variables
  Column = 1
  Row = 1
  NumRows = 15
  ColWidth = 30

  !Clear List Array
  DO I=1, NumRows
    List(i) = " "
  END DO

  !File open, get length
  READ(11, "(I2)",REC = 1) NumRecords  

  DO I=1, NumRecords
    ColPos = (Column-1)*ColWidth
    
    !Read Data from File
    READ (11, "(A25)", REC = I+1) Data

    !Write Data to List Array Varialbe.
    Code = I
    WRITE(List(Row)(ColPos+1 : ColPos+2), "(I2.2)") Code
    List(Row)(ColPos+4 : ColPos+6) = Data(1:3)
    List(Row)(ColPos+8 : ColPos+29) = Data(4:25)

    !Adjust Column and Row Pointers 
    IF(Row>14) THEN
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

END SUBROUTINE displaycolor
