program demo

  use, intrinsic :: iso_fortran_env, only: int32, real64

  use, non_intrinsic :: legendre_polynomial_zero_intervals_fortran, only: get_zero_interval


  implicit none


  integer(int32), parameter :: n = 5_int32


  integer(int32) :: k

  real(real64), dimension(n) :: x_lower, x_upper


  call get_zero_interval(n, [(k, k = 1_int32, n)], x_lower, x_upper)


  do k = 1_int32, n
    print *, k, ': [', x_lower(k), ',', x_upper(k), ']'
  end do

end program demo
