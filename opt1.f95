SUBROUTINE opt1
  CALL SYSTEM("clear")
  PRINT *, "RUN OPTION 1 SUBROUTINE"

  CALL ldcolor
  CALL ldvmake
  CALL ldvtype
  CALL ldcounty
  CALL ldstate
  CALL ldpolice1
  CALL ldpolice2

  WRITE (*,'(a)', ADVANCE='NO') "Press Enter to Continue: "
  READ*, !Put in subroutine option later.

END SUBROUTINE opt1
