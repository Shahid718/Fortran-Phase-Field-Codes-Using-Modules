!------------------------------------------------------------------
!
!  This is the module for thermal fluctuation.
!
!  The function is a pure function
!
!  Modified   :
!		 11 August 2023, 06 June 2026
!
!------------------------------------------------------------------

module fluctuation_module
contains

pure function Introduce_fluctuation ( initial_con_, noise_,r_ )
  implicit none

  integer ( 4 ), parameter         :: Nx = 64
  integer ( 4 ), parameter         :: Ny = 64
  real ( 8 ), intent ( in )        :: noise_
  real ( 8 ), intent ( in )        :: initial_con_
  real ( 8 ), dimension ( Nx, Ny ) :: Introduce_fluctuation
  real ( 8 ), dimension ( Nx, Ny ), intent(in) :: r_


  Introduce_fluctuation = initial_con_ + noise_*( 0.5 - r_ )


end function Introduce_fluctuation

end module fluctuation_module