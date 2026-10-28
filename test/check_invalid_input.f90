program check_invalid_input

  use, intrinsic :: iso_fortran_env, only: error_unit
  use, intrinsic :: iso_fortran_env, only: int32
  use, intrinsic :: iso_fortran_env, only: real32
  use, intrinsic :: iso_fortran_env, only: real64

  use, intrinsic :: ieee_arithmetic, only: ieee_is_nan

  use, non_intrinsic :: legendre_polynomial_zero_intervals_fortran, only: get_zero_interval



  implicit none



  block

    integer(int32) :: degree, k

    integer(int32), dimension(5) :: list_k


    do degree = 1_int32, 4096_int32
      call check_invalid_input_index_real32(degree)
      call check_invalid_input_index_real64(degree)
    end do


    list_k = [(k, k = 1_int32, 5_int32)]


    do degree = -4_int32, 0_int32
      call check_invalid_input_degree_real32( degree, list_k(:) )
      call check_invalid_input_degree_real64( degree, list_k(:) )
    end do

  end block

  print *, "OK: check_invalid_input"



  contains



  subroutine check_invalid_input_degree_real32(degree, list_k)

    integer(int32), intent(in) :: degree

    integer(int32), dimension(:), intent(in) :: list_k


    logical :: flag_ok


    call check_invalid_input_kernel_real32(degree, list_k(:), flag_ok)


    if (flag_ok) return


    write(error_unit, '(A,1X,I0)') 'NG: check_invalid_input_degree_real32 @ degree =', degree

    error stop

  end subroutine check_invalid_input_degree_real32


  subroutine check_invalid_input_degree_real64(degree, list_k)

    integer(int32), intent(in) :: degree

    integer(int32), dimension(:), intent(in) :: list_k


    logical :: flag_ok


    call check_invalid_input_kernel_real64(degree, list_k(:), flag_ok)


    if (flag_ok) return


    write(error_unit, '(A,1X,I0)') 'NG: check_invalid_input_degree_real64 @ degree =', degree

    error stop

  end subroutine check_invalid_input_degree_real64




  subroutine check_invalid_input_index_real32(degree)

    integer(int32), intent(in) :: degree


    logical :: flag_ok(2)

    integer(int32) :: k

    integer(int32), dimension(5) :: list_k


    list_k = [(k, k = -4_int32, 0_int32)]

    call check_invalid_input_kernel_real32( degree, list_k(:), flag_ok(1) )


    list_k = [(k, k = (degree + 1_int32), (degree + 5_int32))]

    call check_invalid_input_kernel_real32( degree, list_k(:), flag_ok(2) )


    if ( all(flag_ok(:) ) ) return


    write(error_unit, '(A,1X,I0)') 'NG: check_invalid_input_index_real32 @ degree =', degree

    error stop

  end subroutine check_invalid_input_index_real32


  subroutine check_invalid_input_index_real64(degree)

    integer(int32), intent(in) :: degree


    logical :: flag_ok(2)

    integer(int32) :: k

    integer(int32), dimension(5) :: list_k


    list_k = [(k, k = -4_int32, 0_int32)]

    call check_invalid_input_kernel_real64( degree, list_k(:), flag_ok(1) )


    list_k = [(k, k = (degree + 1_int32), (degree + 5_int32))]

    call check_invalid_input_kernel_real64( degree, list_k(:), flag_ok(2) )


    if ( all(flag_ok(:) ) ) return


    write(error_unit, '(A,1X,I0)') 'NG: check_invalid_input_index_real64 @ degree =', degree

    error stop

  end subroutine check_invalid_input_index_real64




  subroutine check_invalid_input_kernel_real32(degree, list_k, flag_ok)

    integer(int32), intent(in) :: degree

    integer(int32), dimension(:), intent(in) :: list_k

    logical, intent(out) :: flag_ok


    logical, dimension( size( list_k(:) ) ) :: validity

    integer(int32) :: i

    real(real32), dimension( size( list_k(:) ) ) :: x_lower, x_upper


    call get_zero_interval( &!
      n       = degree  , &!
      k       = list_k  , &!
      x_lower = x_lower , &!
      x_upper = x_upper   &!
    )


    validity(:) = ieee_is_nan( x_lower(:) ) .and. ieee_is_nan( x_upper(:) )
    flag_ok     = all( validity(:) )


    do i = 1_int32, size( list_k(:) )
      if ( validity(i) ) cycle
      write(error_unit, *) list_k(i), x_lower(i), x_upper(i)
    end do

  end subroutine check_invalid_input_kernel_real32


  subroutine check_invalid_input_kernel_real64(degree, list_k, flag_ok)

    integer(int32), intent(in) :: degree

    integer(int32), dimension(:), intent(in) :: list_k

    logical, intent(out) :: flag_ok


    logical, dimension( size( list_k(:) ) ) :: validity

    integer(int32) :: i

    real(real64), dimension( size( list_k(:) ) ) :: x_lower, x_upper


    call get_zero_interval( &!
      n       = degree  , &!
      k       = list_k  , &!
      x_lower = x_lower , &!
      x_upper = x_upper   &!
    )


    validity(:) = ieee_is_nan( x_lower(:) ) .and. ieee_is_nan( x_upper(:) )
    flag_ok     = all( validity(:) )


    do i = 1_int32, size( list_k(:) )
      if ( validity(i) ) cycle
      write(error_unit, *) list_k(i), x_lower(i), x_upper(i)
    end do

  end subroutine check_invalid_input_kernel_real64

end program check_invalid_input
