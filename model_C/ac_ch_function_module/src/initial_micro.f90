!-------------------------------------------------------------------
!
!  This is the module for initial microsture
!
!
!  Modified :
!             12 September 2023, 06 June 2026
!
!------------------------------------------------------------------


module Initial_microstructure_module
contains

  pure function Initial_microstructure (  radius_ )
    implicit none

    integer ( 4 ), parameter         :: Nx = 128
    integer ( 4 ), parameter         :: Ny = 128
    real ( 8 ), intent ( in )        :: radius_
    real ( 8 ), dimension ( Nx, Ny ) :: Initial_microstructure 
    integer ( 4 )                    :: i, j



    do i = 1, Nx
       do j = 1, Ny
	   
          if ( (i - Nx/2)*(i - Nx/2) + (j - Ny/2)*(j - Ny/2) & 
               < radius_**2 ) then
             Initial_microstructure(i,j) = 1.0               
          end if
		  
       end do
    end do


  end function Initial_microstructure
  
end module Initial_microstructure_module