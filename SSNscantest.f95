PROGRAM SSNscantest

CHARACTER :: SSN*11, first*1, second*1
INTEGER :: rc, start, middle, last

SSN = "113-i1-1111"

READ(SSN,100,IOSTAT=rc) start,first, middle,second, last
100 Format(i3,a1,i2,a1,i4)
PRINT *, start, first, middle, second, last

IF (rc/=0 .OR. (first/="-" .OR. second /="-")) THEN
  PRINT *, "Bad Input"
ELSE
  PRINT *, "Good Input"
END IF

END PROGRAM SSNscantest

