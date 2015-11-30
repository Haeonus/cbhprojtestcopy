SUBROUTINE displayinfo(Data)

!Subroutine that analyzes data and displays it.

  IMPLICIT NONE
  CHARACTER, INTENT(IN) :: Data*105
  CHARACTER :: SSN*11, Nombre*30, Street*30, City*29, ZipCode*10, StateCode*2, CountyCode*2, VtypeCode*1, &
               VColorTopCode*2, VmakeCode*2, VColorBottomCode*2, TagNumber*7, State*18, County*12, Vtype*15, &
               VMake*11, VColorTop*25, VColorBottom*25
  INTEGER :: SC, CC, VtC, VmC, VTCC, VBCC

  CALL SYSTEM("clear")

  SSN(1:3) = Data(1:3); SSN(4:4) = "-"; SSN(5:6) = DATA(4:5); SSN(7:7) = "-"; SSN(8:11) = Data(6:9)
  Nombre = Data(10:29)
  Street = Data(30:59)
  City = Data(60:78)
  ZipCode(1:5) = Data(79:83); ZipCode(6:6) = "-"; ZipCode(7:10) = Data(84:87)
  StateCode = Data(88:89)
  CountyCode = Data(90:91)
  VtypeCode = Data(92:92)
  VColorTopCode = Data(93:94)
  VmakeCode = Data(95:96)
  VColorBottomCode = Data(97:98)
  TagNumber = Data(99:105)

  READ(Data(88:), "(I2, I2, I1, I2, I2, I2)") SC, CC, VtC, VTCC, VmC, VBCC
  VTCC = VTCC+1; VBCC = VBCC+1; SC = SC + 1; CC = CC + 2; VtC = VtC + 1; VmC = VmC + 1

  READ(7, "(A18)", REC = SC) State
  READ(8, "(A12)", REC = CC) County
  READ(9, "(A15)", REC = VtC) Vtype
  READ(10, "(A11)", REC = VmC) Vmake
  READ(11, "(A25)", REC = VTCC) VColorTop;   READ(11, "(A25)", REC = VBCC) VColorBottom 

  WRITE (*,100) "Police Information System"
100 FORMAT(T30,a)
  WRITE (*,150) "The SSN On Record: ", SSN
150 FORMAT(T30,a,a11,//)
  WRITE(*, 200) "NAME: ", Nombre 
200 FORMAT(T20,a,T45, a)
  WRITE(*, 200) "SOCIAL SECURITY NUMBER: ", SSN
  WRITE(*, 300) "ADDRESS: ", Street
300 FORMAT(T20, a, T45, a30)
  WRITE(*,"(T45,a29)") City
  WRITE(*, 350) State(1:2), ZipCode
350 FORMAT(T45, a2, ", ", a10)
  WRITE(*, 200) "COUNTY: ", County
  WRITE(*, 250) "STATE: ", State(3:)
250 FORMAT(T20,a,T45, a, /)
  WRITE(*, 200) "TAG NUMBER: ", TagNumber
  WRITE(*, 400) Vtype, VColorTop(1:3), VColorTop(4:)
400 FORMAT(/, T20, "VEHICLE TYPE: ", a15, "    VEHICLE COLOR: TOP    - (", a3, ") ", a22)
  WRITE(*,450)  Vmake, VColorbottom(1:3), VColorBottom(4:)
450 FORMAT(T20, "VEHICLE MAKE: ", a11, T68, "BOTTOM - (", a3, ") "a22)
END SUBROUTINE displayinfo
