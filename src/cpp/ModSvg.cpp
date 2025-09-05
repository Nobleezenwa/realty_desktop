#include "ModSvg.h"
#include <QFile>
#include <QPainter>
#include <QDebug>

ModSvg::ModSvg(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
    setAntialiasing(true);
}

QUrl ModSvg::source() const { return m_source; }
void ModSvg::setSource(const QUrl &source) {
    if (m_source == source)
        return;
    m_source = source;
    loadAndModifySvg();
    emit sourceChanged();
}

QString ModSvg::find() const { return m_find; }
void ModSvg::setFind(const QString &value) {
    if (m_find == value)
        return;
    m_find = value;
    loadAndModifySvg();
    emit findChanged();
}

QString ModSvg::replace() const { return m_replace; }
void ModSvg::setReplace(const QString &value) {
    if (m_replace == value)
        return;
    m_replace = value;
    loadAndModifySvg();
    emit replaceChanged();
}

QStringList ModSvg::findMany() const { return m_findMany; }
void ModSvg::setFindMany(const QStringList &values) {
    if (m_findMany == values)
        return;
    m_findMany = values;
    loadAndModifySvg();
    emit findManyChanged();
}

QStringList ModSvg::replaceMany() const { return m_replaceMany; }
void ModSvg::setReplaceMany(const QStringList &values) {
    if (m_replaceMany == values)
        return;
    m_replaceMany = values;
    loadAndModifySvg();
    emit replaceManyChanged();
}

void ModSvg::loadAndModifySvg()
{
    if (!m_source.isValid())
        return;

    QString path = m_source.toLocalFile();
    if (path.isEmpty() && m_source.scheme() == "qrc") {
        path = ":" + m_source.path();
    }

    QFile file(path);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Could not open SVG file:" << path;
        return;
    }

    QString svgData = QString::fromUtf8(file.readAll());
    file.close();

    if (!m_find.isEmpty()) {
        svgData.replace(m_find, m_replace, Qt::CaseInsensitive);
    }
    else if (!m_findMany.isEmpty() && m_findMany.size() == m_replaceMany.size()) {
        for (int i = 0; i < m_findMany.size(); ++i) {
            svgData.replace(m_findMany[i], m_replaceMany[i], Qt::CaseInsensitive);
        }
    }

    if (!m_renderer)
        m_renderer = std::make_unique<QSvgRenderer>();

    m_renderer->load(svgData.toUtf8());
    update();
}

void ModSvg::paint(QPainter *painter)
{
    if (m_renderer && m_renderer->isValid()) {
        m_renderer->render(painter, boundingRect());
    }
}
