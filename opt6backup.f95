SUBROUTINE opt6
!----------------------------------------------------------------------------------------
!  Hayden Martz
!  29 November 2015
!
!  Computer Based Honors Freshman Seminar
!  Section 1
!  Darren Evans-Young
!
!  Program: Ask for SSN, Search for it and then modify if record exists.
!           
!  Input: SSN. 
!  Output: Information collected from all the databases.
!---------------------------------------------------------------------------------------


  IMPLICIT NONE
  CHARACTER :: SSNIn*12, SSNOut*9, FinalSSN*11, RecordData*105, ZipIn*11, ZipOut*9
  INTEGER :: ErrorCode, TestSSN, I, RecNumber, NumRecord, Selection, NewRecNumber
  LOGICAL :: InvalidSSN, InvalidZip
  CHARACTER :: SSN*11, Nombre*30, Street*30, City*29, ZipCode*11, StateCode*2, CountyCode*2, VtypeCode*1, &
               VColorTopCode*2, VmakeCode*2, VColorBottomCode*2, TagNumber*7, State*18, County*12, Vtype*15, &
               VMake*11, VColorTop*25, VColorBottom*25, NewEntry*105, NumRec2*2, NumRec1*1

  OPEN(7, FILE = "state.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 18)
  OPEN(8, FILE = "county.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 12)
  OPEN(9, FILE = "vtype.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 15)
  OPEN(10, FILE = "vmake.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 11)
  OPEN(11, FILE = "color.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 25)
  OPEN(12, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 105)

  NewEntry = ""
  SSNIn = ""
  DO
    CALL SYSTEM("clear")
    WRITE (*,100) "Police Information System"
  100 FORMAT(T30,a)
    WRITE (*,150) "Modify Record"
  150 FORMAT(T35,a,//)
 
    WRITE(*,250, ADVANCE = "NO") "Please enter the new Social Security Number of the record you wish to modify: "
  250 FORMAT(/,T15,A)

    IF(SSNIn =="") READ(*, "(A12)", IOSTAT = ErrorCode) SSNIn

    SELECT CASE(SSNIn(1:1))
      CASE("Q", "q", "E", "e")
        EXIT
      CASE DEFAULT
        !Check the value of the entered SSN to make sure it is valid.
        CALL checkssn(SSNIn, InvalidSSN, ErrorCode, SSNOut)
        IF(InvalidSSN) THEN
          WRITE(*, "(//,T20, A)", ADVANCE = "NO") "Invalid SSN  entered. Press enter to return: "
          READ *,
          CYCLE
    END IF
    END SELECT

    !Search for SSN number in master.db and return location of the record. 0 means DNE    
    CALL findssn(SSNOut, RecNumber)
    IF(RecNumber == 0) THEN
      WRITE(*, "(//,T20, A)", ADVANCE = "NO") "SSN not registered in database. Press enter to return: "
      READ *,
      CYCLE
    END IF

    READ(12, "(a105)", REC = RecNumber) RecordData
    CALL displayinfo(RecordData)

   200 FORMAT(T20,a)
    WRITE (*,"(/, T20, a)") "1 - Modify SSN        5 - Modify Zip Code        9 - Modify Vehicle Make"
    WRITE (*,200) "2 - Modify Name       6 - Modify State          10 - Modify Vehical Color (Top)"
    WRITE (*,200) "3 - Modify Street     7 - Modify County         11 - Modify Vehical Color (Bottom)"
    WRITE (*,200) "4 - Modify City       8 - Modify Vehicle Type   12 - Modify Tag"
    WRITE (*,300, ADVANCE="NO")"Please enter the number corresponding to your selection: "
  300 FORMAT(//,T10,a)

    READ(*, "(i2)") Selection



    SELECT CASE (Selection)
      CASE(1)
        CALL SYSTEM("clear")
        WRITE (*,100) "Police Information System"
        WRITE (*,150) "Modify Record - Change SSN"
        WRITE(*,500, ADVANCE = "NO") "Please enter the new Social Security Number: "
      500 FORMAT(/,T15,A)
        READ(*, "(A12)", IOSTAT = ErrorCode) SSNIn
        SELECT CASE(SSNIn(1:1))
          CASE("Q", "q", "E", "e")
            EXIT
          CASE DEFAULT
            !Check the value of the entered SSN to make sure it is valid.
            CALL checkssn(SSNIn, InvalidSSN, ErrorCode, SSNOut)
            IF(InvalidSSN) THEN
              WRITE(*, "(//,T20, A)", ADVANCE = "NO") "Invalid SSN  entered. Press enter to return: "
              READ *,
              CYCLE
            END IF
          END SELECT
          
        !Search for SSN number in master.db and return location of the record. 0 means DNE    
        CALL findssn(SSNOut, NewRecNumber)
PRINT*,"New Rec Number",  NewRecNumber
        IF(NewRecNumber /= 0) THEN
          WRITE(*, "(//,T20, A)", ADVANCE = "NO") "SSN already registered in database. Press enter to return: "
PRINT*, "Before READ"
          READ *,
PRINT*, "Before Cycle"
          CYCLE
        END IF
        RecordData(1:9) = SSNOut(1:9)
PRINT*, "Rec Number", RecNumber
        WRITE(12, "(a105)", REC = RecNumber) RecordData
        CALL bubblesort
        CYCLE
      CASE(2)
         WRITE (*,100) "Police Information System"
         WRITE (*,150) "Modify Record - Change SSN"
         WRITE(*,500, ADVANCE = "NO") "Please enter the new name: "
         WRITE(*, "(//, T25, a, T35)", ADVANCE = "NO") "Name: ";  READ(*, "(a30)") Nombre 
                 
      CASE(3)

      CASE(4)

      CASE(5)

      CASE(6)

      CASE(7)

      CASE(8)

      CASE(9)

      CASE(10)

      CASE(11)

      CASE(12)

    END SELECT

  END DO
END SUBROUTINE opt6
