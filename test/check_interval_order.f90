program check_interval_order

  use, intrinsic :: iso_fortran_env, only: error_unit
  use, intrinsic :: iso_fortran_env, only: int32
  use, intrinsic :: iso_fortran_env, only: real32
  use, intrinsic :: iso_fortran_env, only: real64
  use, intrinsic :: iso_fortran_env, only: real128

  use, intrinsic :: ieee_arithmetic, only: ieee_unordered

  use, non_intrinsic :: legendre_polynomial_zero_intervals_fortran, only: get_zero_interval



  implicit none


  block

    integer(int32) :: degree


    do degree = 1_int32, 4096_int32
      call check_interval_order_real32(degree)
      call check_interval_order_real64(degree)
      call check_interval_order_real128(degree)
    end do

  end block

  print *, "OK: check_interval_order"



  contains



  subroutine check_interval_order_real32(degree)

    integer(int32), intent(in) :: degree


    logical :: flag_ok

    logical, dimension(1_int32:degree) :: validity

    integer(int32) :: k

    real(real32), dimension(1_int32:degree) :: x_lower, x_upper


    call get_zero_interval( &!
      n       = degree , &!
      k       = [(k, k = 1_int32, degree)], &!
      x_lower = x_lower, &!
      x_upper = x_upper  &!
    )


    block

      validity(:) = .not. ieee_unordered( x_lower(:) , x_upper(:) )

      associate( &!
        validity_minval => validity(1_int32) , &!
        validity_maxval => validity(degree)   &!
      )

        validity_minval = validity_minval .and. ( x_lower(1_int32) >= -1.0_real32 )
        validity_maxval = validity_maxval .and. ( x_upper(degree)  <=  1.0_real32 )

      end associate

      validity(:) = validity(:) .and. ( x_lower(:) < x_upper(:) )


      flag_ok = all( validity(:) )


      if (.not. flag_ok) then
        do k = 1_int32, degree
          if ( validity(k) ) cycle
          write(error_unit, *) k, x_lower(k), x_upper(k)
        end do
      end if

    end block


    if (degree > 1_int32) then
      associate( maxval_k_adjacent => degree - 1_int32 )

        validity ( 1_int32 : maxval_k_adjacent ) = &!
        x_upper  ( 1_int32 : maxval_k_adjacent ) < &!
        x_lower  ( 2_int32 : degree            )


        flag_ok = flag_ok .and. all( validity(1_int32 : maxval_k_adjacent) )


        if (.not. flag_ok) then
          do k = 1_int32, maxval_k_adjacent

            if ( validity(k) ) cycle

            write(error_unit, *) &!
            & k, '[', x_lower(k          ), x_upper(k          ), ']' , &!
            &    '[', x_lower(k + 1_int32), x_upper(k + 1_int32), ']'

          end do
        end if

      end associate
    end if


    if (flag_ok) return


    write(error_unit, '(A,1X,I0)') 'NG: check_interval_order_real32 @ degree =', degree

    error stop

  end subroutine check_interval_order_real32


  subroutine check_interval_order_real64(degree)

    integer(int32), intent(in) :: degree


    logical :: flag_ok

    logical, dimension(1_int32:degree) :: validity

    integer(int32) :: k

    real(real64), dimension(1_int32:degree) :: x_lower, x_upper


    call get_zero_interval( &!
      n       = degree , &!
      k       = [(k, k = 1_int32, degree)], &!
      x_lower = x_lower, &!
      x_upper = x_upper  &!
    )


    block

      validity(:) = .not. ieee_unordered( x_lower(:) , x_upper(:) )

      associate( &!
        validity_minval => validity(1_int32) , &!
        validity_maxval => validity(degree)   &!
      )

        validity_minval = validity_minval .and. ( x_lower(1_int32) >= -1.0_real64 )
        validity_maxval = validity_maxval .and. ( x_upper(degree)  <=  1.0_real64 )

      end associate

      validity(:) = validity(:) .and. ( x_lower(:) < x_upper(:) )


      flag_ok = all( validity(:) )


      if (.not. flag_ok) then
        do k = 1_int32, degree
          if ( validity(k) ) cycle
          write(error_unit, *) k, x_lower(k), x_upper(k)
        end do
      end if

    end block


    if (degree > 1_int32) then
      associate( maxval_k_adjacent => degree - 1_int32 )

        validity ( 1_int32 : maxval_k_adjacent ) = &!
        x_upper  ( 1_int32 : maxval_k_adjacent ) < &!
        x_lower  ( 2_int32 : degree            )


        flag_ok = flag_ok .and. all( validity(1_int32 : maxval_k_adjacent) )


        if (.not. flag_ok) then
          do k = 1_int32, maxval_k_adjacent

            if ( validity(k) ) cycle

            write(error_unit, *) &!
            & k, '[', x_lower(k          ), x_upper(k          ), ']' , &!
            &    '[', x_lower(k + 1_int32), x_upper(k + 1_int32), ']'

          end do
        end if

      end associate
    end if


    if (flag_ok) return


    write(error_unit, '(A,1X,I0)') 'NG: check_interval_order_real64 @ degree =', degree

    error stop

  end subroutine check_interval_order_real64


  subroutine check_interval_order_real128(degree)

    integer(int32), intent(in) :: degree


    logical :: flag_ok

    logical, dimension(1_int32:degree) :: validity

    integer(int32) :: k

    real(real128), dimension(1_int32:degree) :: x_lower, x_upper


    call get_zero_interval( &!
      n       = degree , &!
      k       = [(k, k = 1_int32, degree)], &!
      x_lower = x_lower, &!
      x_upper = x_upper  &!
    )


    block

      validity(:) = .not. ieee_unordered( x_lower(:) , x_upper(:) )

      associate( &!
        validity_minval => validity(1_int32) , &!
        validity_maxval => validity(degree)   &!
      )

        validity_minval = validity_minval .and. ( x_lower(1_int32) >= -1.0_real128 )
        validity_maxval = validity_maxval .and. ( x_upper(degree)  <=  1.0_real128 )

      end associate

      validity(:) = validity(:) .and. ( x_lower(:) < x_upper(:) )


      flag_ok = all( validity(:) )


      if (.not. flag_ok) then
        do k = 1_int32, degree
          if ( validity(k) ) cycle
          write(error_unit, *) k, x_lower(k), x_upper(k)
        end do
      end if

    end block


    if (degree > 1_int32) then
      associate( maxval_k_adjacent => degree - 1_int32 )

        validity ( 1_int32 : maxval_k_adjacent ) = &!
        x_upper  ( 1_int32 : maxval_k_adjacent ) < &!
        x_lower  ( 2_int32 : degree            )


        flag_ok = flag_ok .and. all( validity(1_int32 : maxval_k_adjacent) )


        if (.not. flag_ok) then
          do k = 1_int32, maxval_k_adjacent

            if ( validity(k) ) cycle

            write(error_unit, *) &!
            & k, '[', x_lower(k          ), x_upper(k          ), ']' , &!
            &    '[', x_lower(k + 1_int32), x_upper(k + 1_int32), ']'

          end do
        end if

      end associate
    end if


    if (flag_ok) return


    write(error_unit, '(A,1X,I0)') 'NG: check_interval_order_real128 @ degree =', degree

    error stop

  end subroutine check_interval_order_real128

end program check_interval_order
