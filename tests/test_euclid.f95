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
!> \brief       Tests for the Euclidean Algorithm.
!> \copyright   (C) 2022 Kevin Matthes.
!>              This file is licensed GPL 2 as of June 1991.
!> \date        2022
!> \file        test_euclid.f95
!> \note        See `LICENSE' for full license.
!>              See `README.md' for project details.
!>
!> This file provides a test routine for `euclid.f95`.
!>
!> The compilation of this file requires at least Fortran 95 support as well as
!> access to the GNU Fortran Extensions.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \brief   The main function in order to test `euclid`.
!> \return  The count of mismatched expectations.
!> \sa      ensure
!> \sa      euclid
!> \sa      euclid.f95
!>
!> This program will check if `euclid` matches the expected return values.
!> These tests include the following cases:
!>
!> * both arguments are zero
!> * one argument is non-zero
!> * both arguments are non-zero
!> * one argument is a prime number, the other one is zero
!> * one argument is a prime number, the other one is non-zero
!> * both arguments are prime numbers
!>
!> Once the tests are done, the number of mismatched expectations will be
!> written to `stdout` and will be set as exit code of the resulting
!> application.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      program test_euclid

      implicit none

      integer   :: euclid
      integer   :: failures

      failures  = 0



      ! 0 prime number(s): both arguments zero.
      call ensure (euclid ( 0,  0) .eq. 0, failures)
      call ensure (euclid ( 0, -0) .eq. 0, failures)
      call ensure (euclid (-0,  0) .eq. 0, failures)
      call ensure (euclid (-0, -0) .eq. 0, failures)

      ! 0 prime number(s): one argument non-zero.
      call ensure (euclid ( 0,  4) .eq. 4, failures)
      call ensure (euclid ( 0, -4) .eq. 4, failures)
      call ensure (euclid (-0,  4) .eq. 4, failures)
      call ensure (euclid (-0, -4) .eq. 4, failures)
      call ensure (euclid ( 4,  0) .eq. 4, failures)
      call ensure (euclid ( 4, -0) .eq. 4, failures)
      call ensure (euclid (-4,  0) .eq. 4, failures)
      call ensure (euclid (-4, -0) .eq. 4, failures)

      ! 0 prime number(s): both arguments non-zero.
      call ensure (euclid (  4,  18) .eq. 2, failures)
      call ensure (euclid (  4, -18) .eq. 2, failures)
      call ensure (euclid (- 4,  18) .eq. 2, failures)
      call ensure (euclid (- 4, -18) .eq. 2, failures)
      call ensure (euclid ( 18,   4) .eq. 2, failures)
      call ensure (euclid ( 18, - 4) .eq. 2, failures)
      call ensure (euclid (-18,   4) .eq. 2, failures)
      call ensure (euclid (-18, - 4) .eq. 2, failures)

      ! 1 prime number(s): both arguments non-zero.
      call ensure (euclid ( 23,  42) .eq. 1, failures)
      call ensure (euclid ( 23, -42) .eq. 1, failures)
      call ensure (euclid (-23,  42) .eq. 1, failures)
      call ensure (euclid (-23, -42) .eq. 1, failures)
      call ensure (euclid ( 42,  23) .eq. 1, failures)
      call ensure (euclid ( 42, -23) .eq. 1, failures)
      call ensure (euclid (-42,  23) .eq. 1, failures)
      call ensure (euclid (-42, -23) .eq. 1, failures)

      ! 1 prime number(s): one argument zero.
      call ensure (euclid ( 0,  2) .eq. 2, failures)
      call ensure (euclid ( 0, -2) .eq. 2, failures)
      call ensure (euclid (-0,  2) .eq. 2, failures)
      call ensure (euclid (-0, -2) .eq. 2, failures)
      call ensure (euclid ( 2,  0) .eq. 2, failures)
      call ensure (euclid ( 2, -0) .eq. 2, failures)
      call ensure (euclid (-2,  0) .eq. 2, failures)
      call ensure (euclid (-2, -0) .eq. 2, failures)

      ! 2 prime number(s).
      call ensure (euclid ( 23,  53) .eq. 1, failures)
      call ensure (euclid ( 23, -53) .eq. 1, failures)
      call ensure (euclid (-23,  53) .eq. 1, failures)
      call ensure (euclid (-23, -53) .eq. 1, failures)
      call ensure (euclid ( 53,  23) .eq. 1, failures)
      call ensure (euclid ( 53, -23) .eq. 1, failures)
      call ensure (euclid (-53,  23) .eq. 1, failures)
      call ensure (euclid (-53, -23) .eq. 1, failures)



      print *, failures, 'euclid.f95'

      if (failures .ne. 0) then
          call exit (failures)
      endif

      end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
