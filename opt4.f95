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
   INTEGER :: ErrorCode, ErrorCode2, TestSSN, I, RecNumber, NumRecord, NumRecord2
   LOGICAL :: InvalidSSN, InvalidZip
   CHARACTER :: SSN*11, Nombre*20, Street*30, City*19, ZipCode*11, StateCode*2, CountyCode*2, VtypeCode*1, &
                VColorTopCode*2, VmakeCode*2, VColorBottomCode*2, TagNumber*8, State*18, County*12, Vtype*15, &
                VMake*11, VColorTop*25, VColorBottom*25, NewEntry*105, NumRec2*2, NumRec1*1

   OPEN(7, FILE = "state.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 18)
   OPEN(8, FILE = "county.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 12)
   OPEN(9, FILE = "vtype.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 15)
   OPEN(10, FILE = "vmake.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 11)
   OPEN(11, FILE = "color.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 25)
   OPEN(12, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 105)

   NewEntry = ""

   !Beginning of main loop (Searching for SSN's)
   DO
      CALL SYSTEM("clear")

      !Print Heading
      WRITE (*,100) "Police Information System"
100     FORMAT(T30,a)
      WRITE (*,150) "Add Record"
150     FORMAT(T35,a,//)
      WRITE(*,200, ADVANCE = "NO") "Please enter the new Social Security Number or type 'Q' to exit: "
200     FORMAT(/,T15,A)

      !Read in information and exit if desired.
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
         WRITE(*, "(//,T20, A)", ADVANCE = "NO") "SSN already registered in database. Press enter to return: "
         READ *,
         CYCLE
      END IF
 
      !Assine data recieved from user to NewEntry field.
      NewEntry(1:9) = SSNOut(1:9)
 
      WRITE(*, "(//,T20,a)") "Please enter the following information: "

      WRITE(*, "(T25, a, T35)", ADVANCE = "NO") "Name: ";  READ(*, "(a20)") Nombre
      NewEntry(10:29) = Nombre
      WRITE(*, "(T25, a, T35)", ADVANCE = "NO") "Street: ";  READ(*, "(a30)") Street 
      NewEntry(30:59) = Street
      WRITE(*, "(T25, a, T35)", ADVANCE = "NO") "City: ";  READ(*, "(a19)") City
      NewEntry(60:78) = City
      
      CALL getzipcode(ZipOut)
      NewEntry(79:87) = ZipOut
  
      CALL getstatecode(NumRecord)
      WRITE(NewEntry(88:89), "(i2.2)") NumRecord
PRINT*, "state", NumRecord

      CALL getcountycode(NumRecord)
      WRITE(NewEntry(90:91), "(i2.2)") NumRecord
PRINT*, "county", NumRecord

      CALL getvtypecode(NumRecord)
      WRITE(NewEntry(92:92), "(i1.1)") NumRecord
PRINT*, "vtype", NumRecord

      CALL getvmakecode(NumRecord)
      WRITE(NewEntry(95:96), "(i2.2)") NumRecord
PRINT*, "vmake", NumRecord

      CALL getcolorcodes(NumRecord)
      WRITE(NewEntry(93:94), "(i2.2)") NumRecord
PRINT*, "color", NumRecord

      CALL getcolorcodes(NumRecord)
      WRITE(NewEntry(97:98), "(i2.2)") NumRecord
 PRINT*, "colorbottom", NumRecord
     
      CALL gettagnumber(TagNumber)
      NewEntry(99:105) = TagNumber
PRINT*, "state", NumRecord

      !After reading and assembling all information,  write it to end of master.db, Increment length then bubblesort.
      READ(12, "(I2)", REC = 1) RecNumber
      WRITE(12, "(a105)", REC = RecNumber + 2) NewEntry
      WRITE(12, "(i2)", REC = 1) RecNumber + 1
      CALL bubblesort
PRINT*, NewEntry
      CALL displayinfo(NewEntry) 
      WRITE(*, 200, ADVANCE = "NO") "Press Enter to Continue: "
      READ*, 
   END DO

   CLOSE(7); CLOSE(8); CLOSE(9); CLOSE(10); CLOSE(11); CLOSE(12) 

END SUBROUTINE opt4
