# - Try to find PcapPlusPlus include dirs and libraries
#
# Usage of this module as follows:
#
#     find_package(PcapPlusPlus)
#
# Variables used by this module, they can change the default behaviour and need
# to be set before calling find_package:
#
#  PcapPlusPlus_ROOT_DIR     Set this variable to the root installation of
#                            PcapPlusPlus if the module has problems finding the
#                            proper installation path.
#
# Variables defined by this module:
#
#  PcapPlusPlus_FOUND                System has PcapPlusPlus, include and library dirs found
#  PcapPlusPlus_INCLUDE_DIR          The PcapPlusPlus include directories.
#  PcapPlusPlus_LIBRARY              The PcapPlusPlus library

find_path(PcapPlusPlus_ROOT_DIR NAMES include/pcapplusplus)
find_path(PcapPlusPlus_INCLUDE_DIR NAMES PcapPlusPlusVersion.h HINTS ${PcapPlusPlus_ROOT_DIR}/include/pcapplusplus)

find_library(libPcap NAMES libPcap++.a HINTS ${PcapPlusPlus_ROOT_DIR}/lib)
find_library(libPacket NAMES libPacket++.a HINTS ${PcapPlusPlus_ROOT_DIR}/lib)
find_library(libCommon NAMES libCommon++.a HINTS ${PcapPlusPlus_ROOT_DIR}/lib)
set(PcapPlusPlus_LIBRARY ${libPcap} ${libPacket} ${libCommon})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(PcapPlusPlus DEFAULT_MSG PcapPlusPlus_LIBRARY PcapPlusPlus_INCLUDE_DIR)
mark_as_advanced(PcapPlusPlus_ROOT_DIR PcapPlusPlus_INCLUDE_DIR PcapPlusPlus_LIBRARY)