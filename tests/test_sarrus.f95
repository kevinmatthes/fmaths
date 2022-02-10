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
!> * none
!>
!> Once the tests are done, the number of mismatched expectations will be
!> written to `stdout` and will be set as exit code of the resulting
!> application.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      program test_sarrus

      implicit none

      integer   :: failures
      integer   :: sarrus_i1d
      integer   :: i1d (0 : 8)

      failures  = 0

      i1d (0)   = 0
      i1d (1)   = 0
      i1d (2)   = 0
      i1d (3)   = 0
      i1d (4)   = 0
      i1d (5)   = 0
      i1d (6)   = 0
      i1d (7)   = 0
      i1d (8)   = 0



      ! sarrus_i1d.
      call ensure (sarrus_i1d (i1d, 0, 9) .eq. 0,  failures)
      call ensure (sarrus_i1d (i1d, 0, 8) .eq. 0,  failures)
      call ensure (sarrus_i1d (i1d, 0, 7) .eq. 0,  failures)
      i1d (0)   = 1
      i1d (4)   = 1
      i1d (8)   = 1
      call ensure (sarrus_i1d (i1d, 0, 9) .eq. 0,  failures)
      call ensure (sarrus_i1d (i1d, 0, 8) .eq. 1,  failures)
      call ensure (sarrus_i1d (i1d, 0, 7) .eq. 0,  failures)
      i1d (1)   = 2
      i1d (2)   = 3
      i1d (3)   = 4
      i1d (4)   = 5
      i1d (5)   = 6
      i1d (6)   = 7
      i1d (7)   = 8
      i1d (8)   = 9
      call ensure (sarrus_i1d (i1d, 0, 9) .eq. 0,  failures)
      call ensure (sarrus_i1d (i1d, 0, 8) .eq. 0,  failures)
      call ensure (sarrus_i1d (i1d, 0, 7) .eq. 0,  failures)
      i1d (8)   = 1
      call ensure (sarrus_i1d (i1d, 0, 9) .eq. 0,  failures)
      call ensure (sarrus_i1d (i1d, 0, 8) .eq. 24,  failures)
      call ensure (sarrus_i1d (i1d, 0, 7) .eq. 0,  failures)
      i1d (4)   = 42
      call ensure (sarrus_i1d (i1d, 0, 9) .eq. 0,  failures)
      call ensure (sarrus_i1d (i1d, 0, 8) .eq. -716,  failures)
      call ensure (sarrus_i1d (i1d, 0, 7) .eq. 0,  failures)



      print *, failures, 'sarrus.f95'

      if (failures .ne. 0) then
          call exit (failures)
      endif

      end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
