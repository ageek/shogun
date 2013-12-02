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


#####  Autogenerate scripts  #####
FILE( GLOB _AUTOGEN_FILES "*.in" )

FOREACH( _AUTOGEN ${_AUTOGEN_FILES} )
  STRING( REGEX REPLACE "^${CMAKE_CURRENT_SOURCE_DIR}/" "" _AUTOGEN "${_AUTOGEN}")
  STRING( REGEX REPLACE ".in$" "" _AUTOGEN "${_AUTOGEN}")
  CONFIGURE_FILE(
    ${CMAKE_CURRENT_SOURCE_DIR}/${_AUTOGEN}.in
    ${CMAKE_CURRENT_BINARY_DIR}/${_AUTOGEN}
    @ONLY )
ENDFOREACH( _AUTOGEN ${_AUTOGEN_FILES} )