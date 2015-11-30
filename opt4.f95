SUBROUTINE opt4

!----------------------------------------------------------------------------------------
!  Hayden Martz
!  27 November 2015
!
!  Computer Based Honors Freshman Seminar
!  Section 1
!  Darren Evans-Young
!
!  Program: Ask for SSN, Search for it and then make a new record. Then Display Info
!           
!  Input: SSN. 
!  Output: Information collected from all the databases.
!---------------------------------------------------------------------------------------


  IMPLICIT NONE
  CHARACTER :: SSNIn*12, SSNOut*9, FinalSSN*11, Data*105, ZipIn*11, ZipOut*9
  INTEGER :: ErrorCode, ErrorCode2, TestSSN, I, RecNumber, NumRecord
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

  DO
    CALL SYSTEM("clear")
    WRITE (*,100) "Police Information System"
  100 FORMAT(T30,a)
    WRITE (*,150) "Add record"
  150 FORMAT(T35,a,//)
 
    WRITE(*,200, ADVANCE = "NO") "Please enter the new Social Security Number: "
  200 FORMAT(/,T15,A)
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
    CALL findssn(SSNOut, RecNumber)
    IF(RecNumber /= 0) THEN
      WRITE(*, "(//,T20, A)", ADVANCE = "NO") "SSN alread registered in database. Press enter to return: "
      READ *,
      CYCLE
    END IF
    NewEntry(1:9) = SSNOut(1:9)
    !Get Information from User
    WRITE(*, "(//,T20,a)") "Please enter the following information: "
    WRITE(*, "(T25, a, T35)", ADVANCE = "NO") "Name: ";  READ(*, "(a30)") Nombre 
    WRITE(*, "(T25, a, T35)", ADVANCE = "NO") "Street: ";  READ(*, "(a30)") Street 
    WRITE(*, "(T25, a, T35)", ADVANCE = "NO") "City: ";  READ(*, "(a29)") City
    NewEntry(10:29) = Nombre
    NewEntry(30:59) = Street
    NewEntry(60:78) = City
    DO
      WRITE(*, "(T25, a,T35)", ADVANCE = "NO") "Zip Code: ";  READ(*, "(a11)") ZipCode
      CALL checkzip(ZipCode, InvalidZip, ErrorCode, ZipOut)
     IF(InvalidZip) THEN
        WRITE(*, "(T20, A)", ADVANCE = "NO") "Invalid Zip Code entered. Press enter to retry: "
        READ *,
        CYCLE
      END IF
      EXIT
    END DO
    NewEntry(79:87) = ZipOut
    DO
      WRITE(*, "(T25, a,T35)", ADVANCE = "NO") "State: ";  READ(*, "(a18)") State
      CALL searchstate(State, NumRecord) 
      IF(NumRecord == -1) THEN
        WRITE(*, "(T20, a)", ADVANCE = "NO") "Non-Existant State. Press enter to retry; "; READ*,
        CYCLE
      END IF
      EXIT
    END DO
    WRITE(NumRec2, "(i2.2)") NumRecord
    NewEntry(88:89) = NumRec2
    DO
      WRITE(*, "(T25, a,T35)", ADVANCE = "NO") "County: ";  READ(*, "(a12)") County
      CALL searchcounty(County, NumRecord) 
      IF(NumRecord == -1) THEN
        WRITE(*, "(T20, a)", ADVANCE = "NO") "Non-Existant County. Press enter to retry; "; READ*,
        CYCLE
      END IF
      EXIT
    END DO
    WRITE(NumRec2, "(i2.2)") NumRecord
    NewEntry(90:91) = NumRec2
    DO
      WRITE(*, "(T25, a,T35)", ADVANCE = "NO") "Vehicle Type: ";  READ(*, "(a15)") Vtype
      CALL searchvtype(Vtype, NumRecord) 
      IF(NumRecord == -1) THEN
        WRITE(*, "(T20, a)", ADVANCE = "NO") "Non-Existant Vehicle Type. Press enter to retry; "; READ*,
        CYCLE
      END IF
      EXIT
    END DO
    WRITE(NumRec1, "(i1.1)") NumRecord
    NewEntry(92:92) = NumRec1
    DO
      WRITE(*, "(T25, a,T35)", ADVANCE = "NO") "Vehicle Make: ";  READ(*, "(a11)") Vmake
      CALL searchvmake(Vmake, NumRecord) 
      IF(NumRecord == -1) THEN
        WRITE(*, "(T20, a)", ADVANCE = "NO") "Non-Existant Vehicle Make. Press enter to retry; "; READ*,
        CYCLE
      END IF
      EXIT
    END DO
    WRITE(NumRec2, "(i2.2)") NumRecord
    NewEntry(95:96) = NumRec2
    DO
      WRITE(*, "(T25, a,T35)", ADVANCE = "NO") "Vehicle Color (Top): ";  READ(*, "(a25)") VColorTop
      CALL searchcolor(VColortop, NumRecord) 
      IF(NumRecord == -1) THEN
        WRITE(*, "(T20, a)", ADVANCE = "NO") "Non-Existant Vehicle Color. Press enter to retry; "; READ*,
        CYCLE
      END IF
      EXIT
    END DO
    WRITE(NumRec2, "(i2.2)") NumRecord
    NewEntry(93:94) = NumRec2
    DO
      WRITE(*, "(T25, a,T35)", ADVANCE = "NO") "Vehicle Color (Bottom): ";  READ(*, "(a25)") VColorBottom
      CALL searchcolor(VColorBottom, NumRecord) 
      IF(NumRecord == -1) THEN
        WRITE(*, "(T20, a)", ADVANCE = "NO") "Non-Existant Vehicle Type. Press enter to retry; "; READ*,
        CYCLE
      END IF
      EXIT
    END DO
    WRITE(NumRec2, "(i2.2)") NumRecord
    NewEntry(97:98) = NumRec2
    DO
      TagNumber = ""
      WRITE(*, "(T25, a, T35)", ADVANCE = "NO") "Vehicle Tag: ";  READ(*, "(a30)") TagNumber 
      IF(LEN(TRIM(TagNumber)) ==7) EXIT
      WRITE(*, "(T20, a)", ADVANCE = "NO") "Incorrect Tag. Press enter to retry; "; READ*
    END DO
    NewEntry(99:105) = TagNumber
    !After reading all information and putting it together into one big variable and write it to end of master.db
    !Increment master.db record 1, then bubblesort.
    READ(12, "(I2)", REC = 1) RecNumber
    WRITE(12, "(a105)", REC = RecNumber + 2) NewEntry
    WRITE(12, "(i2)", REC = 1) RecNumber + 1
    CALL bubblesort
    CALL displayinfo(NewEntry) 
    WRITE(*, 200, ADVANCE = "NO") "Press Enter to Continue: "
    READ*,
  END DO

CLOSE(7); CLOSE(8); CLOSE(9); CLOSE(10); CLOSE(11); CLOSE(12) 
END SUBROUTINE opt4
