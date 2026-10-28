program check_known_zeros

  use, intrinsic :: iso_fortran_env, only: error_unit
  use, intrinsic :: iso_fortran_env, only: int32
  use, intrinsic :: iso_fortran_env, only: real32
  use, intrinsic :: iso_fortran_env, only: real64
  use, intrinsic :: iso_fortran_env, only: real128

  use, non_intrinsic :: legendre_polynomial_zero_intervals_fortran, only: get_zero_interval



  implicit none



  block

    real(real32), parameter :: zero_degree2_2 = sqrt( 1.0_real32 / 3.0_real32 )
    real(real32), parameter :: zero_degree2_1 = - zero_degree2_2

    real(real32), parameter :: zero_degree3_3 = sqrt( 3.0_real32 / 5.0_real32 )
    real(real32), parameter :: zero_degree3_1 = - zero_degree3_3

    real(real32), parameter :: zero_degree4_4 = sqrt( ( 3.0_real32 + sqrt(4.8_real32) ) / 7.0_real32 )
    real(real32), parameter :: zero_degree4_3 = sqrt( ( 3.0_real32 - sqrt(4.8_real32) ) / 7.0_real32 )
    real(real32), parameter :: zero_degree4_2 = - zero_degree4_3
    real(real32), parameter :: zero_degree4_1 = - zero_degree4_4

    real(real32), parameter :: zero_degree5_5 = sqrt( 5.0_real32 + sqrt(40.0_real32 / 7.0_real32) ) / 3.0_real32
    real(real32), parameter :: zero_degree5_4 = sqrt( 5.0_real32 - sqrt(40.0_real32 / 7.0_real32) ) / 3.0_real32
    real(real32), parameter :: zero_degree5_2 = - zero_degree5_4
    real(real32), parameter :: zero_degree5_1 = - zero_degree5_5


    call check_known_zeros_real32( &!
      [0.0_real32] &!
    )

    call check_known_zeros_real32( &!
      [zero_degree2_1, zero_degree2_2] &!
    )

    call check_known_zeros_real32( &!
      [zero_degree3_1, 0.0_real32, zero_degree3_3] &!
    )

    call check_known_zeros_real32( &!
      [zero_degree4_1, zero_degree4_2, zero_degree4_3, zero_degree4_4] &!
    )

    call check_known_zeros_real32( &!
      [zero_degree5_1, zero_degree5_2, 0.0_real32, zero_degree5_4, zero_degree5_5] &!
    )

  end block
  block

    real(real64), parameter :: zero_degree2_2 = sqrt( 1.0_real64 / 3.0_real64 )
    real(real64), parameter :: zero_degree2_1 = - zero_degree2_2

    real(real64), parameter :: zero_degree3_3 = sqrt( 3.0_real64 / 5.0_real64 )
    real(real64), parameter :: zero_degree3_1 = - zero_degree3_3

    real(real64), parameter :: zero_degree4_4 = sqrt( ( 3.0_real64 + sqrt(4.8_real64) ) / 7.0_real64 )
    real(real64), parameter :: zero_degree4_3 = sqrt( ( 3.0_real64 - sqrt(4.8_real64) ) / 7.0_real64 )
    real(real64), parameter :: zero_degree4_2 = - zero_degree4_3
    real(real64), parameter :: zero_degree4_1 = - zero_degree4_4

    real(real64), parameter :: zero_degree5_5 = sqrt( 5.0_real64 + sqrt(40.0_real64 / 7.0_real64) ) / 3.0_real64
    real(real64), parameter :: zero_degree5_4 = sqrt( 5.0_real64 - sqrt(40.0_real64 / 7.0_real64) ) / 3.0_real64
    real(real64), parameter :: zero_degree5_2 = - zero_degree5_4
    real(real64), parameter :: zero_degree5_1 = - zero_degree5_5


    call check_known_zeros_real64( &!
      [0.0_real64] &!
    )

    call check_known_zeros_real64( &!
      [zero_degree2_1, zero_degree2_2] &!
    )

    call check_known_zeros_real64( &!
      [zero_degree3_1, 0.0_real64, zero_degree3_3] &!
    )

    call check_known_zeros_real64( &!
      [zero_degree4_1, zero_degree4_2, zero_degree4_3, zero_degree4_4] &!
    )

    call check_known_zeros_real64( &!
      [zero_degree5_1, zero_degree5_2, 0.0_real64, zero_degree5_4, zero_degree5_5] &!
    )

  end block
  block

    real(real128), parameter :: zero_degree2_2 = sqrt( 1.0_real128 / 3.0_real128 )
    real(real128), parameter :: zero_degree2_1 = - zero_degree2_2

    real(real128), parameter :: zero_degree3_3 = sqrt( 3.0_real128 / 5.0_real128 )
    real(real128), parameter :: zero_degree3_1 = - zero_degree3_3

    real(real128), parameter :: zero_degree4_4 = sqrt( ( 3.0_real128 + sqrt(4.8_real128) ) / 7.0_real128 )
    real(real128), parameter :: zero_degree4_3 = sqrt( ( 3.0_real128 - sqrt(4.8_real128) ) / 7.0_real128 )
    real(real128), parameter :: zero_degree4_2 = - zero_degree4_3
    real(real128), parameter :: zero_degree4_1 = - zero_degree4_4

    real(real128), parameter :: zero_degree5_5 = sqrt( 5.0_real128 + sqrt(40.0_real128 / 7.0_real128) ) / 3.0_real128
    real(real128), parameter :: zero_degree5_4 = sqrt( 5.0_real128 - sqrt(40.0_real128 / 7.0_real128) ) / 3.0_real128
    real(real128), parameter :: zero_degree5_2 = - zero_degree5_4
    real(real128), parameter :: zero_degree5_1 = - zero_degree5_5


    call check_known_zeros_real128( &!
      [0.0_real128] &!
    )

    call check_known_zeros_real128( &!
      [zero_degree2_1, zero_degree2_2] &!
    )

    call check_known_zeros_real128( &!
      [zero_degree3_1, 0.0_real128, zero_degree3_3] &!
    )

    call check_known_zeros_real128( &!
      [zero_degree4_1, zero_degree4_2, zero_degree4_3, zero_degree4_4] &!
    )

    call check_known_zeros_real128( &!
      [zero_degree5_1, zero_degree5_2, 0.0_real128, zero_degree5_4, zero_degree5_5] &!
    )

  end block

  print *, 'OK: check_known_zeros'



  contains



  subroutine check_known_zeros_real32(zeros)

    real(real32), intent(in), dimension(:) :: zeros


    logical, dimension( size( zeros(:) ) ) :: validity_lower, validity_upper

    integer(int32) :: k

    real(real32), dimension( size( zeros(:) ) ) :: x_lower, x_upper


    associate( n => size( zeros(:), kind=int32 ) )

      call get_zero_interval( &!
        n       = n, &!
        k       = [(k, k = 1_int32, n)], &!
        x_lower = x_lower, &!
        x_upper = x_upper  &!
      )


      validity_lower(:) = x_lower(:) < zeros(:)
      validity_upper(:) = zeros(:) < x_upper(:)

      if ( all( validity_lower(:) ) .and. all( validity_upper(:) ) ) return


      do k = 1_int32, n
        write(error_unit, *) k, x_lower(k), zeros(k), x_upper(k), validity_lower(k), validity_upper(k)
      end do

      write(error_unit, *) 'NG: check_known_zeros_real32'

      error stop

    end associate

  end subroutine check_known_zeros_real32


  subroutine check_known_zeros_real64(zeros)

    real(real64), intent(in), dimension(:) :: zeros


    logical, dimension( size( zeros(:) ) ) :: validity_lower, validity_upper

    integer(int32) :: k

    real(real64), dimension( size( zeros(:) ) ) :: x_lower, x_upper


    associate( n => size( zeros(:), kind=int32 ) )

      call get_zero_interval( &!
        n       = n, &!
        k       = [(k, k = 1_int32, n)], &!
        x_lower = x_lower, &!
        x_upper = x_upper  &!
      )


      validity_lower(:) = x_lower(:) < zeros(:)
      validity_upper(:) = zeros(:) < x_upper(:)

      if ( all( validity_lower(:) ) .and. all( validity_upper(:) ) ) return


      do k = 1_int32, n
        write(error_unit, *) k, x_lower(k), zeros(k), x_upper(k), validity_lower(k), validity_upper(k)
      end do

      write(error_unit, *) 'NG: check_known_zeros_real64'

      error stop

    end associate

  end subroutine check_known_zeros_real64


  subroutine check_known_zeros_real128(zeros)

    real(real128), intent(in), dimension(:) :: zeros


    logical, dimension( size( zeros(:) ) ) :: validity_lower, validity_upper

    integer(int32) :: k

    real(real128), dimension( size( zeros(:) ) ) :: x_lower, x_upper


    associate( n => size( zeros(:), kind=int32 ) )

      call get_zero_interval( &!
        n       = n, &!
        k       = [(k, k = 1_int32, n)], &!
        x_lower = x_lower, &!
        x_upper = x_upper  &!
      )


      validity_lower(:) = x_lower(:) < zeros(:)
      validity_upper(:) = zeros(:) < x_upper(:)

      if ( all( validity_lower(:) ) .and. all( validity_upper(:) ) ) return


      do k = 1_int32, n
        write(error_unit, *) k, x_lower(k), zeros(k), x_upper(k), validity_lower(k), validity_upper(k)
      end do

      write(error_unit, *) 'NG: check_known_zeros_real128'

      error stop

    end associate

  end subroutine check_known_zeros_real128

end program check_known_zeros
