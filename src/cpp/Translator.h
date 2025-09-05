#pragma once
#include <QObject>
#include <QTranslator>
#include <QGuiApplication>
#include <QSettings>

class Translator : public QObject
{
    Q_OBJECT
public:
    explicit Translator(QObject *parent = nullptr);

    Q_INVOKABLE void setLanguage(const QString &localeCode);
    Q_INVOKABLE QString currentLanguage() const { return m_currentLocale; }

    void initialize(); // call this after QGuiApplication is created

signals:
    void languageChanged();

private:
    QTranslator m_translator;
    QString m_currentLocale;
    QStringList m_supportedLocales = { "en", "fr" };

    void applyLanguage(const QString &localeCode);
};
