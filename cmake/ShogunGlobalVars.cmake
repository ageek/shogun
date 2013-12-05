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
SET( ${PROJECT_VAR_PREFIX}OBJECT_TARGETS CACHE INTERNAL
  "Tracking-var for object targets" FORCE )
SET( ${PROJECT_VAR_PREFIX}PROTOBUF_TARGETS CACHE INTERNAL
  "Tracking-var for protobuf targets" FORCE )


#####  Define Shogun's internal object-targets  #####
SET( ${PROJECT_VAR_PREFIX}OBJECT_TARGETS_INTERNAL CACHE INTERNAL
  "Tracking-var for internal object targets" FORCE )


#####  Define Shogun's C[XX]FLAGS  #####

#####  These control the warning-verbosity of the compiler
SET( ${PROJECT_VAR_PREFIX}CFLAGS
  "-Wall -Wextra -Wformat-security -Wshadow" )


#####  These control the code-optimization
SET( ${PROJECT_VAR_PREFIX}CFLAGS
  "${${PROJECT_VAR_PREFIX}CFLAGS} -fstrength-reduce" )


#####  This is sets the C++-std to be used
SET( ${PROJECT_VAR_PREFIX}CXXFLAGS
  "-std=c++11 ${${PROJECT_VAR_PREFIX}CFLAGS}" )


#####  Define Shogun's LDFLAGS  #####
SET( ${PROJECT_VAR_PREFIX}_LDFLAGS "" )


#####  Define Shogun's SWIG table types  #####
SET( ${PROJECT_VAR_PREFIX}_SWIG_TYPE_TABLE "shogun;SHOGUN" )


#####  Define Shogun's include-dirs  #####
SET( ${PROJECT_VAR_PREFIX}_INCLUDE_DIRS "" CACHE INTERNAL
  "Internal include directories" FORCE )