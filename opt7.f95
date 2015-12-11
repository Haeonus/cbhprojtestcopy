SUBROUTINE opt7

! Prints out 7 records at a time from master.db. Pressing enter displays the next 25. 

   IMPLICIT NONE
   INTEGER :: Lengthdb, I
   CHARACTER :: Recorded*105, Line*107

   Line = "=========================================================================================================="

   OPEN(7, FILE = "state.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 24)
   OPEN(8, FILE = "county.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 12)
   OPEN(9, FILE = "vtype.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 15)
   OPEN(10, FILE = "vmake.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 11)
   OPEN(11, FILE = "color.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 25)
   OPEN(12, FILE = "master.db", FORM = "FORMATTED", ACCESS = "DIRECT", RECL = 105)


   WRITE (*,100) "Police Information System"
100  FORMAT(T30,a)
   WRITE (*,150) "Listing Master Database"
150  FORMAT(T31,a,//)
   WRITE (*, 200) "SSN", "Name", "Street Address (Street,", " City,", "State Abbr., Zip)"
200  FORMAT(T10, a, T23, a, T35, a, T77, a, T90, a) 
   WRITE(*, 250) "County", "State (Full)", "Vehicle Type", "Vehicle Make", "Color (Top)", "Color (Bottom)"
250  FORMAT(T23, a, T43, a, T73, a, T93, a, T112, a, T151,a)
   WRITE(*,"(T30, a, /)") Line 
   READ(12, "(I2)", REC = 1) Lengthdb

   DO I=2, Lengthdb+1
      READ(12, "(a105)", REC = I) Recorded
       CALL displayrecords(Recorded)
      IF(MOD((I-1),7) == 0) THEN
         WRITE(*, "(/,T25, a)") "NOTE: Terminal must be at least 174 columns wide for proper formatting."
         WRITE(*, "(T30, a)", ADVANCE = "NO") "Press Enter to view the next seven records: "
         READ*,
         CALL SYSTEM("clear")
         WRITE(*, 100) "Police Information System"
         WRITE(*, 150) "Listing Master Database"
         WRITE (*, 200) "SSN", "Name", "Street Address (Street,", " City,", "State Abbr., Zip)"
         WRITE(*, 250) "County", "State (Full)", "Vehicle Type", "Vehicle Make", "Color (Top)", "Color (Bottom)"
         WRITE(*,"(T30, a, /)") Line
      END IF
   END DO

   WRITE(*, "(T25, a)", ADVANCE = "NO") "Press enter to return to main menu: " 
   READ*,

  CLOSE(7); CLOSE(8); CLOSE(9); CLOSE(10); CLOSE(11); CLOSE(12); 

END SUBROUTINE opt7
