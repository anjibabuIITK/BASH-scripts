program findminimum
implicit none
real*8:: cv(1000000),fes(1000000),dummy,minimum
integer:: i,nbin

!nbin=4801
nbin=3721
do i=1,nbin
read(*,*) cv(i),dummy,fes(i)
end do

minimum=fes(1)

do i=1,nbin
if(fes(i).lt.minimum) then
   minimum=fes(i)
endif
end do

do i=1,nbin
write(*,*) cv(i),fes(i)-minimum
end do
 
!print*,"Minimum value =",minimum
end program
