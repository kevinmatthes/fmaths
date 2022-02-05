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
!> \brief       A simple test utility.
!> \copyright   (C) 2022 Kevin Matthes.
!>              This file is licensed GPL 2 as of June 1991.
!> \date        2022
!> \file        ensure.f95
!> \note        See `LICENSE' for full license.
!>              See `README.md' for project details.
!>
!> Numerous tests require the check of an expression for equality with a certain
!> expectation as well as the reporting of the test result.  In its simplest
!> form, such a function which shall "ensure" a certain condition will cause
!> many lines of redundant code.
!>
!> The aim of this subroutine is it therefore to provide such a simple condition
!> check centrally.
!>
!> The compilation of this file requires at least Fortran 95 support.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \brief   Ensure a logical condition to be fulfilled.
!> \param   expression  The expression to ensure.
!> \param   return      The test result.
!>
!> This subroutine will check if a given expression will evaluate to `.true.`.
!> Only in case that the given expression is false, `return` will be incremented
!> by one.  Otherwise, `return` will remain unchanged.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      subroutine ensure (expression, return)

      implicit none

      integer, intent (out) :: return
      logical, intent (in)  :: expression

      if (.not. expression) then
          return = return + 1
      endif

      end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
