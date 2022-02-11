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
!> \sa      sarrus_i1d
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

      failures  = 0

      do 1 i = 0, 8
          i1d (i) = 0
    1 continue

      do 2 i = 0, 2
          do 3 j = 0, 2
              i2d (i, j) = 0
    3     continue
    2 continue

      call ensure (sarrus_i (0, 0, 0, 0,  0, 0, 0, 0, 0) .eq.    0, failures)
      call ensure (sarrus_i (1, 0, 0, 0,  1, 0, 0, 0, 1) .eq.    1, failures)
      call ensure (sarrus_i (1, 2, 3, 4,  5, 6, 7, 8, 9) .eq.    0, failures)
      call ensure (sarrus_i (1, 2, 3, 4,  5, 6, 7, 8, 1) .eq.   24, failures)
      call ensure (sarrus_i (1, 2, 3, 4, 42, 6, 7, 8, 1) .eq. -716, failures)

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

      print *, failures, 'sarrus.f95'

      if (failures .ne. 0) then
          call exit (failures)
      endif

      end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
