#include <QGuiApplication>
#include <QQmlApplicationEngine>
// #include "lib/ColorableSvgItem.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // qmlRegisterType<ColorableSvgItem>("CustomControls", 1, 0, "ColorableSvg");

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Realtydesktop", "Main");

    return app.exec();
}
