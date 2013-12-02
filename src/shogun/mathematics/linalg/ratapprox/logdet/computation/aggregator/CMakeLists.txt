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


#####  Generate auto-sources  #####
#FILE( GLOB _AUTOSOURCES )


#####  Set needed include directories  #####
INCLUDE_DIRECTORIES( ${${PROJECT_VAR_PREFIX}INCLUDE_DIRS} )


#####  Create object-target  #####
STRING( REGEX REPLACE "^.*shogun/" "" _TARGET "${CMAKE_CURRENT_SOURCE_DIR}" )
STRING( REGEX REPLACE "/" "-" _TARGET "${_TARGET}" )
SET( _TARGET "${PROJECT_NAME}-${_TARGET}" )
FILE( GLOB _SOURCES "*.c" "*.cpp" )
IF( NOT "${_SOURCES}" STREQUAL "" )
  SET( ${PROJECT_VAR_PREFIX}OBJECT_TARGETS
       ${${PROJECT_VAR_PREFIX}OBJECT_TARGETS} "$<TARGET_OBJECTS:${_TARGET}>"
       CACHE INTERNAL "Tracking-var for object targets" )
  ADD_LIBRARY( ${_TARGET} OBJECT ${_SOURCES} )
  SET_TARGET_PROPERTIES( ${_TARGET}
    PROPERTIES POSITION_INDEPENDENT_CODE TRUE )
ENDIF( NOT "${_SOURCES}" STREQUAL "" )


#####  Include subdirs for processing  #####
GET_CMAKE_SUBDIRS( _SUBDIRS ${CMAKE_CURRENT_SOURCE_DIR} )

FOREACH( _SUBDIR ${_SUBDIRS} )
  ADD_SUBDIRECTORY( ${_SUBDIR} )
ENDFOREACH( _SUBDIR ${_SUBDIRS} )