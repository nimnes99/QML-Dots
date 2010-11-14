#ifndef MAINWIDGET_H
#define MAINWIDGET_H

#include <QDeclarativeView>
#include <QDeclarativeContext>
#include "gamedata.h"

class MainWidget : public QDeclarativeView
{
    Q_OBJECT

public:
    MainWidget(QWidget *parent = 0);
    ~MainWidget();

public slots:
    void minimizeWindow();
    void closeApplication();

private:
    QDeclarativeContext *m_context;
    GameData m_gameData;
};

#endif // MAINWIDGET_H
