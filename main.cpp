#include <QApplication>
// #include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Translator.h"
#include "ThemeController.h"
// #include <QFileSystemWatcher>
// #include <QTimer>
// #include <QDebug>

int main(int argc, char *argv[])
{
    // QGuiApplication app(argc, argv);

    // Qt Charts uses Qt Graphics View Framework for drawing, therefore QApplication must be used.
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    //TODO: Hot Reload
    // const QUrl qmlFileUrl = QUrl::fromLocalFile(QStringLiteral("../../src/qml/Main.qml"));
    // // Initial load
    // engine.load(qmlFileUrl);
    // if (engine.rootObjects().isEmpty())
    //     return -1;
    // // Watcher for QML changes
    // QFileSystemWatcher watcher;
    // watcher.addPath("../../src/qml/Main.qml");
    // // watcher.addPaths(QDir("qml").entryList(QDir::Files));
    // // To prevent multiple reloads when file changes quickly
    // QTimer reloadDebounce;
    // reloadDebounce.setSingleShot(true);
    // reloadDebounce.setInterval(200); // ms
    // //
    // QObject::connect(&watcher, &QFileSystemWatcher::fileChanged, [&](const QString &path){
    //     qDebug() << "Detected change in" << path;
    //     reloadDebounce.start();
    // });
    // //
    // QObject::connect(&reloadDebounce, &QTimer::timeout, [&](){
    //     qDebug() << "Reloading QML...";
    //     engine.clearComponentCache();
    //     engine.load(qmlFileUrl);

    //     if (engine.rootObjects().isEmpty()) {
    //         qWarning() << "Reload failed!";
    //     }
    // });

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    Translator translator;
    translator.initialize();
    engine.rootContext()->setContextProperty("Translator", &translator);

    ThemeController themeController;
    engine.rootContext()->setContextProperty("ThemeController", &themeController);

    engine.loadFromModule("Realtydesktop", "Main");

    return app.exec();
}
