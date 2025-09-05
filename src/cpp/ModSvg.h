#ifndef ModSvg_H
#define ModSvg_H

#include <QQuickPaintedItem>
#include <QSvgRenderer>
#include <QUrl>
#include <QColor>
#include <memory>
#include <qqml.h>

class ModSvg : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QUrl source READ source WRITE setSource NOTIFY sourceChanged)
    Q_PROPERTY(QString find READ find WRITE setFind NOTIFY findChanged)
    Q_PROPERTY(QString replace READ replace WRITE setReplace NOTIFY replaceChanged)
    Q_PROPERTY(QStringList findMany READ findMany WRITE setFindMany NOTIFY findManyChanged)
    Q_PROPERTY(QStringList replaceMany READ replaceMany WRITE setReplaceMany NOTIFY replaceManyChanged)
    QML_ELEMENT

public:
    explicit ModSvg(QQuickItem *parent = nullptr);

    QUrl source() const;
    void setSource(const QUrl &source);

    QString find() const;
    void setFind(const QString &value);

    QString replace() const;
    void setReplace(const QString &value);

    QStringList findMany() const;
    void setFindMany(const QStringList &values);

    QStringList replaceMany() const;
    void setReplaceMany(const QStringList &values);

    void paint(QPainter *painter) override;

signals:
    void sourceChanged();
    void findChanged();
    void replaceChanged();
    void findManyChanged();
    void replaceManyChanged();

private:
    void loadAndModifySvg();

    QUrl m_source;
    QString m_find;
    QString m_replace;
    QStringList m_findMany;
    QStringList m_replaceMany;
    std::unique_ptr<QSvgRenderer> m_renderer;
};

#endif // ModSvg_H
