cmake_minimum_required(VERSION 3.16)

project(realty_desktop VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick Charts LinguistTools)

set(TS_FILES
    "${CMAKE_CURRENT_SOURCE_DIR}/translations/app_en.ts"
    "${CMAKE_CURRENT_SOURCE_DIR}/translations/app_fr.ts"
)
qt_create_translation(QML_T_FILES ${CMAKE_CURRENT_SOURCE_DIR} ${TS_FILES})

qt_standard_project_setup(REQUIRES 6.8)

set(CMAKE_AUTORCC ON)

file(GLOB SRC_CPP
    "${CMAKE_CURRENT_SOURCE_DIR}/src/cpp/*.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/cpp/*.h"
)

qt_add_executable(apprealty_desktop
    src/qml/pages/pages.qrc
    src/qml/features/features.qrc
    src/resources/images/images.qrc
    src/resources/audios/audios.qrc
    src/resources/videos/videos.qrc
    src/resources/fonts/fonts.qrc
    src/resources/translations/translations.qrc
    src/shaders/shaders.qrc
    main.cpp
    ${SRC_CPP}
    ${QML_T_FILES}
)

target_include_directories(apprealty_desktop
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src/cpp
)

find_package(Qt6 REQUIRED COMPONENTS Svg)

target_link_libraries(apprealty_desktop
    PUBLIC
       Qt6::Charts
       Qt6::Core
       Qt6::Gui
       Qt6::Qml
       Qt6::Quick
       Qt6::Svg
)

# QML sources (recursive)
file(GLOB_RECURSE QML_FILES CONFIGURE_DEPENDS
    RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/qml/*.qml"
)

file(GLOB SINGLETON_QML_FILES CONFIGURE_DEPENDS
    RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/qml/singletons/*.qml"
)

set_source_files_properties(
    ${SINGLETON_QML_FILES}
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(apprealty_desktop
    URI Realtydesktop
    VERSION 1.0
    QML_FILES
        ${QML_FILES}
    DEPENDENCIES
        QtQuick
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(apprealty_desktop PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.apprealty_desktop
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

include(GNUInstallDirs)
install(TARGETS apprealty_desktop
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
