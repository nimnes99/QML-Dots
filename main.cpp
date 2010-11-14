#include "mainwidget.h"
#include <qdeclarative.h>
#include <QDeclarativeView>
#include <QApplication>

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);
    app.setStartDragDistance(30);
    MainWidget mainWidget;
    mainWidget.show();

    return app.exec();
}
