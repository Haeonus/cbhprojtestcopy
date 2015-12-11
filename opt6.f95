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

   USE POLICE
   IMPLICIT NONE
   CHARACTER :: SSNIn*12, SSNOut*9, FinalSSN*11, RecordData*105, ZipIn*11, ZipOut*9, Selection*2, NewEntry*105, NumRec2*2, NumRec1*1

   INTEGER :: ErrorCode, TestSSN, I, RecNumber, NumRecord,  NewRecNumber
   LOGICAL :: InvalidSSN, InvalidZip

   OPEN(7, FILE = "state.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 24)
   OPEN(8, FILE = "county.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 12)
   OPEN(9, FILE = "vtype.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 15)
   OPEN(10, FILE = "vmake.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 11)
   OPEN(11, FILE = "color.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 25)
   OPEN(12, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 105)

   NewEntry = "" !Clears New Entry, so that data can be added in. (Blank fills)
   SSNIn = "" ! Blank fills SSNIn for input and testing.
   Selection = "s"

!Main Do Loop---------------------------------------------------------------------------------------------
   DO
      CALL SYSTEM("clear")
      WRITE (*,100) "Police Information System"
100     FORMAT(T30,a)
      WRITE (*,150) "Modify Record"
150     FORMAT(T30,a,//)
      WRITE(*,250, ADVANCE = "NO") "Please enter the new Social Security Number of the record you wish to modify, &
                                   &or type 'Q' to exit: "
250     FORMAT(/,T15,A)

      IF(SSNIn =="") READ(*, "(A12)", IOSTAT = ErrorCode) SSNIn !Reads in SSN unless a change was made.
      IF(Selection(1:1) == "S" .OR. Selection(1:1) == "s") THEN
         SELECT CASE(SSNIn(1:1))
            CASE("Q", "q", "E", "e")
               EXIT
            CASE DEFAULT
               !Check the value of the entered SSN to make sure it is valid.
               CALL checkssn(SSNIn, InvalidSSN, ErrorCode, SSNOut)
               IF(InvalidSSN) THEN
                  WRITE(*, "(//,T20, A)", ADVANCE = "NO") "Invalid SSN  entered. Press enter to return: "
                  SSNIn = ""
                  READ *,
                  CYCLE
               END IF
         END SELECT

         !Search for SSN number in master.db and return location of the record. 0 means DNE    
         CALL findssn(SSNOut, RecNumber)
         IF(RecNumber == 0) THEN
            WRITE(*, "(//,T20, A)", ADVANCE = "NO") "SSN not registered in database. Press enter to return: "
            SSNIn = ""
            READ *,
            CYCLE
         END IF
         READ(12, "(a105)", REC = RecNumber) RecordData
      END IF
      CALL displayinfo(RecordData)

      WRITE (*,"(/, T20, a)") "1 - Modify SSN        5 - Modify Zip Code        9 - Modify Vehicle Make"
200     FORMAT(T20,a)
      WRITE (*,200) "2 - Modify Name       6 - Modify State          10 - Modify Vehical Color (Top)"
      WRITE (*,200) "3 - Modify Street     7 - Modify County         11 - Modify Vehical Color (Bottom)"
      WRITE (*,200) "4 - Modify City       8 - Modify Vehicle Type   12 - Modify Tag"
      WRITE (*,300, ADVANCE="NO")"Please enter the number corresponding to your selection, type 'S' to save or 'Q' to quit: "
300     FORMAT(//,T10,a)

      READ(*, "(a2)") Selection

      CALL SYSTEM("clear")
      SELECT CASE (Selection)
         CASE("1")
            DO
               CALL SYSTEM("clear")
               WRITE (*,100) "Police Information System"
               WRITE (*,150) "Modify Record - Change SSN"
               WRITE(*,170, ADVANCE = "NO") "Please enter the new Social Security Number: "
170              FORMAT(T35,a)
500              FORMAT(/,T15,A)
               READ(*, "(A12)", IOSTAT = ErrorCode) SSNIn
               !Check the value of the entered SSN to make sure it is valid.
               CALL checkssn(SSNIn, InvalidSSN, ErrorCode, SSNOut)
               IF(InvalidSSN) THEN
                  WRITE(*, "(//,T20, A)", ADVANCE = "NO") "Invalid SSN  entered. Press enter to return: "
                  READ *,
                  CYCLE
               END IF
               EXIT
               !Search for SSN number in master.db and return location of the record. 0 means DNE    
               CALL findssn(SSNOut, NewRecNumber)
               IF(NewRecNumber /= 0) THEN
                  WRITE(*, "(//,T20, A)", ADVANCE = "NO") "SSN already registered in database. Press enter to return: "
                  READ *,
                  CYCLE
               END IF
            END DO
            RecordData(1:9) = SSNOut(1:9)
            CYCLE

         CASE("2")
            WRITE (*,100) "Police Information System"
            WRITE (*,150) "Modify Record - Change Name"
            WRITE(*,500, ADVANCE = "NO") "Please enter the new name: "
            WRITE(*, "(//, T25, a, T35)", ADVANCE = "NO") "Name: ";  READ(*, "(a20)") Nombre 
            RecordData(10:29) = Nombre
            CYCLE
  
         CASE("3")
            WRITE (*,100) "Police Information System"
            WRITE (*,150) "Modify Record - Change Street"
            WRITE(*,500, ADVANCE = "NO") "Please enter the new street: "
            WRITE(*, "(//, T25, a, T35)", ADVANCE = "NO") "Street: ";  READ(*, "(a30)") Street
            RecordData(30:59) = Street
            CYCLE
 
         CASE("4")
            WRITE (*,100) "Police Information System"
            WRITE (*,150) "Modify Record - Change City"
            WRITE(*,500, ADVANCE = "NO") "Please enter the new city: "
            WRITE(*, "(//, T25, a, T35)", ADVANCE = "NO") "City: ";  READ(*, "(a19)") City 
            RecordData(60:78) = City
            CYCLE
 
         CASE("5")
            WRITE (*,100) "Police Information System"
            WRITE (*,150) "Modify Record - Change Zip Code"
            CALL getzipcode(ZipOut)
            RecordData(79:87) = ZipOut
            CYCLE

         CASE("6")
            WRITE (*,100) "Police Information System"
            WRITE (*,150) "Modify Record - Change State"
            CALL getstatecode(NumRecord)
            WRITE(RecordData(88:89), "(i2.2)") NumRecord

         CASE("7")
            WRITE (*,100) "Police Information System"
            WRITE (*,150) "Modify Record - Change County"
            CALL getcountycode(NumRecord)
            WRITE(RecordData(90:91), "(i2.2)") NumRecord

         CASE("8")
            WRITE (*,100) "Police Information System"
            WRITE (*,150) "Modify Record - Change Vehicle Type"
            CALL getvtypecode(NumRecord)
            WRITE(RecordData(92:92), "(i1)") NumRecord

         CASE("9")
            WRITE (*,100) "Police Information System"
            WRITE (*,150) "Modify Record - Change Vehicle Make"
            CALL getvmakecode(NumRecord)
            WRITE(RecordData(95:96), "(i2.2)") NumRecord

         CASE("10")
            WRITE (*,100) "Police Information System"
            WRITE (*,150) "Modify Record - Change Vehicle Color (Top)"
            CALL getcolorcodetop(NumRecord)
            WRITE(RecordData(93:94), "(i2.2)") NumRecord

         CASE("11")
            WRITE (*,100) "Police Information System"
            WRITE (*,150) "Modify Record - Change Vehicle Color (Bottom)"
            CALL getcolorcodebottom(NumRecord)
            WRITE(RecordData(97:98), "(i2.2)") NumRecord

         CASE("12")
            WRITE (*,100) "Police Information System"
            WRITE (*,150) "Modify Record - Change Vehicle Tag"
            CALL gettagnumber(TagNumber)
            RecordData(99:105) = TagNumber

         CASE("Q", "q", "E", "e", "Qu", "qu", "ex", "Ex")
            EXIT

         CASE("S", "s", "Sa", "sa")
            WRITE(12, "(a105)", REC = RecNumber) RecordData
            IF(Selection == "1") CALL bubblesort
            WRITE (*, "(///,T35, a)", ADVANCE = "NO") "Record saved, Press enter to return to add record: "
            READ*,
            SSNIn = ""; 
            CYCLE

         CASE DEFAULT !Nothing Entered, just cycle.
            WRITE (*,100) "Police Information System"
            WRITE (*,150) "Modify Record"
            WRITE(*, "(///, T30, a)") "Incorrect input. Press enter to continue: "
            READ*, 
            CYCLE

      END SELECT      
   END DO

   CLOSE(7); CLOSE(8); CLOSE(9); CLOSE(10); CLOSE(11); CLOSE(12)

END SUBROUTINE opt6
