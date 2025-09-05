#include "Translator.h"
#include <QLocale>
#include <QDebug>

Translator::Translator(QObject *parent)
    : QObject(parent)
{
}

void Translator::initialize()
{
    QSettings settings;
    QString savedLocale = settings.value("language").toString();

    if (!savedLocale.isEmpty()) {
        // Use saved preference
        applyLanguage(savedLocale);
        return;
    }

    // Detect system locale
    QString systemLocale = QLocale::system().name().left(2); // "en_US" -> "en"

    if (m_supportedLocales.contains(systemLocale)) {
        applyLanguage(systemLocale);
    } else {
        applyLanguage("en"); // fallback
    }
}

void Translator::setLanguage(const QString &localeCode)
{
    applyLanguage(localeCode);

    // Save preference
    QSettings settings;
    settings.setValue("language", m_currentLocale);
}

void Translator::applyLanguage(const QString &localeCode)
{
    if (localeCode == m_currentLocale)
        return; // No change

    qApp->removeTranslator(&m_translator);

    if (m_translator.load(QString("app_%1").arg(localeCode), ":/translations")) {
        qApp->installTranslator(&m_translator);
        m_currentLocale = localeCode;
        emit languageChanged();
        qDebug() << "Language set to:" << localeCode;
    } else {
        qDebug() << "Failed to load language:" << localeCode;
    }
}
