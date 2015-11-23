PROGRAM CHKMASTER

  IMPLICIT NONE
  CHARACTER:: STR*70
  INTEGER :: NRECS,I

  OPEN(10, FILE="./master.db", ACCESS='DIRECT', FORM='FORMATTED', RECL=105)
  READ(10,'(I2)',REC=1) NRECS
  WRITE(*,70)
  70 FORMAT(/,'Reading file: police.db',//, &
             'Note: Only 70 columns of the record will be printed.'/)
  WRITE(*,80,ADVANCE='NO')
  80 FORMAT('Press ENTER to continue...')
  READ*
  WRITE(*,90) NRECS
  90 FORMAT("Physical Record #01->Value is ",I2.2)

  DO I=2,NRECS+1
     READ(10,'(A70)', REC=I) STR
     WRITE(*,100) I,STR
     100 FORMAT("Record #",I2.2,'->',A70)
  END DO

END PROGRAM CHKMASTER
