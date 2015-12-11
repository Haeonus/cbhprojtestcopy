SUBROUTINE opt1

!Subroutine one loads the various databases and displays the number of good and bad records for each

   IMPLICIT NONE

   CALL SYSTEM("clear")
   WRITE (*,100) "Police Information System","Initial Data Load"    
100  FORMAT(T30,a,/,T34,a)
   WRITE(*,200,ADVANCE="NO") "Color Data Loaded: "; CALL ldcolor
200  FORMAT(/,T18,a)
   WRITE(*,300,ADVANCE="NO") "Vehicle Make Data Loaded: "; CALL ldvmake
300  FORMAT(T18,a)
   WRITE(*,300,ADVANCE="NO") "Vehicle Type Data Loaded: "; CALL ldvtype
   WRITE(*,300,ADVANCE="NO") "County Data Loaded: "; CALL ldcounty
   WRITE(*,300,ADVANCE="NO") "State Data Loaded: "; CALL ldstate
   WRITE(*,300, ADVANCE = "NO") "Loaded Master Database"; CALL ldmaster

   WRITE (*,"(/,T12,a)", ADVANCE="NO") "Press Enter to Continue: "
   READ*,

END SUBROUTINE opt1
