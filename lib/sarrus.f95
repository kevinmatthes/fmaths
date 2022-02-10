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
!> \brief   Calculate the determinant of a linear 3×3-matrix.
!> \param   field   The array providing the values.
!> \param   lower   The lower index limit.
!> \param   upper   The upper index limit.
!> \return  The determinant of the given matrix.
!>
!> This implementation takes care about `INTEGER` matrices which are indexed
!> linearly.  The matrix is assumed to be defined as follows in terms of GNU
!> Octave: `[ 0  3  6 ; 1  4  7 ; 2  5  8 ]`.  Thereby, the given number is
!> considered the offset to be added to `lower`.
!>
!> In case that the given field should not provide nine elements, zero would be
!> returned instead.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      integer function sarrus_i1d (field, lower, upper)

      implicit none

      integer   :: lower
      integer   :: upper
      integer, dimension (lower : upper)    :: field

      integer   :: f0
      integer   :: f1
      integer   :: f2
      integer   :: f3
      integer   :: f4
      integer   :: f5
      integer   :: f6
      integer   :: f7
      integer   :: f8

      sarrus_i1d    = 0

      if (lower + 8 .eq. upper) then
          f0    = field (lower)
          f1    = field (lower + 1)
          f2    = field (lower + 2)
          f3    = field (lower + 3)
          f4    = field (lower + 4)
          f5    = field (lower + 5)
          f6    = field (lower + 6)
          f7    = field (lower + 7)
          f8    = field (upper)

          sarrus_i1d    =              f0 * f4 * f8
          sarrus_i1d    = sarrus_i1d + f3 * f7 * f2
          sarrus_i1d    = sarrus_i1d + f6 * f1 * f5
          sarrus_i1d    = sarrus_i1d - f0 * f7 * f5
          sarrus_i1d    = sarrus_i1d - f3 * f1 * f8
          sarrus_i1d    = sarrus_i1d - f6 * f4 * f2
      endif

      end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
