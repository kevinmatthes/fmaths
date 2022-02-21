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
!> \brief       Tests for the Somayaji Series.
!> \copyright   (C) 2022 Kevin Matthes.
!>              This file is licensed GPL 2 as of June 1991.
!> \date        2022
!> \file        test_jones.f95
!> \note        See `LICENSE' for full license.
!>              See `README.md' for project details.
!>
!> This file provides a test routine for `somayaji.f95`.
!>
!> The compilation of this file requires at least Fortran 95 support as well as
!> access to the GNU Fortran Extensions.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \brief   The main function in order to test `somayaji`.
!> \return  The count of mismatched expectations.
!> \sa      ensure
!> \sa      somayaji
!> \sa      somayaji.f95
!>
!> This program will check if `somayaji` matches the expected return values.
!> These tests include the following cases:
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

      program test_somayaji

      implicit none

      integer   :: failures
      integer   :: i
      real      :: somayaji
      real      :: pi

      failures  = 0
      pi        = 4. * atan (1.)

      call ensure (     somayaji (-  1)       .le.  1.0e-15, failures)
      call ensure (     somayaji (   0)       .le.  1.0e-15, failures)
      call ensure (abs (somayaji (   1) - pi) .le.  3.0e-02, failures)
      call ensure (abs (somayaji (   2) - pi) .le.  8.5e-03, failures)
      call ensure (abs (somayaji (   3) - pi) .le.  4.0e-03, failures)
      call ensure (abs (somayaji (   4) - pi) .le.  2.0e-03, failures)
      call ensure (abs (somayaji (   5) - pi) .le.  1.5e-03, failures)
      call ensure (abs (somayaji (   6) - pi) .le.  7.5e-04, failures)
      call ensure (abs (somayaji (   7) - pi) .le.  5.0e-04, failures)
      call ensure (abs (somayaji (   8) - pi) .le.  3.5e-04, failures)
      call ensure (abs (somayaji (   9) - pi) .le.  2.5e-04, failures)
      call ensure (abs (somayaji (  10) - pi) .le.  2.0e-04, failures)
      call ensure (abs (somayaji (  11) - pi) .le.  1.5e-04, failures)
      call ensure (abs (somayaji (  12) - pi) .le.  1.5e-04, failures)
      call ensure (abs (somayaji (  13) - pi) .le.  9.5e-05, failures)
      call ensure (abs (somayaji (  14) - pi) .le.  7.5e-05, failures)
      call ensure (abs (somayaji (  15) - pi) .le.  6.5e-05, failures)
      call ensure (abs (somayaji (  16) - pi) .le.  5.5e-05, failures)
      call ensure (abs (somayaji (  17) - pi) .le.  4.5e-05, failures)
      call ensure (abs (somayaji (  18) - pi) .le.  4.0e-05, failures)
      call ensure (abs (somayaji (  19) - pi) .le.  3.5e-05, failures)
      call ensure (abs (somayaji (  20) - pi) .le.  3.0e-05, failures)
      call ensure (abs (somayaji (  21) - pi) .le.  2.5e-05, failures)
      call ensure (abs (somayaji (  22) - pi) .le.  2.5e-05, failures)
      call ensure (abs (somayaji (  23) - pi) .le.  2.0e-05, failures)
      call ensure (abs (somayaji (  24) - pi) .le.  2.0e-05, failures)
      call ensure (abs (somayaji (  25) - pi) .le.  1.5e-05, failures)
      call ensure (abs (somayaji (  26) - pi) .le.  1.5e-05, failures)
      call ensure (abs (somayaji (  27) - pi) .le.  1.5e-05, failures)
      call ensure (abs (somayaji (  28) - pi) .le.  1.5e-05, failures)
      call ensure (abs (somayaji (  29) - pi) .le. 10.0e-06, failures)
      call ensure (abs (somayaji (  30) - pi) .le.  8.5e-06, failures)
      call ensure (abs (somayaji (  31) - pi) .le.  8.0e-06, failures)
      call ensure (abs (somayaji (  32) - pi) .le.  7.0e-06, failures)
      call ensure (abs (somayaji (  33) - pi) .le.  7.0e-06, failures)
      call ensure (abs (somayaji (  34) - pi) .le.  5.5e-06, failures)
      call ensure (abs (somayaji (  35) - pi) .le.  6.0e-06, failures)
      call ensure (abs (somayaji (  36) - pi) .le.  5.0e-06, failures)
      call ensure (abs (somayaji (  37) - pi) .le.  5.5e-06, failures)
      call ensure (abs (somayaji (  38) - pi) .le.  4.0e-06, failures)
      call ensure (abs (somayaji (  39) - pi) .le.  4.5e-06, failures)
      call ensure (abs (somayaji (  40) - pi) .le.  3.5e-06, failures)
      call ensure (abs (somayaji (  41) - pi) .le.  4.0e-06, failures)
      call ensure (abs (somayaji (  42) - pi) .le.  3.0e-06, failures)
      call ensure (abs (somayaji (  43) - pi) .le.  3.5e-06, failures)
      call ensure (abs (somayaji (  44) - pi) .le.  3.0e-06, failures)
      call ensure (abs (somayaji (  45) - pi) .le.  3.0e-06, failures)
      call ensure (abs (somayaji (  46) - pi) .le.  2.5e-06, failures)
      call ensure (abs (somayaji (  47) - pi) .le.  2.5e-06, failures)
      call ensure (abs (somayaji (  48) - pi) .le.  2.0e-06, failures)
      call ensure (abs (somayaji (  49) - pi) .le.  2.5e-06, failures)
      call ensure (abs (somayaji (  50) - pi) .le.  2.0e-06, failures)
      call ensure (abs (somayaji (  51) - pi) .le.  2.0e-06, failures)
      call ensure (abs (somayaji (  52) - pi) .le.  1.5e-06, failures)
      call ensure (abs (somayaji (  53) - pi) .le.  2.0e-06, failures)
      call ensure (abs (somayaji (  54) - pi) .le.  1.5e-06, failures)
      call ensure (abs (somayaji (  55) - pi) .le.  2.0e-06, failures)
      call ensure (abs (somayaji (  56) - pi) .le.  1.5e-06, failures)
      call ensure (abs (somayaji (  57) - pi) .le.  1.5e-06, failures)
      call ensure (abs (somayaji (  58) - pi) .le. 10.0e-07, failures)
      call ensure (abs (somayaji (  59) - pi) .le.  1.5e-06, failures)
      call ensure (abs (somayaji (  60) - pi) .le.  7.5e-07, failures)
      call ensure (abs (somayaji (  61) - pi) .le.  1.5e-06, failures)
      call ensure (abs (somayaji (  62) - pi) .le.  7.5e-07, failures)
      call ensure (abs (somayaji (  63) - pi) .le.  1.5e-06, failures)
      call ensure (abs (somayaji (  64) - pi) .le.  7.5e-07, failures)
      call ensure (abs (somayaji (  65) - pi) .le. 10.0e-07, failures)
      call ensure (abs (somayaji (  66) - pi) .le.  7.5e-07, failures)
      call ensure (abs (somayaji (  67) - pi) .le. 10.0e-07, failures)
      call ensure (abs (somayaji (  68) - pi) .le.  7.5e-07, failures)
      call ensure (abs (somayaji (  69) - pi) .le.  7.5e-07, failures)
      call ensure (abs (somayaji (  70) - pi) .le.  7.5e-07, failures)
      call ensure (abs (somayaji (  71) - pi) .le.  7.5e-07, failures)
      call ensure (abs (somayaji (  72) - pi) .le.  7.5e-07, failures)
      call ensure (abs (somayaji (  73) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji (  74) - pi) .le.  7.5e-07, failures)
      call ensure (abs (somayaji (  75) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji (  76) - pi) .le.  7.5e-07, failures)
      call ensure (abs (somayaji (  77) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji (  78) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji (  79) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji (  80) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji (  81) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji (  82) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji (  83) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji (  84) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji (  85) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji (  86) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji (  87) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji (  88) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji (  89) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji (  90) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji (  91) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji (  92) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji (  93) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji (  94) - pi) .le.  1.0e-15, failures)
      call ensure (abs (somayaji (  95) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji (  96) - pi) .le.  1.0e-15, failures)
      call ensure (abs (somayaji (  97) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji (  98) - pi) .le.  1.0e-15, failures)
      call ensure (abs (somayaji (  99) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 100) - pi) .le.  1.0e-15, failures)
      call ensure (abs (somayaji ( 101) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 102) - pi) .le.  1.0e-15, failures)
      call ensure (abs (somayaji ( 103) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 104) - pi) .le.  1.0e-15, failures)
      call ensure (abs (somayaji ( 105) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 106) - pi) .le.  1.0e-15, failures)
      call ensure (abs (somayaji ( 107) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 108) - pi) .le.  1.0e-15, failures)
      call ensure (abs (somayaji ( 109) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 110) - pi) .le.  1.0e-15, failures)
      call ensure (abs (somayaji ( 111) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 112) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 113) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 114) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 115) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 116) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 117) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 118) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 119) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 120) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 121) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 122) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 123) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 124) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 125) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 126) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 127) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 128) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 129) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 130) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 131) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 132) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 133) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 134) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 135) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 136) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 137) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 138) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 139) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 140) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 141) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 142) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 143) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 144) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 145) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 146) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 147) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 148) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 149) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 150) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 151) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 152) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 153) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 154) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 155) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 156) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 157) - pi) .le.  5.0e-07, failures)
      call ensure (abs (somayaji ( 158) - pi) .le.  2.5e-07, failures)
      call ensure (abs (somayaji ( 159) - pi) .le.  5.0e-07, failures)

      do 1 i = 160, 1000
          call ensure (abs (somayaji (i) - pi) .le. 2.5e-07, failures)
    1 continue

      print *, failures, 'somayaji.f95'

      if (failures .ne. 0) then
          call exit (failures)
      endif

      end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
