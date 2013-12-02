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
LIST( APPEND ${PROJECT_VAR_PREFIX}_INCLUDE_DIRS "${CMAKE_CURRENT_SOURCE_DIR}" )
LIST( APPEND ${PROJECT_VAR_PREFIX}_INCLUDE_DIRS "${CMAKE_CURRENT_BINARY_DIR}" )


#####  Include subdirs for processing  #####
ADD_SUBDIRECTORY( lib )