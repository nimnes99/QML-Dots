QT += script \
    declarative

# This is needed for Maemo5 to recognize minimization of the application window
maemo5 {
    QT += dbus
}

SOURCES += \
    main.cpp \
    mainwidget.cpp \
    gamedata.cpp

HEADERS += \
    mainwidget.h \
    gamedata.h \
    point.h \
    line.h

OTHER_FILES += \
    MainView.qml \
    MenuPanel.qml \
    Frame.qml \
    Button.qml \
    Switch.qml \
    GameView.qml \
    Point.qml \
    ControlPanel.qml \
    Cell.qml \
    lines.js
