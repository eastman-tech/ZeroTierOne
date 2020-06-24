set(CPACK_PACKAGE_VENDOR "ZeroTier, Inc.")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "ZeroTier network virtualization service ZeroTier One lets you join ZeroTier virtual networks and have them appear as tun/tap ports on your system. See https://www.zerotier.com/ for instructions and documentation.")
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})
set(CPACK_PACKAGE_VERSION_RELEASE ${PROJECT_VERSION_RELEASE})
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE.txt")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")
set(CPACK_GENERATOR "DEB")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "ZeroTier, Inc. <support@zerotier.com>")
set(CPACK_DEBIAN_PACKAGE_SECTION "net")
set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")
set(CPACK_DEBIAN_PACKAGE_HOMEPAGE "https://www.zerotier.com")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "iproute2, adduser")
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)
set(CPACK_DEBIAN_PACKAGE_GENERATE_SHLIBS ON)
set(CPACK_DEBIAN_PACKAGE_REPLACES "zerotier-one")
set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "${CMAKE_CURRENT_SOURCE_DIR}/packaging/debian/postinst")

set(CPACK_DEBIAN_FILE_NAME "DEB-DEFAULT")

if(BUILD_ARM_V5)
    set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "armel")
elseif(BUILD_ARM_V6)
    set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "armhf")
endif()

include(CPack)
