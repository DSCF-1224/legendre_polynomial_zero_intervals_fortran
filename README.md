# legendre_polynomial_zero_intervals_fortran

Multi-precision intervals for Fortran, each enclosing exactly one zero of the Legendre polynomial.

This library only computes the intervals.
It does not evaluate $P_n$; how the intervals are used (e.g. as starting points of Newton's method or as brackets for bisection) is left to the caller.

## Mathematical background

The $k$-th zero $x_k$ of $P_n$, numbered in ascending order of $x$, satisfies

```math
- \cos \lbrace (k - \tfrac{1}{2}) \pi / (n + \tfrac{1}{2}) \rbrace < x_k < - \cos \lbrace k \pi / (n + \tfrac{1}{2}) \rbrace,
\qquad k = 1, \dots, n .
```

The intervals are pairwise disjoint, so each contains exactly one zero.

### References

- Wikipedia, *Legendre polynomials*, section "Zeros",
  [revision 1370673668](https://en.wikipedia.org/w/index.php?title=Legendre_polynomials&oldid=1370673668#Zeros).
  The bound is stated there in terms of $\theta$ with $x = \cos\theta$ and $k = 0, 1, \dots, n-1$.
- W. Van Assche, *The impact of Stieltjes' work on continued fractions and orthogonal polynomials*,
  [arXiv:math/9307220](https://arxiv.org/abs/math/9307220) (1993).
  The bound is stated there with the zeros numbered in descending order of $x$, and is attributed to Bruns (1881).

## API

All procedures are `elemental subroutine`s; `k` may be an array.

| Generic name | Returns |
| --- | --- |
| `get_zero_interval(n, k, x_lower, x_upper)` | both endpoints |
| `get_zero_interval_lower(n, k, x)` | $- \cos \lbrace (k - \tfrac{1}{2}) \pi / (n + \tfrac{1}{2}) \rbrace$ |
| `get_zero_interval_upper(n, k, x)` | $- \cos \lbrace k \pi / (n + \tfrac{1}{2}) \rbrace$ |

- `n`, `k`: `integer(int32)`
- `x`, `x_lower`, `x_upper`: `real(real32)`, `real(real64)`, or `real(real128)` (`with_real128` only)

### Invalid input

A signaling NaN is returned unless `1 <= k <= n` (this includes every `k` when `n < 1`).

## Usage

```fortran
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
```

<!-- TODO: add fpm dependency examples (tag "v*+default" / "v*+with_real128") after the first release -->

## Floating-point considerations

The enclosure is a mathematical guarantee.
The endpoints are computed in floating point, so it is not guaranteed that $P_n$ changes sign between the computed endpoints; checking this, if required, is the caller's responsibility.

## Tested properties

For every supported real kind:

- degrees 1 to 4096: the intervals are within $[-1, 1]$, ordered in ascending order of $x$, and pairwise disjoint
- degrees 1 to 5: each interval strictly encloses the known zero
- degrees $n$ = 1 to 4096 with `k` = -4 to 0 and `k` = $n+1$ to $n+5$: both endpoints are NaN
- degrees -4 to 0: both endpoints are NaN

Degrees above 4096 are not tested.

## Building

The sources are generated with [fypp](https://github.com/aradi/fypp).

```sh
fypp src/legendre_polynomial_zero_intervals_fortran.fypp src/legendre_polynomial_zero_intervals_fortran.f90
fypp src/legendre_polynomial_zero_intervals_fortran.fypp src/legendre_polynomial_zero_intervals_fortran.f90 -DWITH_REAL128
```

The first command generates the default (`real32`, `real64`) version, the second the version with `real128`.
The generated sources are checked with gfortran under `-std=f2008` and `-std=f2018` in CI.

## License

MIT
