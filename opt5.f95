SUBROUTINE opt5

!----------------------------------------------------------------------------------------
!  Hayden Martz
!  29 November 2015
!
!  Computer Based Honors Freshman Seminar
!  Section 1
!  Darren Evans-Young
!
!  Program: Ask for SSN, Search for it and then make a delete record. Then Display Info
!           
!  Input: SSN. 
!  Output: Deleted SSN
!---------------------------------------------------------------------------------------

   IMPLICIT NONE
   CHARACTER :: SSNIn*12, SSNOut*9, DelRecord*105, Confirmation*3, FinRecord*105
   INTEGER :: ErrorCode, I, RecNumber, NumRecord
   LOGICAL :: InvalidSSN


   OPEN(7, FILE = "state.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 24)
   OPEN(8, FILE = "county.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 12)
   OPEN(9, FILE = "vtype.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 15)
   OPEN(10, FILE = "vmake.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 11)
   OPEN(11, FILE = "color.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 25)
   OPEN(12, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 105)

   DO
      CALL SYSTEM("clear")
      WRITE (*,100) "Police Information System"
100     FORMAT(T30,a)
      WRITE (*,150) "Delete Record"
150     FORMAT(T35,a,//)
 
      WRITE(*,200, ADVANCE = "NO") "Please enter the Social Security Number you wish to delete or type 'Q' to exit: "
200     FORMAT(/,T15,A)
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
      IF(RecNumber == 0) THEN
         WRITE(*, "(//,T20, A)", ADVANCE = "NO") "SSN not registered in database. Press enter to return: "
         READ *,
         CYCLE
      END IF

      READ(12, "(a105)", REC = RecNumber) DelRecord
      CALL displayinfo(DelRecord)
      WRITE(*, "(/,T15,A)", ADVANCE = "NO") "Are you sure you wish to delete this file? Y/N "
      READ (*, "(a3)") Confirmation
      SELECT CASE(Confirmation)
         CASE("Y", "y", "Ye", "ye", "Yes", "yes")
            !Replace file with last record, then decrement record one and sort (will delete largest file)
            READ(12, "(i2)", REC = 1) NumRecord
            READ(12, "(a105)", REC = NumRecord) FinRecord
            WRITE(12, "(a105)", REC = RecNumber) FinRecord
            CALL bubblesort
            WRITE(12, "(i2)", REC = 1) NumRecord - 1
            CALL SYSTEM("clear")
            WRITE (*,100) "Police Information System"
            WRITE (*,150) "Delete Record"
            WRITE(*, 300, ADVANCE = "NO") "Record ", DelRecord(1:3), "-", DelRecord(4:5), "-", DelRecord(6:11),&
                                          " has been deleted. Press Enter to continue."
300           FORMAT(///, T20, a, a3, a1, a2, a1, a4, a)
           READ*, 
         CASE DEFAULT
            CALL SYSTEM("clear")
            WRITE (*,100) "Police Information System"
            WRITE (*,150) "Delete Record"
            WRITE(*, 300, ADVANCE = "NO") "Record ", DelRecord(1:3), "-", DelRecord(4:5), "-", DelRecord(6:11),&
                                          " has not been deleted. Press Enter to continue."
            READ*,
            CYCLE
      END SELECT
   END DO

   CLOSE(7); CLOSE(8); CLOSE(9); CLOSE(10); CLOSE(11); CLOSE(12)
 
END SUBROUTINE opt5
