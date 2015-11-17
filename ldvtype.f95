SUBROUTINE ldvtype

!----------------------------------------------------------------------------------------
!  Hayden Martz
!  16 November 2015
!
!  Computer Based Honors Freshman Seminar
!  Section 1
!  Darren Evans-Young
!
!  Program: Load vtype Database 
!           
!  Input: Read in Sequential vtype File [vtype.data] 
!  Output: Write to Direct vtype database [vtype.db]
!---------------------------------------------------------------------------------------

  IMPLICIT NONE

  ! Declare Variables
  INTEGER :: Code, Bad, Good, rc
  CHARACTER :: Data*15

  !Open read and write files
  OPEN(7, FILE="vtype.data")
  OPEN(8, fILE="vtype.db", FORM="FORMATTED", ACCESS="DIRECT", RECL=15)
  
  !Set Good and Bad counters (for good and bad data)
  Good = 0; Bad = 0

  !Main DO loop; read through sequential file and save data to direct file
  DO
    READ (7, 100, IOSTAT=rc) Code, Data
  100 FORMAT(I2, A15)
    IF(rc /= 0) EXIT !Exit on end of file condition
    
    !Make sure data is within parameters. (Good data)
    IF(code < 1 .OR. 15 < code) THEN
      Bad = Bad+1
      CYCLE
    END IF

    !Write good data to direct access file
    WRITE (8, 200, REC=(Code+1)) Data
  200 FORMAT(A15)

    !Increment good data counter
    Good = Good +1 
  END DO

  !Write file length (good) to Record #1
  WRITE(8, 300, REC=1) Good
300 FORMAT(I2)

  !Close Files
  CLOSE (7); CLOSE(8)

  !Print out debug message, number of good/bad data entries
  WRITE(*,400) Good,Bad
400 FORMAT(T8,"Good: ",I2,"  Bad: ",I2)

END SUBROUTINE ldvtype
