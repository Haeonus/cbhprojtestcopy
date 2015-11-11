PROGRAM menupractice

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
  INTEGER :: Selection, rc  

  !Do loop, want to repetitively run different options
  DO
    CALL SYSTEM("clear") !Clear the screen
    
    !Print the different options
    PRINT *, "Please choose one of the following options:"
    PRINT *, 
    PRINT *, "    1 - Initial Database Load"
    PRINT *, "    2 - Display Auxiliary Files"
    PRINT *, "    3 - Display a Record"
    PRINT *, "    4 - Add a Record"
    PRINT *, "    5 - Delete a Record"
    PRINT *, "    6 - Modify a Record"
    PRINT *, "    7 - List Master File"
    PRINT *, "    8 - Exit"
    PRINT *,
    PRINT *, "Please enter the number corresponding to your selection."

    !Read in (and test) the input
    READ (*,*, IOSTAT = rc) Selection
    IF (rc/=0) THEN
      PRINT *, "That is not a valid input. Press enter to continue."
      READ *,
      CYCLE
    END IF

    !Use case to run subroutine (or action) corresponding to selection
    SELECT CASE (Selection)
      CASE(1)
         CALL SYSTEM("clear"); PRINT *, "RUN OPTION 1 SUBROUTINE, press enter"; READ*, !Put in subroutine option later.
      CASE(2)
         CALL SYSTEM("clear"); PRINT *, "RUN OPTION 2 SUBROUTINE, press enter"; READ*, !Put in subroutine option later.
      CASE(3)
         CALL SYSTEM("clear"); PRINT *, "RUN OPTION 3 SUBROUTINE, press enter"; READ*, !Put in subroutine option later.
      CASE(4)
         CALL SYSTEM("clear"); PRINT *, "RUN OPTION 4 SUBROUTINE, press enter"; READ*, !Put in subroutine option later.
      CASE(5)
         CALL SYSTEM("clear"); PRINT *, "RUN OPTION 5 SUBROUTINE, press enter"; READ*, !Put in subroutine option later.
      CASE(6)
         CALL SYSTEM("clear"); PRINT *, "RUN OPTION 6 SUBROUTINE, press enter"; READ*, !Put in subroutine option later.
      CASE(7)
         CALL SYSTEM("clear"); PRINT *, "RUN OPTION 7 SUBROUTINE, press enter"; READ*, !Put in subroutine option later.
      CASE(8)
         CALL SYSTEM("clear"); PRINT *, "Quitting..."
        EXIT
      CASE DEFAULT
        PRINT *, "Please select one of the above options. Press enter to continue."
        READ *,
    END SELECT
    
    CALL SYSTEM("LS -A")
  END DO

END PROGRAM menupractice
