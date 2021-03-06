find_package(PkgConfig)

pkg_check_modules(PC_LIBAVUTIL QUIET libavutil)
set(LIBAVUTIL_DEFINITIONS ${PC_LIBAVUTIL_CFLAGS_OTHER})

find_path(LIBAVUTIL_INCLUDE_DIR libavutil/avutil.h
	HINTS ${PC_LIBAVUTIL_INCLUDEDIR} ${PC_LIBAVUTIL_INCLUDE_DIRS}
	PATH_SUFFIXES libavutil)

find_library(LIBAVUTIL_LIBRARY NAMES libavutil avutil
	HINTS ${PC_LIBAVUTIL_LIBDIR} ${PC_LIBAVUTIL_LIBRARY_DIRS})

set(LIBAVUTIL_INCLUDE_DIRS ${LIBAVUTIL_INCLUDE_DIR})
set(LIBAVUTIL_LIBRARIES ${LIBAVUTIL_LIBRARY})

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(Libavutil DEFAULT_MSG
	LIBAVUTIL_INCLUDE_DIR LIBAVUTIL_LIBRARY)
mark_as_advanced(LIBAVUTIL_INCLUDE_DIR LIBAVUTIL_LIBRARY)
