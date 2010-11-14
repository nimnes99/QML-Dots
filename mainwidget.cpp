#include "mainwidget.h"
#include "gamedata.h"
#include "point.h"
#include "line.h"
#include <QDeclarativeEngine>
#include <QApplication>
#include <QDeclarativeItem>

QString filename("MainView.qml");

MainWidget::MainWidget(QWidget *parent)
    : QDeclarativeView(parent)
{
#if defined(Q_OS_SYMBIAN) || defined(Q_WS_MAEMO_5)
    setWindowState(Qt::WindowFullScreen);
#endif

    setResizeMode(QDeclarativeView::SizeRootObjectToView);

    // Register Point
    qmlRegisterType<Point>("gameCore", 1, 0, "Point");
    qmlRegisterType<Line>("MyComponents", 1, 0, "Line");

    // Setup context
    m_context = rootContext();
    m_context->setContextProperty("mainWidget", this);
    m_context->setContextProperty("gameData", &m_gameData);

    // Open root QML file
    setSource(QUrl(filename));

    // gameView object
    QObject *object = dynamic_cast<QObject*>(rootObject()->children().first());

    // connect our signals to functions in qml
    connect(&m_gameData,
            SIGNAL(createLine(QVariant,QVariant,QVariant,QVariant,QVariant)),
            object,
            SLOT(createLine(QVariant,QVariant,QVariant,QVariant,QVariant)));

    connect(&m_gameData,
            SIGNAL(animateScore(QVariant,QVariant,QVariant,QVariant )),
            object,
            SLOT(animateScore(QVariant, QVariant,QVariant,QVariant)));

    // Set view optimizations not already done for QDeclarativeView
    setAttribute(Qt::WA_OpaquePaintEvent);
    setAttribute(Qt::WA_NoSystemBackground);
}

MainWidget::~MainWidget()
{
}

void MainWidget::minimizeWindow()
{
#if defined(Q_WS_MAEMO_5)
    // This is needed for Maemo5 to recognize minimization
    QDBusConnection connection = QDBusConnection::sessionBus();
    QDBusMessage message = QDBusMessage::createSignal("/","com.nokia.hildon_desktop","exit_app_view");
    connection.send(message);
#else
    setWindowState(Qt::WindowMinimized);
#endif
}

void MainWidget::closeApplication()
{
    QApplication::quit();
}
