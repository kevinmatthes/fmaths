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
!> \brief       Tests for Sarrus's Determinant Algorithm.
!> \copyright   (C) 2022 Kevin Matthes.
!>              This file is licensed GPL 2 as of June 1991.
!> \date        2022
!> \file        test_sarrus.f95
!> \note        See `LICENSE' for full license.
!>              See `README.md' for project details.
!>
!> This file provides test routines for `sarrus.f95`.
!>
!> The compilation of this file requires at least Fortran 95 support as well as
!> access to the GNU Fortran Extensions.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \brief   The main function in order to test `sarrus.f95`.
!> \return  The count of mismatched expectations.
!> \sa      ensure
!> \sa      sarrus
!> \sa      sarrus_1d
!> \sa      sarrus_2d
!> \sa      sarrus_i
!> \sa      sarrus_i1d
!> \sa      sarrus_i2d
!> \sa      sarrus.f95
!>
!> This program will check if all implementations match the expected return
!> values.  These tests include the following cases:
!>
!> * nine integer numbers
!> * integer field, 1D, too long
!> * integer field, 1D, too short
!> * integer field, 1D, valid
!> * integer field, 2D, too long
!> * integer field, 2D, too short
!> * integer field, 2D, valid
!> * nine real numbers
!> * real field, 1D, too long
!> * real field, 1D, too short
!> * real field, 1D, valid
!> * real field, 2D, too long
!> * real field, 2D, too short
!> * real field, 2D, valid
!>
!> Once the tests are done, the number of mismatched expectations will be
!> written to `stdout` and will be set as exit code of the resulting
!> application.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      program test_sarrus

      implicit none

      integer                           :: failures
      integer                           :: i
      integer                           :: j
      integer, dimension (0 : 8)        :: i1d
      integer, dimension (0 : 2, 0 : 2) :: i2d
      integer                           :: sarrus_i
      integer                           :: sarrus_i1d
      integer                           :: sarrus_i2d
      real, dimension (0 : 8)           :: r1d
      real, dimension (0 : 2, 0 : 2)    :: r2d
      real                              :: sarrus
      real                              :: sarrus_1d
      real                              :: sarrus_2d
      real                              :: tolerance

      failures  = 0
      tolerance = 0e5

      do 1 i = 0, 8
          i1d (i) = 0
          r1d (i) = 0
    1 continue

      do 2 i = 0, 2
          do 3 j = 0, 2
              i2d (i, j) = 0
              r2d (i, j) = 0
    3     continue
    2 continue

      call ensure (sarrus_i (0,  0, 0, 0,  0, 0, 0, 0, 0) .eq.    0, failures)
      call ensure (sarrus_i (1,  0, 0, 0,  1, 0, 0, 0, 1) .eq.    1, failures)
      call ensure (sarrus_i (1,  2, 3, 4,  5, 6, 7, 8, 9) .eq.    0, failures)
      call ensure (sarrus_i (1,  2, 3, 4,  5, 6, 7, 8, 1) .eq.   24, failures)
      call ensure (sarrus_i (1,  2, 3, 4, 42, 6, 7, 8, 1) .eq. -716, failures)
      call ensure (sarrus_i (1, 23, 3, 4, 42, 6, 7, 8, 1) .eq.   82, failures)

      call ensure (sarrus_i1d (i1d, 0, 9) .eq. 0, failures)

      call ensure (sarrus_i1d (i1d, 0, 7) .eq. 0, failures)

      call ensure (sarrus_i1d (i1d, 0, 8) .eq. 0, failures)
      i1d (0)   = 1
      i1d (4)   = 1
      i1d (8)   = 1
      call ensure (sarrus_i1d (i1d, 0, 8) .eq. 1, failures)
      i1d (1)   = 2
      i1d (2)   = 3
      i1d (3)   = 4
      i1d (4)   = 5
      i1d (5)   = 6
      i1d (6)   = 7
      i1d (7)   = 8
      i1d (8)   = 9
      call ensure (sarrus_i1d (i1d, 0, 8) .eq. 0, failures)
      i1d (8)   = 1
      call ensure (sarrus_i1d (i1d, 0, 8) .eq. 24, failures)
      i1d (4)   = 42
      call ensure (sarrus_i1d (i1d, 0, 8) .eq. -716, failures)
      i1d (1)   = 23
      call ensure (sarrus_i1d (i1d, 0, 8) .eq. 82, failures)

      call ensure (sarrus_i2d (i2d, 0, 2, 0, 3) .eq. 0, failures)
      call ensure (sarrus_i2d (i2d, 0, 3, 0, 2) .eq. 0, failures)
      call ensure (sarrus_i2d (i2d, 0, 3, 0, 3) .eq. 0, failures)

      call ensure (sarrus_i2d (i2d, 0, 1, 0, 1) .eq. 0, failures)
      call ensure (sarrus_i2d (i2d, 0, 1, 0, 2) .eq. 0, failures)
      call ensure (sarrus_i2d (i2d, 0, 2, 0, 1) .eq. 0, failures)

      call ensure (sarrus_i2d (i2d, 0, 2, 0, 2) .eq. 0, failures)
      do 4 i = 0, 2
          i2d (i, i) = 1
    4 continue
      call ensure (sarrus_i2d (i2d, 0, 2, 0, 2) .eq. 1, failures)
      i2d (0, 1)   = 2
      i2d (0, 2)   = 3
      i2d (1, 0)   = 4
      i2d (1, 1)   = 5
      i2d (1, 2)   = 6
      i2d (2, 0)   = 7
      i2d (2, 1)   = 8
      i2d (2, 2)   = 9
      call ensure (sarrus_i2d (i2d, 0, 2, 0, 2) .eq. 0, failures)
      i2d (2, 2)   = 1
      call ensure (sarrus_i2d (i2d, 0, 2, 0, 2) .eq. 24, failures)
      i2d (1, 1)   = 42
      call ensure (sarrus_i2d (i2d, 0, 2, 0, 2) .eq. -716, failures)
      i2d (0, 1)   = 23
      call ensure (sarrus_i2d (i2d, 0, 2, 0, 2) .eq. 82, failures)

      call ensure (abs (sarrus (0,  0, 0, 0,  0, 0, 0, 0, 0)         ) .le. tolerance, failures)
      call ensure (abs (sarrus (1,  0, 0, 0,  1, 0, 0, 0, 1) -     1 ) .le. tolerance, failures)
      call ensure (abs (sarrus (1,  2, 3, 4,  5, 6, 7, 8, 9)         ) .le. tolerance, failures)
      call ensure (abs (sarrus (1,  2, 3, 4,  5, 6, 7, 8, 1) -    24 ) .le. tolerance, failures)
      call ensure (abs (sarrus (1,  2, 3, 4, 42, 6, 7, 8, 1) - (-716)) .le. tolerance, failures)
      call ensure (abs (sarrus (1, 23, 3, 4, 42, 6, 7, 8, 1) -    82 ) .le. tolerance, failures)

      call ensure (abs (sarrus_1d (r1d, 0, 9)) .le. tolerance, failures)

      call ensure (abs (sarrus_1d (r1d, 0, 7)) .le. tolerance, failures)

      call ensure (abs (sarrus_1d (r1d, 0, 8)) .le. tolerance, failures)
      r1d (0)   = 1
      r1d (4)   = 1
      r1d (8)   = 1
      call ensure (abs (sarrus_1d (r1d, 0, 8) - 1) .le. tolerance, failures)
      r1d (1)   = 2
      r1d (2)   = 3
      r1d (3)   = 4
      r1d (4)   = 5
      r1d (5)   = 6
      r1d (6)   = 7
      r1d (7)   = 8
      r1d (8)   = 9
      call ensure (abs (sarrus_1d (r1d, 0, 8)) .le. tolerance, failures)
      r1d (8)   = 1
      call ensure (abs (sarrus_1d (r1d, 0, 8) - 24) .le. tolerance, failures)
      r1d (4)   = 42
      call ensure (abs (sarrus_1d (r1d, 0, 8) - (-716)) .le. tolerance, failures)
      r1d (1)   = 23
      call ensure (abs (sarrus_1d (r1d, 0, 8) - 82) .le. tolerance, failures)

      call ensure (abs (sarrus_2d (r2d, 0, 2, 0, 3)) .le. tolerance, failures)
      call ensure (abs (sarrus_2d (r2d, 0, 3, 0, 2)) .le. tolerance, failures)
      call ensure (abs (sarrus_2d (r2d, 0, 3, 0, 3)) .le. tolerance, failures)

      call ensure (abs (sarrus_2d (r2d, 0, 1, 0, 1)) .le. tolerance, failures)
      call ensure (abs (sarrus_2d (r2d, 0, 1, 0, 2)) .le. tolerance, failures)
      call ensure (abs (sarrus_2d (r2d, 0, 2, 0, 1)) .le. tolerance, failures)

      call ensure (abs (sarrus_2d (r2d, 0, 2, 0, 2)) .le. tolerance, failures)
      do 5 i = 0, 2
          r2d (i, i) = 1
    5 continue
      call ensure (sarrus_i2d (i2d, 0, 2, 0, 2) .eq. 1, failures)
      r2d (0, 1)   = 2
      r2d (0, 2)   = 3
      r2d (1, 0)   = 4
      r2d (1, 1)   = 5
      r2d (1, 2)   = 6
      r2d (2, 0)   = 7
      r2d (2, 1)   = 8
      r2d (2, 2)   = 9
      call ensure (abs (sarrus_2d (r2d, 0, 2, 0, 2)) .le. tolerance, failures)
      r2d (2, 2)   = 1
      call ensure (abs (sarrus_2d (r2d, 0, 2, 0, 2) - 24) .le. tolerance, failures)
      r2d (1, 1)   = 42
      call ensure (abs (sarrus_2d (r2d, 0, 2, 0, 2) - (-716)) .le. tolerance, failures)
      r2d (0, 1)   = 23
      call ensure (abs (sarrus_2d (r2d, 0, 2, 0, 2) - 82) .le. tolerance, failures)

      print *, failures, 'sarrus.f95'

      if (failures .ne. 0) then
          call exit (failures)
      endif

      end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
