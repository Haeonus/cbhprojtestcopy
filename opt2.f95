SUBROUTINE opt2

!----------------------------------------------------------------------------------------
!  Hayden Martz
!  18 November 2015
!
!  Computer Based Honors Freshman Seminar
!  Section 1
!  Darren Evans-Young
!
!  Program: Menu for Option 2 
!           
!  Input: Numbers 1-6, each corresponding to a different option. 
!  Output: N/A, Execute one of the options
!---------------------------------------------------------------------------------------

  IMPLICIT NONE
  !Declare Variables
  CHARACTER :: Selection*2
  INTEGER :: rc  

  !Do loop, want to repetitively run different options
  DO
    CALL SYSTEM("clear") !Clear the screen
    
    !Print the different options
    WRITE (*,100) "Police Information System"
  100 FORMAT(T30,a)
    WRITE (*,150) "Auxiliary Files"
  150 FORMAT(T35,a,//)
  200 FORMAT(T20,a)
    WRITE (*,200) "1 - Display State Data"
    WRITE (*,200) "2 - Display County Data"
    WRITE (*,200) "3 - Display Vehicle Makes"
    WRITE (*,200) "4 - Display Vehicle Types"
    WRITE (*,200) "5 - Display Vehicle Colors"
    WRITE (*,200) "6 - Return To Main Menu"
    WRITE (*,300, ADVANCE="NO")"Please enter the number corresponding to your selection: "
  300 FORMAT(//,T10,a)

    !Read in (and test) the input
    READ (*,*) Selection
    400 FORMAT(a2) 

   CALL SYSTEM("clear")
    WRITE (*,100) "Police Information System"
    WRITE (*,110, ADVANCE = "NO") "Auxiliary Files: "
  110 FORMAT(T30,a)
    !Use case to run subroutine (or action) corresponding to selection
  120 FORMAT (A,/)
    SELECT CASE (Selection)
      CASE('1')
        WRITE (*,120) "State Data"
        CALL displaystate
      CASE('2')
        WRITE(*,120) "County Data"
        CALL displaycounty
      CASE('3')
        WRITE (*,120) "Vehicle Makes"
        CALL displayvmake
      CASE('4')
        WRITE(*,120) "Vehicle Types"
        CALL displayvtype
      CASE('5')
        WRITE (*,120) "Vehicle Colors"
        CALL displaycolor
      CASE('Q','q','E','e','6')
        EXIT
      CASE DEFAULT
        WRITE(*,500, ADVANCE="NO") "Please select one of the options. Press enter to continue."
      500 FORMAT(//////,T25,a)
    END SELECT 
    WRITE(*,300, ADVANCE = "NO" ) "Please press enter to continue: "
    READ *,
  END DO

END SUBROUTINE opt2
