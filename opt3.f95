SUBROUTINE opt3

!----------------------------------------------------------------------------------------
!  Hayden Martz
!  27 November 2015
!
!  Computer Based Honors Freshman Seminar
!  Section 1
!  Darren Evans-Young
!
!  Program: Ask for SSN, Search and Display Info
!           
!  Input: SSN. 
!  Output: Information collected from all the databases.
!---------------------------------------------------------------------------------------


  IMPLICIT NONE
  CHARACTER :: SSNIn*12, SSNOut*9, FinalSSN*11, Data*105 !Data is temprorary
  INTEGER :: ErrorCode, ErrorCode2, TestSSN, I, RecNumber
  LOGICAL :: InvalidSSN

  OPEN(7, FILE = "state.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 18)
  OPEN(8, FILE = "county.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 12)
  OPEN(9, FILE = "vtype.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 15)
  OPEN(10, FILE = "vmake.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 11)
  OPEN(11, FILE = "color.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 25)
  OPEN(12, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 105)

  DO
    CALL SYSTEM("clear")
    WRITE (*,100) "Police Information System"
  100 FORMAT(T30,a)
    WRITE (*,150) "Search SSN"
  150 FORMAT(T35,a,//)
 
    WRITE(*,200, ADVANCE = "NO") "Please enter the Social Security Number of your target: "
  200 FORMAT(/,T15,A)
    READ(*, "(A12)", IOSTAT = ErrorCode) SSNIn
    SELECT CASE(SSNIn(1:1))
      CASE("Q", "q", "E", "e")
        EXIT
      CASE DEFAULT
        !Check the value of the entered SSN to make sure it is valid.
        CALL checkssn(SSNIn, InvalidSSN, ErrorCode, SSNOut)
        IF(InvalidSSN) THEN
          WRITE(*, "(//,T20, A)", ADVANCE = "NO") "Invalid SSN  entered. Press enter to return: "
          READ *,
          CYCLE
        END IF
    END SELECT

    !Search for SSN number in master.db and return location of the record. 0 means DNE    
    CALL findssn(SSNOut, RecNumber)
    IF(RecNumber == 0) THEN
      WRITE(*, "(//,T20, A)", ADVANCE = "NO") "SSN not found in database. Press enter to return: "
      READ *,
      CYCLE
    END IF
    READ(12, "(A105)", REC = RecNumber) Data

    CALL displayinfo(Data)

    WRITE(*, "(/,T30,A)", ADVANCE = "NO") "Press enter to return: "
    READ*,

  END DO

  CLOSE(7); CLOSE(8); CLOSE(9); CLOSE(10); CLOSE(11);CLOSE(12)

END SUBROUTINE opt3
