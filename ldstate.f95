SUBROUTINE ldstate

!----------------------------------------------------------------------------------------
!  Hayden Martz
!  16 November 2015
!
!  Computer Based Honors Freshman Seminar
!  Section 1
!  Darren Evans-Young
!
!  Program: Load State Database 
!           
!  Input: Read in Sequential State File [state.data] 
!  Output: Write to Direct State database [state.db]
!---------------------------------------------------------------------------------------

  IMPLICIT NONE

  ! Declare Variables
  INTEGER :: Code, Bad, Good, rc
  CHARACTER :: Data*18

  !Open read and write files
  OPEN(7, FILE="state.data")
  OPEN(8, FILE="state.db", FORM="FORMATTED", ACCESS="DIRECT", RECL=18)
  
  !Set Good and Bad counters (for good and bad data)
  Good = 0; Bad = 0

  !Main DO loop; read through sequential file and save data to direct file
  DO
    READ (7, 100, IOSTAT=rc) Code, Data
  100 FORMAT(I2, A18)
    IF(rc /= 0) EXIT !Exit on end of file condition
    
    !Make sure data is within parameters. (Good data)
    IF(code < 1 .OR. 51 < code) THEN
      Bad = Bad+1
      CYCLE
    END IF

    !Write good data to direct access file
    WRITE (8, 200, REC=(Code+1)) Data
  200 FORMAT(A18)

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
400 FORMAT(T15,"Good: ",I2,"  Bad: ",I2)

END SUBROUTINE ldstate
