# Try to find the PHYSFS library
#  PHYSFS_FOUND - system has PHYSFS
#  PHYSFS_INCLUDE_DIR - the PHYSFS include directory
#  PHYSFS_LIBRARY - the PHYSFS library

FIND_PATH(PHYSFS_INCLUDE_DIR physfs.h PATH_SUFFIXES physfs)
SET(_PHYSFS_STATIC_LIBS libphysfs.a)
SET(_PHYSFS_SHARED_LIBS libphysfs.dll.a physfs)
IF(USE_STATIC_LIBS)
    FIND_LIBRARY(PHYSFS_LIBRARY NAMES ${_PHYSFS_STATIC_LIBS} ${_PHYSFS_SHARED_LIBS})
ELSE()
    FIND_LIBRARY(PHYSFS_LIBRARY NAMES ${_PHYSFS_SHARED_LIBS} ${_PHYSFS_STATIC_LIBS})
ENDIF()
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(PhysFS DEFAULT_MSG PHYSFS_LIBRARY PHYSFS_INCLUDE_DIR)
MARK_AS_ADVANCED(PHYSFS_LIBRARY PHYSFS_INCLUDE_DIR)