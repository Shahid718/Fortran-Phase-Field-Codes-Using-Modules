!------------------------------------------------------------------
!
!  This is the module for Laplace evaluation
!
!
!  Modified   :
!		18 April 2023, 06 June 2026
!
!------------------------------------------------------------------


module laplace_module
contains

pure subroutine Evaluate_laplacian ( lap_phi_, phi_, dx_, dy_, &
     & i_ , j_, ip_, jp_, im_, jm_ )
  implicit none

  integer ( 4 ), parameter                        :: Nx = 64
  integer ( 4 ), parameter                        :: Ny = 64 
  integer ( 4 ), intent ( in )                    :: dx_, dy_, i_, j_
  integer ( 4 ), intent ( in )                    :: ip_, jp_
  integer ( 4 ), intent ( in )                    :: im_, jm_
  real ( 8 ), dimension ( Nx, Ny ), intent ( out ):: lap_phi_
  real ( 8 ), dimension ( Nx, Ny ), intent ( in ) :: phi_


  lap_phi_(i_,j_) = ( phi_(ip_,j_) + phi_(im_,j_) + phi_(i_,jm_) + &
       phi_(i_,jp_) - 4.0*phi_(i_,j_) ) / ( dx_*dy_ )              



end subroutine Evaluate_laplacian

end module laplace_module