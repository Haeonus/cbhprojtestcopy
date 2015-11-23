SUBROUTINE bubblesort

!----------------------------------------------------------------------------------------
!  Hayden Martz
!  23 November 2015
!
!  Computer Based Honors Freshman Seminar
!  Section 1
!  Darren Evans-Young
!
!  Program: Sort master.db using bubble sort
!           
!  Input: Read in entries in master.db 
!  Output: Write sorted entries to master.db
!---------------------------------------------------------------------------------------

  IMPLICIT NONE

  LOGICAL :: Sorted
  INTEGER :: Pass, NumRecords, First
  CHARACTER :: Rec1*105, Rec2*105

  READ(12, "(I2)", REC = 1) NumRecords
  Sorted = .FALSE.
  Pass = 1

  DO
    IF(Sorted .EQV. .TRUE.) EXIT
    Sorted = .TRUE.
    DO First = 2, NumRecords - Pass + 1
      READ(12, "(a105)", REC = First) Rec1
      READ(12, "(a105)", REC = First + 1) Rec2
      IF(Rec1 < Rec2) CYCLE
      WRITE(12, "(a105)", Rec = First) Rec2
      WRITE(12, "(a105)", Rec = First + 1) Rec1
      Sorted = .FALSE.
    END DO
    Pass = Pass + 1
  END DO

END SUBROUTINE bubblesort
