SUBROUTINE opt1
  CALL SYSTEM("clear")
  WRITE (*,100) "Police Information System","Initial Data Load"    
100 FORMAT(T30,a,/,T34,a)

  WRITE(*,200,ADVANCE="NO") "Color Data Loaded: "; CALL ldcolor
200 FORMAT(/,T18,a)
  WRITE(*,300,ADVANCE="NO") "Vehicle Make Data Loaded: "; CALL ldvmake
300 FORMAT(T18,a)
  WRITE(*,300,ADVANCE="NO") "Vehicle Type Data Loaded: "; CALL ldvtype
  WRITE(*,300,ADVANCE="NO") "County Data Loaded: "; CALL ldcounty
  WRITE(*,300,ADVANCE="NO") "State Data Loaded: "; CALL ldstate
  WRITE(*,300,ADVANCE="NO") "Police 1 Data Loaded: "; CALL ldpolice1
  WRITE(*,300,ADVANCE="NO") "Police 2 Data Loaded: "; CALL ldpolice2

  WRITE (*,"(/,T12,a)", ADVANCE="NO") "Press Enter to Continue: "
  READ*, !Put in subroutine option later.

END SUBROUTINE opt1
