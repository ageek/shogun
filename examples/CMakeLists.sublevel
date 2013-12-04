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


#####  Give a message about the process  #####
STRING( REGEX REPLACE ".*/" "" _EXAMPLE "${CMAKE_CURRENT_SOURCE_DIR}" )
MESSAGE( STATUS "Generating documented examples for ${_EXAMPLE}")


#####  Determine static or modular type  #####
SET( _EXAMPLE_TYPE "modular" )
IF( "${CMAKE_CURRENT_SOURCE_DIR}" MATCHES ".*static$" )
  SET( _EXAMPLE_TYPE "static" )
ENDIF( "${CMAKE_CURRENT_SOURCE_DIR}" MATCHES ".*static$" )


#####  Create a list with all examples in current dir  #####
FOREACH( _EXAMPLE_EXT ${${PROJECT_VAR_PREFIX}EXAMPLES_EXT} )
  FILE( GLOB _EXAMPLES_TEMP "${CMAKE_CURRENT_SOURCE_DIR}/*.${_EXAMPLE_EXT}" )
  LIST( APPEND _EXAMPLES ${_EXAMPLES_TEMP} )
ENDFOREACH( _EXAMPLE_EXT ${${PROJECT_VAR_PREFIX}EXAMPLES_EXT} )


#####  Generate documentated examples  #####
FOREACH( _EXAMPLE ${_EXAMPLES} )

  SET( _DOCUMENTATION "" )

  STRING( REGEX REPLACE "^.*\\." ""
    _EXAMPLE_EXT "${_EXAMPLE}" )
  STRING( REGEX REPLACE "^${CMAKE_CURRENT_SOURCE_DIR}/" ""
    _EXAMPLE "${_EXAMPLE}" )

  STRING( REGEX REPLACE "${_EXAMPLE_EXT}$" "txt"
    _EXAMPLE_DOC_FILE "${_EXAMPLE}" )
  STRING( TOUPPER "${_EXAMPLE_EXT}" _EXAMPLE_EXT )
  SET( _EXAMPLE_DOC_FILE
    "${${PROJECT_VAR_PREFIX}DESC_DIR}/${_EXAMPLE_TYPE}/${_EXAMPLE_DOC_FILE}" )

  IF( EXISTS "${_EXAMPLE_DOC_FILE}" )

    FILE( STRINGS "${_EXAMPLE_DOC_FILE}" _DOC_STRINGS )

    FOREACH( _DOC_STRING ${_DOC_STRINGS} )
      SET( _DOCUMENTATION
        "${_DOCUMENTATION}${${_EXAMPLE_EXT}_COMMENT}${_DOC_STRING}\n" )
    ENDFOREACH( _DOC_STRING ${_DOC_STRINGS} )

  ELSE( EXISTS "${_EXAMPLE_DOC_FILE}" )

    SET( _DOCUMENTATION "${${_EXAMPLE_EXT}_COMMENT}Not documented\n")

  ENDIF( EXISTS "${_EXAMPLE_DOC_FILE}" )

  CONFIGURE_FILE(
    "${CMAKE_CURRENT_SOURCE_DIR}/${_EXAMPLE}"
    "${CMAKE_CURRENT_BINARY_DIR}/${_EXAMPLE}"
    @ONLY )

  IF( NOT EXISTS "${CMAKE_CURRENT_BINARY_DIR}/${_EXAMPLE}" )
    CONFIGURE_FILE(
      "${CMAKE_CURRENT_SOURCE_DIR}/${_EXAMPLE}"
      "${CMAKE_CURRENT_BINARY_DIR}/${_EXAMPLE}"
      COPYONLY )
  ENDIF( NOT EXISTS "${CMAKE_CURRENT_BINARY_DIR}/${_EXAMPLE}" )

ENDFOREACH( _EXAMPLE ${_EXAMPLES} )
