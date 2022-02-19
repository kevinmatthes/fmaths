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
!> \brief       A possible implementation of the Jones Series.
!> \copyright   (C) 2022 Kevin Matthes.
!>              This file is licensed GPL 2 as of June 1991.
!> \date        2022
!> \file        jones.f95
!> \note        See `LICENSE' for full license.
!>              See `README.md' for project details.
!>
!> This file provides an implementation of the Jones Series, a possibility to
!> calculate the value of Pi.
!>
!> The compilation of this file requires at least Fortran 95 support.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \brief   Calculate the value of Pi.
!> \param   n   The number of iterations.
!> \return  An approximation of Pi.
!>
!> This function implements the Pi Series introduced by William Jones.  It
!> returns a reasonable approximation of Pi after just 6 iterations.  The least
!> difference from the most exact value, `4. * atan (1.)`, is lower than 2.5e-7
!> and will not become smaller with more than 6 iterations.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      real function jones (n)

      implicit none

      integer   :: i
      integer   :: n
      real      :: const
      real      :: nine
      real      :: number

      jones = 0

      if (n .gt. 0) then
          const = 2. * sqrt (3.)
          jones = jones + const
          nine  = 1

          do 1 i = 1, n
              nine      = nine * 9.
              number    = i * 4.

              jones = jones + (1. / (number + 1.)) * (     const / nine)       &
                            - (1. / (number - 1.)) * (3. * const / nine)
    1     continue
      endif

      end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
