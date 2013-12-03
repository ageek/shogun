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


#####  Add current dir to Shogun's include-dirs  #####
SET( ${PROJECT_VAR_PREFIX}INCLUDE_DIRS
     ${${PROJECT_VAR_PREFIX}INCLUDE_DIRS}
     "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_BINARY_DIR}"
     CACHE INTERNAL "Internal include directories" )


#####  Include subdirs for processing  #####
GET_CMAKE_SUBDIRS( _SUBDIRS ${CMAKE_CURRENT_SOURCE_DIR} )

FOREACH( _SUBDIR ${_SUBDIRS} )
  ADD_SUBDIRECTORY( ${_SUBDIR} )
ENDFOREACH( _SUBDIR ${_SUBDIRS} )


#####  Add shogun and shogun-static libs  #####
ADD_LIBRARY( ${PROJECT_NAME} SHARED
  ${${PROJECT_VAR_PREFIX}OBJECT_TARGETS} )

ADD_LIBRARY( ${PROJECT_NAME}-static STATIC
  ${${PROJECT_VAR_PREFIX}OBJECT_TARGETS} )
SET_TARGET_PROPERTIES( ${PROJECT_NAME}-static
  PROPERTIES OUTPUT_NAME ${PROJECT_NAME} )