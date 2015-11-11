PROGRAM cbhproj

!----------------------------------------------------------------------------------------
!  Hayden Martz
!  10 November 2015
!
!  Computer Based Honors Freshman Seminar
!  Section 1
!  Darren Evans-Young
!
!  Program: Menu for project 
!           
!  Input: Numbers 1-8, each corresponding to a different option. 
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
  100 FORMAT(T30,a,//)
    WRITE (*,200) "1-Initial Database Load"
  200 FORMAT(T20,a)
    WRITE (*,200) "1 - Initial Database Load"
    WRITE (*,200) "2 - Display Auxiliary Files"
    WRITE (*, 200) "3 - Display a Record"
    WRITE (*,200) "4 - Add a Record"
    WRITE (*,200) "5 - Delete a Record"
    WRITE (*,200) "6 - Modify a Record"
    WRITE (*,200) "7 - List Master File"
    WRITE (*,200) "8 - Exit"
    WRITE (*,300)"Please enter the number corresponding to your selection."
  300 FORMAT(//,T10,a)

    !Read in (and test) the input
    READ (*,*,IOSTAT=rc) Selection
    400 FORMAT(a2) 

   CALL SYSTEM("clear")
    !Use case to run subroutine (or action) corresponding to selection
    SELECT CASE (Selection)
      CASE('1')
         CALL SYSTEM("clear"); PRINT *, "RUN OPTION 1 SUBROUTINE, press enter"; READ*, !Put in subroutine option later.
      CASE('2')
         CALL SYSTEM("clear"); PRINT *, "RUN OPTION 2 SUBROUTINE, press enter"; READ*, !Put in subroutine option later.
      CASE('3')
         CALL SYSTEM("clear"); PRINT *, "RUN OPTION 3 SUBROUTINE, press enter"; READ*, !Put in subroutine option later.
      CASE('4')
         CALL SYSTEM("clear"); PRINT *, "RUN OPTION 4 SUBROUTINE, press enter"; READ*, !Put in subroutine option later.
      CASE('5')
         CALL SYSTEM("clear"); PRINT *, "RUN OPTION 5 SUBROUTINE, press enter"; READ*, !Put in subroutine option later.
      CASE('6')
         CALL SYSTEM("clear"); PRINT *, "RUN OPTION 6 SUBROUTINE, press enter"; READ*, !Put in subroutine option later.
      CASE('7')
         CALL SYSTEM("clear"); PRINT *, "RUN OPTION 7 SUBROUTINE, press enter"; READ*, !Put in subroutine option later.
      CASE('Q','q','E','e','8')
         CALL SYSTEM("clear"); PRINT *, "Quitting..."
        EXIT
      CASE DEFAULT
        PRINT *, "Please select one of the above options. Press enter to continue."
        READ *,
    END SELECT 
  END DO

END PROGRAM cbhproj
