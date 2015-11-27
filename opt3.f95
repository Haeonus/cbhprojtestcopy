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
  CHARACTER :: SSNIn*12, SSNOut*9
  INTEGER :: ErrorCode, ErrorCode2, TestSSN, I
  LOGICAL :: InvalidSSN

  DO
    CALL SYSTEM("clear")


    WRITE(*,100, ADVANCE = "NO") "Please enter the Social Security Number of your target: "
  100 FORMAT(///,T25,A)i
    READ(*, "(A12)", IOSTAT = ErrorCode) SSNIn
    SELECT CASE(SSNIn(1:1)
      CASE("Q", "q", "E", "e")
        EXIT
      CASE DEFAULT
        !Check the value of the entered SSN to make sure it is valid.
        CALL checkssn(SSNIn, InvalidSSN, ErrorCode)
       
        IF(InvalidSSN) THEN
          WRITE(*, "(//,T30, A)", ADVANCE = "NO") "Invalid code entered. Press enter to retry: "
          READ *,
          CYCLE
        END IF
    END SELECT CASE
    !Search for SSN number in master.db and return location of the record.


  END DO

END SUBROUTINE opt3
