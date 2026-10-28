module legendre_polynomial_zero_intervals_fortran

  use, intrinsic :: iso_fortran_env, only: int32
  use, intrinsic :: iso_fortran_env, only: real32
  use, intrinsic :: iso_fortran_env, only: real64

  use, intrinsic :: ieee_arithmetic, only: ieee_signaling_nan
  use, intrinsic :: ieee_arithmetic, only: ieee_value



  implicit none



  private

  public :: get_zero_interval
  public :: get_zero_interval_lower
  public :: get_zero_interval_upper



  real(real32), parameter :: pi_real32 = 3.141592653589793238462643383279502884197_real32
  real(real64), parameter :: pi_real64 = 3.141592653589793238462643383279502884197_real64



  !> version: experimental
  !! calculate
  !! \( - \cos \lbrace (k - \tfrac{1}{2}) \pi / (n + \tfrac{1}{2}) \rbrace \) and
  !! \( - \cos \lbrace k \pi / (n + \tfrac{1}{2}) \rbrace \)
  !! for `real32` and `real64`
  interface get_zero_interval
    module procedure get_zero_interval_real32
    module procedure get_zero_interval_real64
  end interface

  !> version: experimental
  !! calculate \( - \cos \lbrace (k - \tfrac{1}{2}) \pi / (n + \tfrac{1}{2}) \rbrace \)
  !! for `real32` and `real64`
  interface get_zero_interval_lower
    module procedure get_zero_interval_lower_real32
    module procedure get_zero_interval_lower_real64
  end interface

  !> version: experimental
  !! calculate \( - \cos \lbrace k \pi / (n + \tfrac{1}{2}) \rbrace \)
  !! for `real32` and `real64`
  interface get_zero_interval_upper
    module procedure get_zero_interval_upper_real32
    module procedure get_zero_interval_upper_real64
  end interface



  contains



  elemental subroutine get_zero_interval_real32(n, k, x_lower, x_upper)
    !! version: experimental
    !! calculate
    !! \( - \cos \lbrace (k - \tfrac{1}{2}) \pi / (n + \tfrac{1}{2}) \rbrace \) and
    !! \( - \cos \lbrace k \pi / (n + \tfrac{1}{2}) \rbrace \)
    !! for `real32`
    !! @note
    !! signaling NaN is returned unless `1 <= k <= n`.
    !! @endnote

    integer(int32), intent(in) :: n
      !! degree of the target Legendre polynomial

    integer(int32), intent(in) :: k
      !! selector of the target zero interval,
      !! numbered in ascending order of `x`

    real(real32), intent(out) :: x_lower
      !! \( - \cos \lbrace (k - \tfrac{1}{2}) \pi / (n + \tfrac{1}{2}) \rbrace \)

    real(real32), intent(out) :: x_upper
      !! \( - \cos \lbrace k \pi / (n + \tfrac{1}{2}) \rbrace \)


    call get_zero_interval_lower( n = n, k = k, x = x_lower )
    call get_zero_interval_upper( n = n, k = k, x = x_upper )

  end subroutine get_zero_interval_real32


  elemental subroutine get_zero_interval_real64(n, k, x_lower, x_upper)
    !! version: experimental
    !! calculate
    !! \( - \cos \lbrace (k - \tfrac{1}{2}) \pi / (n + \tfrac{1}{2}) \rbrace \) and
    !! \( - \cos \lbrace k \pi / (n + \tfrac{1}{2}) \rbrace \)
    !! for `real64`
    !! @note
    !! signaling NaN is returned unless `1 <= k <= n`.
    !! @endnote

    integer(int32), intent(in) :: n
      !! degree of the target Legendre polynomial

    integer(int32), intent(in) :: k
      !! selector of the target zero interval,
      !! numbered in ascending order of `x`

    real(real64), intent(out) :: x_lower
      !! \( - \cos \lbrace (k - \tfrac{1}{2}) \pi / (n + \tfrac{1}{2}) \rbrace \)

    real(real64), intent(out) :: x_upper
      !! \( - \cos \lbrace k \pi / (n + \tfrac{1}{2}) \rbrace \)


    call get_zero_interval_lower( n = n, k = k, x = x_lower )
    call get_zero_interval_upper( n = n, k = k, x = x_upper )

  end subroutine get_zero_interval_real64




  elemental subroutine get_zero_interval_lower_real32(n, k, x)
    !! version: experimental
    !! calculate \( - \cos \lbrace (k - \tfrac{1}{2}) \pi / (n + \tfrac{1}{2}) \rbrace \) for `real32`
    !! @note
    !! signaling NaN is returned unless `1 <= k <= n`.
    !! @endnote

    integer(int32), intent(in) :: n
      !! degree of the target Legendre polynomial

    integer(int32), intent(in) :: k
      !! selector of the target zero interval,
      !! numbered in ascending order of `x`

    real(real32), intent(out) :: x
      !! \( - \cos \lbrace (k - \tfrac{1}{2}) \pi / (n + \tfrac{1}{2}) \rbrace \)


    if ( (1_int32 <= k) .and. (k <= n) ) then
      x = - cos( (k - 0.5_real32) * pi_real32 / (n + 0.5_real32) )
    else
      x = ieee_value(0.0_real32, ieee_signaling_nan)
    end if

  end subroutine get_zero_interval_lower_real32


  elemental subroutine get_zero_interval_lower_real64(n, k, x)
    !! version: experimental
    !! calculate \( - \cos \lbrace (k - \tfrac{1}{2}) \pi / (n + \tfrac{1}{2}) \rbrace \) for `real64`
    !! @note
    !! signaling NaN is returned unless `1 <= k <= n`.
    !! @endnote

    integer(int32), intent(in) :: n
      !! degree of the target Legendre polynomial

    integer(int32), intent(in) :: k
      !! selector of the target zero interval,
      !! numbered in ascending order of `x`

    real(real64), intent(out) :: x
      !! \( - \cos \lbrace (k - \tfrac{1}{2}) \pi / (n + \tfrac{1}{2}) \rbrace \)


    if ( (1_int32 <= k) .and. (k <= n) ) then
      x = - cos( (k - 0.5_real64) * pi_real64 / (n + 0.5_real64) )
    else
      x = ieee_value(0.0_real64, ieee_signaling_nan)
    end if

  end subroutine get_zero_interval_lower_real64




  elemental subroutine get_zero_interval_upper_real32(n, k, x)
    !! version: experimental
    !! calculate \( - \cos \lbrace k \pi / (n + \tfrac{1}{2}) \rbrace \) for `real32`
    !! @note
    !! signaling NaN is returned unless `1 <= k <= n`.
    !! @endnote

    integer(int32), intent(in) :: n
      !! degree of the target Legendre polynomial

    integer(int32), intent(in) :: k
      !! selector of the target zero interval,
      !! numbered in ascending order of `x`

    real(real32), intent(out) :: x
      !! \( - \cos \lbrace k \pi / (n + \tfrac{1}{2}) \rbrace \)


    if ( (1_int32 <= k) .and. (k <= n) ) then
      x = - cos( (k * pi_real32) / (n + 0.5_real32) )
    else
      x = ieee_value(0.0_real32, ieee_signaling_nan)
    end if

  end subroutine get_zero_interval_upper_real32


  elemental subroutine get_zero_interval_upper_real64(n, k, x)
    !! version: experimental
    !! calculate \( - \cos \lbrace k \pi / (n + \tfrac{1}{2}) \rbrace \) for `real64`
    !! @note
    !! signaling NaN is returned unless `1 <= k <= n`.
    !! @endnote

    integer(int32), intent(in) :: n
      !! degree of the target Legendre polynomial

    integer(int32), intent(in) :: k
      !! selector of the target zero interval,
      !! numbered in ascending order of `x`

    real(real64), intent(out) :: x
      !! \( - \cos \lbrace k \pi / (n + \tfrac{1}{2}) \rbrace \)


    if ( (1_int32 <= k) .and. (k <= n) ) then
      x = - cos( (k * pi_real64) / (n + 0.5_real64) )
    else
      x = ieee_value(0.0_real64, ieee_signaling_nan)
    end if

  end subroutine get_zero_interval_upper_real64

end module legendre_polynomial_zero_intervals_fortran
