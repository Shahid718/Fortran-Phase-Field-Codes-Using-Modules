
!   This program uses modules for Cahn-Hilliard Equation.
!         
!   Author :
!              Shahid Maqbool
! 
!   Modified :
!			11 August 2023, 06 June 2026
!
!   To compile and run :
!                          Check ReadMe
!              
!------------------------------------------------------------------------------


program fd_ch_test
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

  integer ( 4 ), parameter :: no_of_steps = 10000
  integer ( 4)             :: frequency = 1000
  integer (4 )             :: step 
  real ( 8 )   , parameter :: dt = 0.01
  real ( 8 )               :: start, finish, compute_time

  ! material specific 

  real ( 8 ) :: initial_con = 0.4
  real ( 8 ) :: mobility = 1.0
  real ( 8 ) :: grad_coef = 0.5

  ! microstructure

  real ( 8 ) :: noise = 0.02
  real ( 8 ) :: A = 1.0
  real ( 8 ) , dimension ( Nx, Ny ) :: r, con, dfdcon, dummy_con


  call cpu_time ( start )



  ! ===========================================================================
  !                           initial microstructure
  ! ===========================================================================



  call random_number ( r )
  con =  Introduce_fluctuation( initial_con, noise, r )



  ! ===========================================================================
  !                         evolution of microstructure 
  ! ===========================================================================



  time_loop: do step = 1, no_of_steps


     dfdcon = Deriv_free_energy ( A, con )

     dummy_con = dfdcon - grad_coef*Laplacian ( Nx, Ny, con )

     con = con + dt*mobility*Laplacian( Nx, Ny, dummy_con ) 



     ! adjust order parameter in range

     where ( con >= 0.99999 )  con = 0.99999
     where ( con < 0.00001  )  con = 0.00001


     ! print steps

     if ( mod ( step, frequency ) .eq. 0 )  print *, 'Done steps  = ', step


  end do time_loop


  call cpu_time ( finish )

  compute_time = finish - start

  

  ! ===========================================================================
  !                                  Output 
  ! ===========================================================================



  call output_files( con,Nx,Ny,no_of_steps,dt,initial_con,mobility,grad_coef,noise,A,compute_time )


end program fd_ch_test