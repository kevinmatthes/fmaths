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
!> \sa          euclid
!>
!> This file provides a test routine for `euclid.f95`.
!>
!> The compilation of this file requires at least Fortran 95 support as well as
!> access to the GNU Fortran Extensions.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      program test_euclid

      implicit none

      integer   :: euclid
      integer   :: failures

      failures  = 0

      if (euclid (42, 23) .ne. 1) then
          failures  = failures + 1
      endif

      if (euclid (42, -23) .ne. 1) then
          failures  = failures + 1
      endif

      if (euclid (-42, 23) .ne. 1) then
          failures  = failures + 1
      endif

      if (euclid (-42, -23) .ne. 1) then
          failures  = failures + 1
      endif

      call exit (failures)

      end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
