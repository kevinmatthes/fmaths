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
!> \brief       A possible implementation of the Euclidean Algorithm.
!> \copyright   (C) 2022 Kevin Matthes.
!>              This file is licensed GPL 2 as of June 1991.
!> \date        2022
!> \file        euclid.f95
!> \note        See `LICENSE' for full license.
!>              See `README.md' for project details.
!>
!> This file provides an implementation of the Euclidean Algorithm.  It works
!> fine with both positive and negative integers and does not care about their
!> order when passed to the function.
!>
!> The compilation of this file requires at least Fortran 95 support.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \brief   Calculate the Greatest Common Divisor of two given integers.
!> \param   a   One of the integers to process.
!> \param   b   One of the integers to process.
!> \return  The Greatest Common Divisor of the given integers.
!>
!> This implementation works fine with both positive and negative integers and
!> does not care about the actual order they were passed to the function.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      integer function euclid (a, b)
      integer   :: a
      integer   :: b
      integer   :: greater
      integer   :: lesser
      integer   :: remainder

      greater   = max (abs (a), abs (b))
      lesser    = min (abs (a), abs (b))

      if      (greater .eq. 0 .and. lesser .eq. 0) then
          euclid    = 2 ** 31 - 1
      else if (greater .eq. 0) then
          euclid    = lesser
      else if (lesser  .eq. 0) then
          euclid    = greater
      else
    1     continue

          if (lesser .eq. 0) then
              goto 2
          else
              remainder = mod (greater, lesser)
              greater   = lesser
              lesser    = remainder
              goto 1
          endif
          
    2     continue

          euclid = greater
      endif

      end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
