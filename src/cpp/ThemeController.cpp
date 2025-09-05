// themecontroller.cpp
#include "ThemeController.h"
#include <QSettings>
#include <QGuiApplication>
#include <QPalette>

ThemeController::ThemeController(QObject *parent)
    : QObject(parent) {}

bool ThemeController::loadThemePreference() {
    QSettings settings;
    if (settings.contains("theme/isDark")) {
        return settings.value("theme/isDark").toBool();
    }
    return systemPrefersDark();
}

void ThemeController::saveThemePreference(bool isDark) {
    QSettings settings;
    settings.setValue("theme/isDark", isDark);
}

bool ThemeController::systemPrefersDark() const {
#ifdef Q_OS_MAC
    // macOS: dark mode detection
    return QGuiApplication::palette().color(QPalette::Window).lightness() < 128;
#elif defined(Q_OS_WIN)
    // Windows registry or palette detection
    return QGuiApplication::palette().color(QPalette::Window).lightness() < 128;
#else
    // Fallback: lightness check
    return QGuiApplication::palette().color(QPalette::Window).lightness() < 128;
#endif
}
