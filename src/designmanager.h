#ifndef DESIGNMANAGER_H
#define DESIGNMANAGER_H

#include <QObject>
#include <QQmlEngine>
#include "component_manager.h"

class DesignManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name MEMBER m_name NOTIFY nameChanged)
    Q_PROPERTY(ComponentManager* componentManager READ componentManager)

public:
    explicit DesignManager(QObject *parent = nullptr);

    ComponentManager* componentManager()
    {
        return &m_componentManager;
    }

    static void registerQmlType()
    {
        qmlRegisterType<DesignManager>
                ("energycalc.design_manager", 1, 0, "DesignManager");
    }

signals:
    void nameChanged();

private:
    QString m_name;
    ComponentManager m_componentManager;
    QList<PowerSupply> m_powerSupplies;
};

#endif // COMPONENTMANAGER_H
