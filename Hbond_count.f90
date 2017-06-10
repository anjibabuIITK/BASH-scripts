PROGRAM hbond
IMPLICIT NONE
CHARACTER (len=20)::filename
REAL :: x,hpercent,hprob,hcut
!REAL,PARAMETER :: hcut      !=2.8 for HBONDS , for C_N in COO--NLYS 2.8+1.0+1.0
INTEGER::i,k,N,hcount=0,ios       !N = no of data points
!
WRITE(*,*)"Enter File Name :"
READ(*,*)filename
print*, "Given file name : ",filename
PRINT*,
OPEN(12,file=TRIM(filename),STATUS="OLD",IOSTAT=ios)
call get_steps(12,N)
print*,"N=",N
!OPEN(18,file="O5_LYS170N_his.dat",STATUS="NEW")
!WRITE(*,*) "Enter No of Data Points : "
!READ(*,*)N
WRITE(*,*) "Enter Hbond cutoff (2.8) for HB: "
READ(*,*)hcut
DO i=1,N
READ(12,*) k,x
   IF (x <= hcut ) THEN
      hcount=hcount+1
   ENDIF
ENDDO
PRINT*, "Total No of Hbonds under given cutoff : ",hcount
PRINT*,
hprob = REAL(hcount)/REAL(N)
hpercent=hprob*100
WRITE(*,20) hpercent
20 FORMAT ("Formed HBONDS = ",2X,F7.2,1X,"%")
CLOSE(12)
!CLOSE(18)
END PROGRAM hbond
!=======================================================================!
SUBROUTINE get_steps(iunt,N_data_points)
IMPLICIT NONE
INTEGER,INTENT(IN) :: iunt
INTEGER,INTENT(OUT) :: N_data_points
INTEGER::ios
N_data_points=0
REWIND(iunt)
DO
READ(iunt,*,IOSTAT=ios)
if (ios /= 0)  EXIT
N_data_points=N_data_points+1
ENDDO
REWIND(iunt)
END SUBROUTINE get_steps
!=======================================================================!
!                     ANJI BABU KAPAKAYALA                              !
!=======================================================================!
