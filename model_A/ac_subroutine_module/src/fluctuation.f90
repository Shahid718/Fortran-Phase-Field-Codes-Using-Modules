!------------------------------------------------------------------
!
!  This is the module for thermal fluctuation
!
!
!  Modified :
!		18 April 2023, 06 June 2026
!
!------------------------------------------------------------------

module fluctuation_module
contains

pure subroutine Introduce_fluctuation ( phi_, initial_phi_, noise_,r_  )
  implicit none

  integer ( 4 ), parameter                         :: Nx = 64
  integer ( 4 ), parameter                         :: Ny = 64  
  real ( 8 ), intent ( in )                        :: noise_
  real ( 8 ), intent ( in )                        :: initial_phi_
  real ( 8 ), dimension ( Nx, Ny ), intent ( out ) :: phi_
  real ( 8 ), dimension ( Nx, Ny ), intent ( in )  :: r_


  phi_ = initial_phi_ + noise_*( 0.5 - r_ )


end subroutine Introduce_fluctuation

end module fluctuation_module