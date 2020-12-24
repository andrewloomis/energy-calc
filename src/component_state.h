#ifndef COMPONENT_STATE_H
#define COMPONENT_STATE_H

#include "units.h"
#include <QObject>
#include <QQmlEngine>

class ComponentState : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name MEMBER m_name NOTIFY nameChanged)
    Q_PROPERTY(double current MEMBER m_current NOTIFY currentChanged)
public:
    ComponentState(const QString& name, const Amperes& current,
                   QObject* parent = nullptr)
        : QObject(parent), m_name(name), m_current(current) {}

    QString name() const { return m_name; }
    void setName(const QString& name) { m_name = name; }
    Amperes current() const { return m_current; }
    void setCurrent(Amperes current) { m_current = current; }

    static void registerQmlType()
    {
        qmlRegisterUncreatableType<ComponentState>
                ("energycalc.component_state", 1, 0, "ComponentState","");
    }

signals:
    void nameChanged();
    void currentChanged();

private:
    QString m_name;
    Amperes m_current;
};

#endif // COMPONENT_STATE_H
