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
   CHARACTER :: Selection*2
   INTEGER :: rc  

   !Do loop, want to repetitively run different options
   DO
      CALL SYSTEM("clear")
    
      !Print the different options
      WRITE (*,100) "Police Information System"
100     FORMAT(T30,a,//)
200     FORMAT(T20,a)
      WRITE (*,200) "1 - Initial Database Load"
      WRITE (*,200) "2 - Display Auxiliary Files"
      WRITE (*,200) "3 - Display a Record"
      WRITE (*,200) "4 - Add a Record"
      WRITE (*,200) "5 - Delete a Record"
      WRITE (*,200) "6 - Modify a Record"
      WRITE (*,200) "7 - List Master File"
      WRITE (*,200) "8 - Exit"
      WRITE (*,300, ADVANCE="NO")"Please enter the number corresponding to your selection: "
300     FORMAT(//,T10,a)

      READ (*,*) Selection
400     FORMAT(a2) 

      CALL SYSTEM("clear")
      !Use case to run subroutine (or action) corresponding to selection
      SELECT CASE (Selection)
         CASE('1')
!            CALL opt1
         CASE('2')
            CALL opt2
         CASE('3')
            CALL opt3
         CASE('4')
            CALL opt4
         CASE('5')
            CALL opt5
         CASE('6')
            CALL opt6
         CASE('7')
            CALL opt7
         CASE('Q','q','E','e','Qu', 'qu', 'Ex', 'ex', '8')
            CALL SYSTEM("clear"); PRINT *, "Quitting..."
            EXIT
         CASE DEFAULT
            WRITE(*,500, ADVANCE="NO") "Please select one of the options. Press enter to continue."
500           FORMAT(//////,T25,a)
            READ *,
         END SELECT 
   
   END DO

END PROGRAM cbhproj
