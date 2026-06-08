!-------------------------------------------------------------------
!
!  This is the module for boundary conditions
!
!  Modified :
!		18 April 2023, 06 June 2026
!
!------------------------------------------------------------------


module BC_module
contains

 pure subroutine Set_boundary_conditions ( i_, j_, jp_, jm_, ip_, im_ )
  implicit none

  
  integer ( 4 ), parameter      :: Nx = 64
  integer ( 4 ), parameter      :: Ny = 64  
  integer ( 4 ), intent ( in )  :: i_, j_
  integer ( 4 ), intent ( out ) :: jp_, jm_, ip_, im_


  jp_ = j_ + 1
  jm_ = j_ - 1

  ip_ = i_ + 1
  im_ = i_ - 1

  if ( im_ == 0 ) im_ = Nx
  if ( ip_ == ( Nx + 1 ) ) ip_ = 1
  if ( jm_ == 0 ) jm_ = Ny
  if ( jp_ == ( Ny + 1 ) ) jp_ = 1


 end subroutine Set_boundary_conditions

end module BC_module