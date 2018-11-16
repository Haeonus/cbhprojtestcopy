#
# Makefile
#

CC = f95 
CFLAGS = -fPIC 
OBJ = cbhproj.o opt1.o opt2.o opt3.o opt4.o opt5.o opt6.o opt7.o ldcolor.o ldcounty.o \
       ldmaster.o ldstate.o ldvmake.o ldvtype.o displaycolor.o displayvtype.o \
       displayvmake.o displaycounty.o displaystate.o bubblesort.o checkssn.o findssn.o\
       searchssn.o displayinfo.o checkzip.o searchstate.o searchcounty.o searchvtype.o\
       searchcolor.o searchvmake.o getzipcode.o getstatecode.o getcountycode.o getvtypecode.o\
       getvmakecode.o getcolorcodetop.o gettagnumber.o getcolorcodebottom.o displayrecords.o

cbhproj: police.o $(OBJ)
	$(CC) $(CFLAGS) -o cbhproj police.o $(OBJ)
police.o: police.f95
	$(CC) $(CFLAGS) -c police.f95
cbhproj.o: cbhproj.f95
	$(CC) $(CFLAGS) -c cbhproj.f95
opt1.o: opt1.f95
	$(CC) $(CFLAGS) -c opt1.f95
opt2.o: opt2.f95
	$(CC) $(CFLAGS) -c opt2.f95
opt3.o: opt3.f95
	$(CC) $(CFLAGS) -c opt3.f95
opt4.o: opt4.f95
	$(CC) $(CFLAGS) -c opt4.f95
opt5.o: opt5.f95
	$(CC) $(CFLAGS) -c opt5.f95
opt6.o: opt6.f95
	$(CC) $(CFLAGS) -c opt6.f95
opt7.o: opt7.f95
	$(CC) $(CFLAGS) -c opt7.f95
ldcolor.o: ldcolor.f95
	$(CC) $(CFLAGS) -c ldcolor.f95
ldcounty.o: ldcounty.f95
	$(CC) $(CFLAGS) -c ldcounty.f95
ldmaster.o: ldmaster.f95
	$(CC) $(CFLAGS) -c ldmaster.f95
ldstate.o: ldstate.f95
	$(CC) $(CFLAGS) -c ldstate.f95
ldvmake.o: ldvtype.f95
	$(CC) $(CFLAGS) -c ldvmake.f95
ldvtype.o: ldvtype.f95
	$(CC) $(CFLAGS) -c ldvtype.f95
displaycolor.o: displaycolor.f95
	$(CC) $(CFLAGS) -c displaycolor.f95
displayvtype.o: displayvtype.f95
	$(CC) $(CFLAGS) -c displayvtype.f95
displayvmake.o: displayvmake.f95
	$(CC) $(CFLAGS) -c displayvmake.f95
displaycounty.o: displaycounty.f95
	$(CC) $(CFLAGS) -c displaycounty.f95
displaystate.o: displaystate.f95
	$(CC) $(CFLAGS) -c displaystate.f95
bubblesort.o: bubblesort.f95
	$(CC) $(CFLAGS) -c bubblesort.f95
checkssn.o: checkssn.f95
	$(CC) $(CFLAGS) -c checkssn.f95
findssn.o: findssn.f95
	$(CC) $(CFLAGS) -c findssn.f95
searchssn.o: searchssn.f95
	$(CC) $(CFLAGS) -c searchssn.f95
displayinfo.o: displayinfo.f95
	$(CC) $(CFLAGS) -c displayinfo.f95
checkzip.o: checkzip.f95
	$(CC) $(CFLAGS) -c checkzip.f95
searchstate.o: searchstate.f95
	$(CC) $(CFLAGS) -c searchstate.f95
searchcounty.o: searchcounty.f95
	$(CC) $(CFLAGS) -c searchcounty.f95
searchvtype.o: searchvtype.f95
	$(CC) $(CFLAGS) -c searchvtype.f95
searchcolor.o: searchcolor.f95
	$(CC) $(CFLAGS) -c searchcolor.f95
searchvmake.o: searchvmake.f95
	$(CC) $(CFLAGS) -c searchvmake.f95
getzipcode.o: getzipcode.f95
	$(CC) $(CFLAGS) -c getzipcode.f95
getstatecode.o: getstatecode.f95
	$(CC) $(CFLAGS) -c getstatecode.f95
getcountycode.o: getcountycode.f95
	$(CC) $(CFLAGS) -c getcountycode.f95
getvtypecode.o: getvtypecode.f95
	$(CC) $(CFLAGS) -c getvtypecode.f95
getvmakecode.o: getvmakecode.f95
	$(CC) $(CFLAGS) -c getvmakecode.f95
getcolorcodetop.o: getcolorcodetop.f95
	$(CC) $(CFLAGS) -c getcolorcodetop.f95
getcolorcodebottom.o: getcolorcodebottom.f95
	$(CC) $(CFLAGS) -c getcolorcodebottom.f95
gettagnumber.o: gettagnumber.f95
	$(CC) $(CFLAGS) -c gettagnumber.f95
displayrecords.o: displayrecords.f95
	$(CC) $(CFLAGS) -c displayrecords.f95

clean:
	rm cbhproj *.o *.db core
