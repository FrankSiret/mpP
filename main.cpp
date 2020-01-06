#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QProcess>
#include <QQmlContext>

#include <QDebug>
#include "launcher.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setAttribute(Qt::AA_UseOpenGLES);
    QCoreApplication::setAttribute(Qt::AA_UseSoftwareOpenGL);

    QGuiApplication app(argc, argv);

    qmlRegisterType<Launcher>("LauncherUri", 1, 0, "Launcher");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    engine.rootContext()->setContextProperty("applicationDirPath", QGuiApplication::applicationDirPath());

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
