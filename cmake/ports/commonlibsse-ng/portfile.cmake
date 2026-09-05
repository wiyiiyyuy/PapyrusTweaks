vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO alandtse/CommonLibSSE-NG
    REF v7.2.0
    SHA512 8ba944a805abc0fb7ad634a8e27a699594628528e464e6fd5d628bdcaf0ce325256061ccbc42bfdcaaf4be28fc28ddadfa5d801d3a14c01d760e80bb07765501
    HEAD_REF ng
)

vcpkg_from_github(
    OUT_SOURCE_PATH HDE64_SOURCE_PATH
    REPO TsudaKageyu/minhook
    REF v1.3.4
    SHA512 8a33233598b56ad9da44d22d470c2432f68364dac31bc719fcd6b085e681fa10ddd41865fbde056ee7f4e7a075cc135344b6bf444eadbd7e7314ee1bedfd89b5
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DSKSE_SUPPORT_XBYAK=ON
        -DBUILD_TESTS=OFF
        -DENABLE_SKYRIM_SE=ON
        -DENABLE_SKYRIM_AE=ON
        -DENABLE_SKYRIM_VR=OFF
        -DCOMMONLIB_ENABLE_IPO=OFF
        -DFETCHCONTENT_SOURCE_DIR_HDE64=${HDE64_SOURCE_PATH}
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(
    PACKAGE_NAME CommonLibSSE
    CONFIG_PATH lib/cmake/CommonLibSSE
)

# CommonLibSSE's exported target publicly links Microsoft::DirectXTK.  Make
# that target available to consumers of the installed package as well.
file(APPEND "${CURRENT_PACKAGES_DIR}/share/CommonLibSSE/CommonLibSSEConfig.cmake"
    "\ninclude(CMakeFindDependencyMacro)\nfind_dependency(directxtk CONFIG)\n"
)
vcpkg_copy_pdbs()

file(INSTALL "${SOURCE_PATH}/cmake/CommonLibSSE.cmake"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/CommonLibSSE"
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")
