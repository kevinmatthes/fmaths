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
compiler.self   = ' gfortran ';
compiler.flags  = ' -Wall -Werror -Wextra -Wpedantic ';
compiler.flags  = [compiler.flags ' -std=f95 '];
compiler.flags  = [compiler.flags ' -fall-intrinsics '];
compiler.link   = ' ensure.f95 -L../lib/ -lfmaths ';
compiler.call   = [compiler.self compiler.flags];



% Files.
files.euclid.out    = './test_euclid';
files.euclid.self   = ' test_euclid.f95 ';

files.jones.out     = './test_jones';
files.jones.self    = ' test_jones.f95 ';

files.fibonacci.out     = './test_fibonacci';
files.fibonacci.self    = ' test_fibonacci.f95 ';

files.sarrus.out    = './test_sarrus';
files.sarrus.self   = ' test_sarrus.f95 ';

files.self  = ' gfortran-95-tests.m ';

files.somayaji.out  = './test_somayaji';
files.somayaji.self = ' test_somayaji.f95 ';



% Control flow.
banner      = ['[' files.self '] '];
failures    = 0;



% Call adjustment.
compiler.euclid    = [compiler.call files.euclid.self];
compiler.euclid    = [compiler.euclid compiler.link];
compiler.euclid    = [compiler.euclid ' -o '];
compiler.euclid    = [compiler.euclid files.euclid.out];

compiler.jones  = [compiler.call files.jones.self];
compiler.jones  = [compiler.jones compiler.link];
compiler.jones  = [compiler.jones ' -o '];
compiler.jones  = [compiler.jones files.jones.out];

compiler.fibonacci = [compiler.call files.fibonacci.self];
compiler.fibonacci = [compiler.fibonacci compiler.link];
compiler.fibonacci = [compiler.fibonacci ' -o '];
compiler.fibonacci = [compiler.fibonacci files.fibonacci.out];

compiler.sarrus = [compiler.call files.sarrus.self];
compiler.sarrus = [compiler.sarrus compiler.link];
compiler.sarrus = [compiler.sarrus ' -o '];
compiler.sarrus = [compiler.sarrus files.sarrus.out];

compiler.somayaji   = [compiler.call files.somayaji.self];
compiler.somayaji   = [compiler.somayaji compiler.link];
compiler.somayaji   = [compiler.somayaji ' -o '];
compiler.somayaji   = [compiler.somayaji files.somayaji.out];



%%%%
%%
%% Build steps.
%%
%%%%

% Begin build instruction.
disp ([banner 'Begin build instruction.']);



% Call Fortran compiler.
disp ([banner 'Compile test suites ...']);

disp (compiler.euclid);
system (compiler.euclid);

disp (compiler.jones);
system (compiler.jones);

disp (compiler.fibonacci);
system (compiler.fibonacci);

disp (compiler.sarrus);
system (compiler.sarrus);

disp (compiler.somayaji);
system (compiler.somayaji);

disp ([banner 'Done.']);



% Run tests.
disp ([banner 'Run tests ...']);

failures += system (files.euclid.out);
failures += system (files.jones.out);
failures += system (files.fibonacci.out);
failures += system (files.sarrus.out);
failures += system (files.somayaji.out);

if ~ failures;
    disp ([banner 'No failures found.']);
else;
    disp ([banner 'Done.']);
end;



% Remove test applications.
fprintf ([banner 'Remove test suites ... ']);

if length (glob (files.euclid.out));
    delete (files.euclid.out);
end;

if length (glob (files.jones.out));
    delete (files.jones.out);
end;

if length (glob (files.fibonacci.out));
    delete (files.fibonacci.out);
end;

if length (glob (files.sarrus.out));
    delete (files.sarrus.out);
end;

if length (glob (files.somayaji.out));
    delete (files.somayaji.out);
end;

disp ('Done.');



% End build instruction.
disp ([banner 'End build instruction.']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
