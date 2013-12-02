#   CMake-script for  SHOGUN Machine Learning Toolbox
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


#####  Generate Package-Config and CMake-support files for libshogun  #####
FOREACH( _FILE
  "${PROJECT_NAME}.pc"
  "${PROJECT_NAME_CAPITAL}Config.cmake"
  "${PROJECT_NAME_CAPITAL}ConfigVersion.cmake" )
  CONFIGURE_FILE(
    "${CMAKE_CURRENT_SOURCE_DIR}/${_FILE}.in"
    "${CMAKE_CURRENT_BINARY_DIR}/${_FILE}" @ONLY )
ENDFOREACH()

#####  Install the generated files  #####
INSTALL( FILES
  "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.pc"
  DESTINATION "${LIB_INSTALL_DIR}/pkgconfig"
  COMPONENT dev )

INSTALL( FILES
  "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME_CAPITAL}Config.cmake"
  "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME_CAPITAL}ConfigVersion.cmake"
  DESTINATION "${LIB_INSTALL_DIR}/cmake/${PROJECT_NAME_CAPITAL}"
  COMPONENT dev )
