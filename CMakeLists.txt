cmake_minimum_required(VERSION 2.8)
PROJECT(helper-scripts)
SET(CMAKE_BUILD_TYPE distribution)
SET(BIN_HOME "bin")

IF (NOT CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    SET(INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX})
    MESSAGE("-- Use given install PREFIX: ${INSTALL_PREFIX}")
ELSEIF (DEFINED ENV{prefix})
    SET(INSTALL_PREFIX $ENV{prefix})
    MESSAGE("-- Found global install PREFIX: ${INSTALL_PREFIX}")
    MESSAGE("---- Set -DCMAKE_INSTALL_PREFIX for using a custom prefix.")
ELSE ()
    SET(INSTALL_PREFIX "/usr/local")
    MESSAGE("-- Use default prefix: ${INSTALL_PREFIX}")
    MESSAGE("---- Set -DCMAKE_INSTALL_PREFIX for using a custom prefix.")
ENDIF()

### Install scrips to destination
FILE(GLOB SCRIPTS "${CMAKE_CURRENT_SOURCE_DIR}/src/*[!~]")
INSTALL(
    FILES ${SCRIPTS}
    PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE
    DESTINATION ${INSTALL_PREFIX}/${BIN_HOME}
)

