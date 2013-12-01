#   CMake-script for SHOGUN Machine Learning Toolbox
#   Copyright (C) 2013  Björn Esser  <besser82@fedoraproject.org>
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.

#####  Define Shogun's object-targets  #####
SET( ${PROJECT_VAR_PREFIX}OBJECT_TARGETS "" )


#####  Define Shogun's C[XX]FLAGS  #####
SET( ${PROJECT_VAR_PREFIX}CFLAGS "-std=c++11 -Wall -Wno-unused-parameter -Wformat" )
SET( ${PROJECT_VAR_PREFIX}CFLAGS "${${PROJECT_VAR_PREFIX}CFLAGS} -Wformat-security -Wparentheses" )
SET( ${PROJECT_VAR_PREFIX}CFLAGS "${${PROJECT_VAR_PREFIX}CFLAGS} -Wshadow -Wno-unknown-pragmas" )
SET( ${PROJECT_VAR_PREFIX}CFLAGS "${${PROJECT_VAR_PREFIX}CFLAGS} -Wno-deprecated -fexpensive-optimizations" )
SET( ${PROJECT_VAR_PREFIX}CFLAGS "${${PROJECT_VAR_PREFIX}CFLAGS} -frerun-cse-after-loop -fcse-follow-jumps" )
SET( ${PROJECT_VAR_PREFIX}CFLAGS "${${PROJECT_VAR_PREFIX}CFLAGS} -finline-functions -fschedule-insns2" )
SET( ${PROJECT_VAR_PREFIX}CFLAGS "${${PROJECT_VAR_PREFIX}CFLAGS} -fthread-jumps -fforce-addr" )
SET( ${PROJECT_VAR_PREFIX}CFLAGS "${${PROJECT_VAR_PREFIX}CFLAGS} -fstrength-reduce -funroll-loops" )
SET( ${PROJECT_VAR_PREFIX}CXXFLAGS "${${PROJECT_VAR_PREFIX}CFLAGS}" )


#####  Define Shogun's LDFLAGS  #####
SET( SHOGUN_LDFLAGS "" )


#####  Define Shogun's include-dirs  #####
SET( SHOGUN_INCLUDE_DIRS "" )