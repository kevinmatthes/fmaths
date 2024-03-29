!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!! Copyright (C) 2022 Kevin Matthes
!!
!! This program is free software; you can redistribute it and/or modify
!! it under the terms of the GNU General Public License as published by
!! the Free Software Foundation; either version 2 of the License, or
!! (at your option) any later version.
!!
!! This program is distributed in the hope that it will be useful,
!! but WITHOUT ANY WARRANTY; without even the implied warranty of
!! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!! GNU General Public License for more details.
!!
!! You should have received a copy of the GNU General Public License along
!! with this program; if not, write to the Free Software Foundation, Inc.,
!! 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \author      Kevin Matthes
!> \brief       A possible implementation of Sarrus's Determinant Algorithm.
!> \copyright   (C) 2022 Kevin Matthes.
!>              This file is licensed GPL 2 as of June 1991.
!> \date        2022
!> \file        sarrus.f95
!> \note        See `LICENSE' for full license.
!>              See `README.md' for project details.
!>
!> Sarrus's Determinant Algorithm is used in order to determine the determinant
!> of a 3×3-matrix.  The provided implementations offer support for the two
!> numeric built-in types `INTEGER` and `REAL`.  For both types, there are
!> furthermore linear and 2D implementations due to both of them being valid
!> representations of a matrix.
!>
!> The compilation of this file requires at least Fortran 95 support.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \brief   Calculate the determinant of a 3×3-matrix.
!> \param   f0  The matrix element `a11`.
!> \param   f1  The matrix element `a21`.
!> \param   f2  The matrix element `a31`.
!> \param   f3  The matrix element `a12`.
!> \param   f4  The matrix element `a22`.
!> \param   f5  The matrix element `a32`.
!> \param   f6  The matrix element `a13`.
!> \param   f7  The matrix element `a23`.
!> \param   f8  The matrix element `a33`.
!> \return  The determinant of the given matrix.
!>
!> This implementation handles real matrices which are given by single values
!> instead of being organised in a field.
!>
!> The matrix is assumed to be defined as follows in terms of GNU Octave:  `[ 0
!> 3  6 ; 1  4  7 ; 2  5  8 ]`.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      real function sarrus (f0, f1, f2, f3, f4, f5, f6, f7, f8)

      implicit none

      real  :: f0
      real  :: f1
      real  :: f2
      real  :: f3
      real  :: f4
      real  :: f5
      real  :: f6
      real  :: f7
      real  :: f8

      sarrus    = f0 * f4 * f8 + f3 * f7 * f2 + f6 * f1 * f5                   &
                - f0 * f7 * f5 - f3 * f1 * f8 - f6 * f4 * f2

      end



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \brief   Calculate the determinant of a linear 3×3-matrix.
!> \param   field   The array providing the values.
!> \param   lower   The lower index limit.
!> \param   upper   The upper index limit.
!> \return  The determinant of the given matrix.
!>
!> This implementation takes care about `REAL` matrices which are indexed
!> linearly.
!>
!> The matrix is assumed to be defined as follows in terms of GNU Octave:  `[ 0
!> 3  6 ; 1  4  7 ; 2  5  8 ]`.  Thereby, the given number is considered the
!> offset to be added to `lower`.
!>
!> In case that the given field should not provide nine elements, zero would be
!> returned instead.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      real function sarrus_1d (field, lower, upper)

      implicit none

      integer                           :: lower
      integer                           :: upper
      real                              :: sarrus
      real, dimension (lower : upper)   :: field

      sarrus_1d    = 0

      if (lower + 8 .eq. upper) then
          sarrus_1d = sarrus ( field (lower    )                               &
                             , field (lower + 1)                               &
                             , field (lower + 2)                               &
                             , field (lower + 3)                               &
                             , field (lower + 4)                               &
                             , field (lower + 5)                               &
                             , field (lower + 6)                               &
                             , field (lower + 7)                               &
                             , field (upper    )                               &
                             )
      endif

      end



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \brief   Calculate the determinant of a 2D 3×3-matrix.
!> \param   field   The array providing the values.
!> \param   c_max   The upper index limit (columns).
!> \param   c_min   The lower index limit (columns).
!> \param   r_max   The upper index limit (rows).
!> \param   r_min   The lower index limit (rows).
!> \return  The determinant of the given matrix.
!>
!> This implementation takes care about `REAL` matrices which are indexed as 2D
!> arrays.  Thereby, the first index represents the column whereas the second
!> one stands for the row of the given matrix.
!>
!> In case that the given field should not provide nine elements, zero would be
!> returned instead.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      real function sarrus_2d (field, c_min, c_max, r_min, r_max)

      implicit none

      integer                                           :: c_max
      integer                                           :: c_min
      integer                                           :: r_max
      integer                                           :: r_min
      real                                              :: sarrus
      real, dimension (c_min : c_max, r_min : r_max)    :: field

      sarrus_2d    = 0

      if (c_min + 2 .eq. c_max .and. r_min + 2 .eq. r_max) then
          sarrus_2d = sarrus ( field (c_min    , r_min    )                    &
                             , field (c_min    , r_min + 1)                    &
                             , field (c_min    , r_max    )                    &
                             , field (c_min + 1, r_min    )                    &
                             , field (c_min + 1, r_min + 1)                    &
                             , field (c_min + 1, r_max    )                    &
                             , field (c_max    , r_min    )                    &
                             , field (c_max    , r_min + 1)                    &
                             , field (c_max    , r_max    )                    &
                             )
      endif

      end



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \brief   Calculate the determinant of a 3×3-matrix.
!> \param   f0  The matrix element `a11`.
!> \param   f1  The matrix element `a21`.
!> \param   f2  The matrix element `a31`.
!> \param   f3  The matrix element `a12`.
!> \param   f4  The matrix element `a22`.
!> \param   f5  The matrix element `a32`.
!> \param   f6  The matrix element `a13`.
!> \param   f7  The matrix element `a23`.
!> \param   f8  The matrix element `a33`.
!> \return  The determinant of the given matrix.
!>
!> This implementation handles integer matrices which are given by single
!> values instead of being organised in a field.
!>
!> The matrix is assumed to be defined as follows in terms of GNU Octave:  `[ 0
!> 3  6 ; 1  4  7 ; 2  5  8 ]`.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      integer function sarrus_i (f0, f1, f2, f3, f4, f5, f6, f7, f8)

      implicit none

      integer   :: f0
      integer   :: f1
      integer   :: f2
      integer   :: f3
      integer   :: f4
      integer   :: f5
      integer   :: f6
      integer   :: f7
      integer   :: f8

      sarrus_i  = f0 * f4 * f8 + f3 * f7 * f2 + f6 * f1 * f5                   &
                - f0 * f7 * f5 - f3 * f1 * f8 - f6 * f4 * f2

      end



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \brief   Calculate the determinant of a linear 3×3-matrix.
!> \param   field   The array providing the values.
!> \param   lower   The lower index limit.
!> \param   upper   The upper index limit.
!> \return  The determinant of the given matrix.
!>
!> This implementation takes care about `INTEGER` matrices which are indexed
!> linearly.
!>
!> The matrix is assumed to be defined as follows in terms of GNU Octave:  `[ 0
!> 3  6 ; 1  4  7 ; 2  5  8 ]`.  Thereby, the given number is considered the
!> offset to be added to `lower`.
!>
!> In case that the given field should not provide nine elements, zero would be
!> returned instead.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      integer function sarrus_i1d (field, lower, upper)

      implicit none

      integer                               :: lower
      integer                               :: upper
      integer                               :: sarrus_i
      integer, dimension (lower : upper)    :: field

      sarrus_i1d    = 0

      if (lower + 8 .eq. upper) then
          sarrus_i1d    = sarrus_i ( field (lower    )                         &
                                   , field (lower + 1)                         &
                                   , field (lower + 2)                         &
                                   , field (lower + 3)                         &
                                   , field (lower + 4)                         &
                                   , field (lower + 5)                         &
                                   , field (lower + 6)                         &
                                   , field (lower + 7)                         &
                                   , field (upper    )                         &
                                   )
      endif

      end



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \brief   Calculate the determinant of a 2D 3×3-matrix.
!> \param   field   The array providing the values.
!> \param   c_max   The upper index limit (columns).
!> \param   c_min   The lower index limit (columns).
!> \param   r_max   The upper index limit (rows).
!> \param   r_min   The lower index limit (rows).
!> \return  The determinant of the given matrix.
!>
!> This implementation takes care about `INTEGER` matrices which are indexed as
!> 2D arrays.  Thereby, the first index represents the column whereas the second
!> one stands for the row of the given matrix.
!>
!> In case that the given field should not provide nine elements, zero would be
!> returned instead.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      integer function sarrus_i2d (field, c_min, c_max, r_min, r_max)

      implicit none

      integer                                           :: c_max
      integer                                           :: c_min
      integer                                           :: r_max
      integer                                           :: r_min
      integer                                           :: sarrus_i
      integer, dimension (c_min : c_max, r_min : r_max) :: field

      sarrus_i2d    = 0

      if (c_min + 2 .eq. c_max .and. r_min + 2 .eq. r_max) then
          sarrus_i2d    = sarrus_i ( field (c_min    , r_min    )              &
                                   , field (c_min    , r_min + 1)              &
                                   , field (c_min    , r_max    )              &
                                   , field (c_min + 1, r_min    )              &
                                   , field (c_min + 1, r_min + 1)              &
                                   , field (c_min + 1, r_max    )              &
                                   , field (c_max    , r_min    )              &
                                   , field (c_max    , r_min + 1)              &
                                   , field (c_max    , r_max    )              &
                                   )
      endif

      end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
