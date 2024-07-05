cmake_minimum_required(VERSION 3.16)

project(untitled3 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appuntitled3
    main.cpp
)

qt_add_qml_module(appuntitled3
    URI untitled3
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES FTUEElement.qml
        QML_FILES FTUEEffect.qml
        QML_FILES FTUE.qml
        QML_FILES FTUEWindow.qml
        QML_FILES FTUEPanel.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appuntitled3 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appuntitled3
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appuntitled3
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appuntitled3
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
