
!   This program uses modules for Allen-Cahn Equation.
!         
!   Author :
!              Shahid Maqbool
! 
!   Modified :
!                10 August 2023, 6 June 2026
!
!   To compile and run :
!                          Check ReadMe
!              
!------------------------------------------------------------------------------


program fd_ac_test
  use fluctuation_module
  use free_energy_module
  use laplace_module
  use output_module
  implicit none


  ! ===========================================================================
  !                                parameters
  ! ===========================================================================


  ! simulation cell 

  integer ( 4 ), parameter :: Nx = 64
  integer ( 4 ), parameter :: Ny = 64

  ! time integration

  integer ( 4 ), parameter :: no_of_steps = 1500
  integer ( 4)             :: frequency = 100
  integer (4 )             :: step 
  real ( 8 )   , parameter :: dt = 0.01
  real ( 8 )               :: start, finish, compute_time

  ! material specific 

  real ( 8 ) :: initial_phi = 0.5
  real ( 8 ) :: mobility = 1.0
  real ( 8 ) :: grad_coef = 1.0

  ! microstructure

  real ( 8 ) :: noise = 0.02
  real ( 8 ) :: A = 1.0
  real ( 8 ) , dimension ( Nx, Ny ) :: r, phi, dfdphi, lap_phi


  call cpu_time ( start )



  ! ===========================================================================
  !                           initial microstucture
  ! ===========================================================================


  call random_number ( r )
  phi =  Introduce_fluctuation( initial_phi, noise, r )



  ! ===========================================================================
  !                         evolution of microstructure 
  ! ===========================================================================



  time_loop: do step = 1, no_of_steps


     dfdphi = Deriv_free_energy ( A, phi)

     phi = phi - dt*mobility*( dfdphi - grad_coef*Laplacian ( Nx, Ny, phi )  )


     ! adjust order parameter in range

     where ( phi >= 0.99999 )  phi = 0.99999
     where ( phi < 0.00001  )  phi = 0.00001


     ! print steps

     if ( mod ( step, frequency ) .eq. 0 )  print *, 'Done steps  = ', step


  end do time_loop


  call cpu_time ( finish )

  
  compute_time = finish - start

  

  ! ===========================================================================
  !                                  Output 
  ! ===========================================================================



  call output_files( phi,Nx,Ny,no_of_steps,dt,initial_phi,mobility,grad_coef,noise,A,compute_time )



end program fd_ac_test