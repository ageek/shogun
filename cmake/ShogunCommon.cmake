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


#####  Macro for getting all direct subdirs which contain CMakeLists.txt  #####
MACRO( GET_CMAKE_SUBDIRS _RESULT _CURDIR )
  FILE( GLOB _CHILDREN RELATIVE "${_CURDIR}" "${_CURDIR}/*" )
  SET(_DIRLIST "" )
  FOREACH( _CHILD ${_CHILDREN} )
    IF( IS_DIRECTORY "${_CURDIR}/${_CHILD}"
        AND EXISTS "${_CURDIR}/${_CHILD}/CMakeLists.txt" )
      LIST( APPEND _DIRLIST ${_CHILD})
    ENDIF()
  ENDFOREACH()
  SET(${_RESULT} ${_DIRLIST})
ENDMACRO()