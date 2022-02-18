<!------------------------------------------------------------------------------
--
-- Copyright (C) 2022 Kevin Matthes
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
--
----
--
--  FILE
--      README.md
--
--  BRIEF
--      Important information regarding this project.
--
--  AUTHOR
--      Kevin Matthes
--
--  COPYRIGHT
--      (C) 2022 Kevin Matthes.
--      This file is licensed GPL 2 as of June 1991.
--
--  DATE
--      2022
--
--  NOTE
--      See `LICENSE' for full license.
--
------------------------------------------------------------------------------->

# fmaths

## Summary

A Fortran library for common mathematical functions.

## License

This project's license is **GPL 2** (as of June 1991).  The whole license text
can be found in `LICENSE` in the main directory of this repository.  The brief
version is as follows:

> Copyright (C) 2022 Kevin Matthes
>
> This program is free software; you can redistribute it and/or modify
> it under the terms of the GNU General Public License as published by
> the Free Software Foundation; either version 2 of the License, or
> (at your option) any later version.
>
> This program is distributed in the hope that it will be useful,
> but WITHOUT ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> GNU General Public License for more details.
>
> You should have received a copy of the GNU General Public License along
> with this program; if not, write to the Free Software Foundation, Inc.,
> 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

When compiling a printable version of this documentation using Pandoc, the full
license will be attached automatically to the resulting document.  This can be
invoked by calling `repository-manual.m`.

## Software Requirements

| Requirement       | Type          | Role                                  |
|:------------------|:-------------:|:--------------------------------------|
| `ar`              | application   | create and update static libraries    |
| `docs-snippets`   | repository    | documentation constants               |
| Doxygen           | application   | creation of source code documentation |
| `gfortran`        | application   | compilation of provided source code   |
| GNU Octave        | application   | execution of the provided scripts     |
| `make`            | application   | finalisation of Doxygen documentation |
| Pandoc            | application   | compilation of repository manual      |
| `texlive-full`    | package       | compilation of repository manual      |

The provided source code will be compiled with `gfortran` and bound to the
desired library using `ar`.  The main build routine is organised using GNU
Octave.

Since one might intend to create some manuals for introduction and / or later
reference, there two build instructions which document the repository using
Pandoc and the library, together with the provided tests, using Doxygen.  Since
Doxygen relies on `make` in order to finalise the \LaTeX\ documentation, one
needs to ensure this application, as well.  **This is only required for Linux
machines since Doxygen for Windows will generate a `BAT` file to be executed in
the default Windows terminal.**

The build instructions themselves can be invoked by passing them to GNU Octave
on the command line.  Any build instruction is stored as a GNU Octave script on
its own, denoted by the file extension `*.m`.  Hence, calling them is proceeded
as follows:

```
octave repository-manual.m
```

Once an Octave script from the root directory of this repository is called,
Octave will take care about the rest and will write the current progress to the
terminal.

<!----------------------------------------------------------------------------->
