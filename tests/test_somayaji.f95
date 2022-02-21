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
!> \brief       Tests for the Jones Series.
!> \copyright   (C) 2022 Kevin Matthes.
!>              This file is licensed GPL 2 as of June 1991.
!> \date        2022
!> \file        test_jones.f95
!> \note        See `LICENSE' for full license.
!>              See `README.md' for project details.
!>
!> This file provides a test routine for `jones.f95`.
!>
!> The compilation of this file requires at least Fortran 95 support as well as
!> access to the GNU Fortran Extensions.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \brief   The main function in order to test `jones`.
!> \return  The count of mismatched expectations.
!> \sa      ensure
!> \sa      jones
!> \sa      jones.f95
!>
!> This program will check if `jones` matches the expected return values.  These
!> tests include the following cases:
!>
!> * argument < 0
!> * argument = 0
!> * argument > 0
!>
!> Once the tests are done, the number of mismatched expectations will be
!> written to `stdout` and will be set as exit code of the resulting
!> application.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      program test_jones

      implicit none

      integer   :: failures
      integer   :: i
      real      :: jones
      real      :: pi

      failures  = 0
      pi        = 4. * atan (1.)

      call ensure (     jones (-1)       .le. 1.0e-15, failures)
      call ensure (     jones ( 0)       .le. 1.0e-15, failures)
      call ensure (abs (jones ( 1) - pi) .le. 1.5e-02, failures)
      call ensure (abs (jones ( 2) - pi) .le. 1.5e-03, failures)
      call ensure (abs (jones ( 3) - pi) .le. 8.5e-05, failures)
      call ensure (abs (jones ( 4) - pi) .le. 7.0e-06, failures)
      call ensure (abs (jones ( 5) - pi) .le. 5.0e-07, failures)
      do 1 i = 6, 100
          call ensure (abs (jones ( i) - pi) .le. 2.5e-07, failures)
    1 continue

      print *, failures, 'jones.f95'

      if (failures .ne. 0) then
          call exit (failures)
      endif

      end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
