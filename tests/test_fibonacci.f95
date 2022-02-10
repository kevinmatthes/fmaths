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
!> \brief       Tests for the Fibonacci Numbers.
!> \copyright   (C) 2022 Kevin Matthes.
!>              This file is licensed GPL 2 as of June 1991.
!> \date        2022
!> \file        test_fibonacci.f95
!> \note        See `LICENSE' for full license.
!>              See `README.md' for project details.
!>
!> This file provides a test routine for `fibonacci.f95`.
!>
!> The compilation of this file requires at least Fortran 95 support as well as
!> access to the GNU Fortran Extensions.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \brief   The main function in order to test `fibonacci`.
!> \return  The count of mismatched expectations.
!> \sa      ensure
!> \sa      fibonacci
!> \sa      fibonacci.f95
!>
!> This program will check if `fibonacci` matches the expected return values.
!> These tests include the following cases:
!>
!> * both arguments are zero
!> * one arguments is non-zero
!> * both arguments are non-zero
!> * one arguments is a prime number, the other one is zero
!> * one arguments is a prime number, the other one is non-zero
!> * both arguments are prime numbers
!>
!> Once the tests are done, the number of mismatched expectations will be
!> written to `stdout` and will be set as exit code of the resulting
!> application.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      program test_fibonacci

      implicit none

      integer   :: failures
      integer   :: fibonacci

      failures  = 0



      call ensure (fibonacci (- 4) .eq. 0,  failures)
      call ensure (fibonacci (- 3) .eq. 0,  failures)
      call ensure (fibonacci (- 2) .eq. 0,  failures)
      call ensure (fibonacci (- 1) .eq. 0,  failures)
      call ensure (fibonacci (  0) .eq. 0,  failures)
      call ensure (fibonacci (  1) .eq. 1,  failures)
      call ensure (fibonacci (  2) .eq. 1,  failures)
      call ensure (fibonacci (  3) .eq. 2,  failures)
      call ensure (fibonacci (  4) .eq. 3,  failures)
      call ensure (fibonacci (  5) .eq. 5,  failures)
      call ensure (fibonacci (  6) .eq. 8,  failures)
      call ensure (fibonacci (  7) .eq. 13, failures)
      call ensure (fibonacci (  8) .eq. 21, failures)
      call ensure (fibonacci (  9) .eq. 34, failures)
      call ensure (fibonacci ( 10) .eq. 55, failures)



      print *, failures, 'fibonacci.f95'

      if (failures .ne. 0) then
          call exit (failures)
      endif

      end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
