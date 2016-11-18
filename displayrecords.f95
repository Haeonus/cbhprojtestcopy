SUBROUTINE displayrecords(Data)

!Subroutine that analyzes data and displays it.

   USE POLICE
   IMPLICIT NONE
   CHARACTER, INTENT(IN) :: Data*105
   INTEGER :: SC, CC, VtC, VmC, VTCC, VBCC


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

   !Get the content using the codes from the various database files.
   READ(7, "(A24)", REC = SC) State
   READ(8, "(A12)", REC = CC) County
   READ(9, "(A15)", REC = VtC) Vtype
   READ(10, "(A11)", REC = VmC) Vmake
   READ(11, "(A25)", REC = VTCC) VColorTop;   READ(11, "(A25)", REC = VBCC) VColorBottom 

   WRITE(*, 200)  SSN, Nombre, Street, City, State(1:2), ZipCode, TagNumber 
200  FORMAT(T10, a11, 2x, a20, 2x, a30, 2x, a12, 2x, a2, 2x,a10, T125, A7)
   WRITE(*, 300, ADVANCE = "NO")  "[",CountyCode, "] ", County, "[",StateCode, "] ", State(3:24), "[", VtypeCode, "] ", Vtype
300  FORMAT(T23, a1, a2, a2, a12, 3x, a1, a2, a2, a22, 3x, a1, "0", a1, a2, a15, T100, a1, a2)
  WRITE(*, 350)  "[", Vmakecode,"] ", Vmake, "[", VColorTopCode, "] ", VColorTop(1:3),VColorTop(4:), "[", VColorBottomcode, "] ",&
                  VColorBottom(1:3), VColorBottom(4:)
350  FORMAT(3x, a1, a2, a2, a11, 3x, a1, a2, a2,"(", a3,") ", a22, 3x, a1, a2, a2,"(", a3,") ",a22,/)

END SUBROUTINE displayrecords
