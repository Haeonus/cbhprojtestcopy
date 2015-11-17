SUBROUTINE ldpolice2

!----------------------------------------------------------------------------------------
!  Hayden Martz
!  16 November 2015
!
!  Computer Based Honors Freshman Seminar
!  Section 1
!  Darren Evans-Young
!
!  Program: Load police2 Database 
!           
!  Input: Read in Sequential police2 File [police2.data] 
!  Output: Write to Direct police2 database [police2.db]
!---------------------------------------------------------------------------------------

  IMPLICIT NONE

  ! Declare Variables
  INTEGER :: rct, Bad, Good, rc, Pointer
  CHARACTER :: PreviousSSN*11,WorkingSSN*11, Code*11, Data*100
  LOGICAL :: EndofScanning 
  !Variables for testing SSN
  INTEGER :: start, middle, last !first, second, and third number thread
  CHARACTER :: first*1, second*1 !first and second hyphen  


  !Open read and write files
  OPEN(7, FILE="police2.data")
  OPEN(8, fILE="police2.db", FORM="FORMATTED", ACCESS="DIRECT", RECL=111)
  
  !Set PreviousSSN and Pointer data to initial values
  PreviousSSN = "000-00-0000"; Pointer = 2

  !Scroll through data, saving smallest SSN greater than previousSSN at Pointer.
  DO
    !PRINT *,"Starting outer Do loop, Rewinding"
    REWIND(7) !To search for next smallest through entire file.
    WorkingSSN = "999-99-9999" !Reset WorkingSSN to access all the SSN #'s
    
    !Set good and bad data to 0, so that it does count #Records*#passes
     Good = 0; Bad = 0; 

    DO !Get the next smallest SSN in file (After PreviousSSN)
      !PRINT*, "About to start do inner loop"
      READ(7,100,IOSTAT=rc) Code, Data !Get next line from data file.
    100 FORMAT(A11, A100)

      !Test for proper SSN Format
      !PRINT *, "About to Read Code:"
      READ(Code,200,IOSTAT=rct) start,first, middle,second, last
    200 Format(i3,a1,i2,a1,i4)
      !PRINT *, start, first, middle, second, last
      IF (rct/=0 .OR. (first/="-" .OR. second /="-")) THEN
        Bad = Bad + 1
        CYCLE
      ELSE
        Good = Good + 1
      END IF

      !Get the next smallest SSN and save it to database.
      IF(Code < WorkingSSN .AND. Code>PreviousSSN) THEN
        WorkingSSN = Code
      END IF
      IF(rc /= 0) EXIT
      !PRINT *, "End inner do loop"
    END DO
 
    !Make sure that you haven't reached the end of file
    IF(WorkingSSN == "999-99-9999" .AND. Code/="999-99-9999") THEN 
      !PRINT*, "Done Scanning"
      EXIT !Condition only met at end of scan.
    END IF
   
    !PRINT*, "Writing..."
    WRITE(8,300,REC=Pointer) WorkingSSN,Data!Write Data to File
  300 FORMAT(a11,a100)
    Pointer = Pointer + 1
    Good = Good + 1
    PreviousSSN = WorkingSSN
    !PRINT*, PreviousSSN
  END DO

  !Write file length (good) to Record #1
  WRITE(8, 400, REC=1) Good
400 FORMAT(I2)

  !Close Files
  CLOSE (7); CLOSE(8)

  !Print out debug message, number of good/bad data entries
  WRITE(*,500) Good,Bad
500 FORMAT("Good: ",I2,T20,"Bad: ",I2)

END SUBROUTINE ldpolice2
