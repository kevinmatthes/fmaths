%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Copyright (C) 2022 Kevin Matthes
%%
%% This program is free software; you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation; either version 2 of the License, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License along
%% with this program; if not, write to the Free Software Foundation, Inc.,
%% 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
%%
%%%%
%%
%%  FILE
%%      gfortran-95-tests.m
%%
%%  BRIEF
%%      Test the provided Fortran source code using `gfortran`.
%%
%%  AUTHOR
%%      Kevin Matthes
%%
%%  COPYRIGHT
%%      (C) 2022 Kevin Matthes.
%%      This file is licensed GPL 2 as of June 1991.
%%
%%  DATE
%%      2022
%%
%%  NOTE
%%      See `LICENSE' for full license.
%%      See `README.md' for project details.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%
%%
%% Variables.
%%
%%%%

% Software.
software.compiler.self  = ' gfortran ';

software.compiler.flags = ' -Wall -Werror -Wextra -Wpedantic '
software.compiler.flags = [software.compiler.flags ' -std=f95 '];
software.compiler.flags = [software.compiler.flags ' -fall-intrinsics '];

software.compiler.link  = ' ensure.f95 -L../lib/ -lfmaths ';

software.compiler.call  = [software.compiler.self software.compiler.flags];

software.check.self     = ' test ';
software.check.flags    = ' -e ';
software.check.call     = [software.check.self software.check.flags];



% Files.
files.euclid.out    = ' ./test_euclid ';
files.euclid.self   = ' test_euclid.f95 ';
files.self          = ' gfortran-95-tests.m ';



% Control flow.
banner      = ['[' files.self '] '];
failures    = 0;



% Call adjustment.
software.compiler.euclid    = [software.compiler.call files.euclid.self];
software.compiler.euclid    = [software.compiler.call software.compiler.link];
software.compiler.euclid    = [software.compiler.call ' -o '];
software.compiler.euclid    = [software.compiler.call files.euclid.out];



%%%%
%%
%% Build steps.
%%
%%%%

% Begin build instruction.
disp ([banner 'Begin build instruction.']);



% Call Fortran compiler.
disp ([banner 'Compile test suites ...']);

disp (software.compiler.euclid);
system (software.compiler.euclid);

disp ([banner 'Done.']);



% Run tests.
disp ([banner 'Run tests ...']);

failures += system (files.euclid.out);

if ~ failures;
    disp ([banner 'No failures found.']);
else;
    disp ([banner 'Done.']);
end;



% Remove test applications.
fprintf ([banner 'Remove test suites ... ']);

if ~ system ([software.check.call files.euclid.out]);
    delete (file.euclid.out);
end;

disp ('Done.');



% End build instruction.
disp ([banner 'End build instruction.']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
