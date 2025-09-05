// themecontroller.h
#pragma once
#include <QObject>

class ThemeController : public QObject {
    Q_OBJECT
public:
    explicit ThemeController(QObject *parent = nullptr);

    Q_INVOKABLE bool loadThemePreference();
    Q_INVOKABLE void saveThemePreference(bool isDark);
    Q_INVOKABLE bool systemPrefersDark() const;
};
