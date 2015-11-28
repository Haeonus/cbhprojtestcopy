SUBROUTINE displayinfo(Data)

!Subroutine that analyzes data and displays it.

  IMPLICIT NONE
  CHARACTER, INTENT(IN) :: Data*105
  CHARACTER :: SSN*11, Nombre*30, Street*30, City*29, ZipCode*10, StateCode*2, CountyCode*2, VtypeCode*1, &
               VColorTopCode*2, VmakeCode*2, VColorBottomCode*2 TagNumber*7

  SSN(1:3) = Data(1:3); SSN(4:4) = "-"; SSN(5:6) = DATA(4:5); SSN(7:7) = "-"; SSN(8:11) = Data(6:9)
  Nombre = Data(10-29)
  Street = Data(30-59)
  City = Data(60-78)
  ZipCode(1:5) = Data(79:83); ZipCod(6:6) = "-"; ZipCode(6:10) = Data(84:87)
  StateCode = Data(88:89)
  CountyCode = Data(90-91)
  VtypeCode = Data(92)
  VColorTopCode = Data(93:94)
  VmakeCode = Data(95-96)
  VColorBottomCode = Data(97:98)
  TagNumber = Data(99:105)


