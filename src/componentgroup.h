#ifndef COMPONENTGROUP_H
#define COMPONENTGROUP_H

#include <QObject>
#include <QQmlEngine>
#include "component_model.h"

class ComponentGroup : public QObject
{
    Q_OBJECT
//    Q_PROPERTY(QString name READ name)
//    Q_PROPERTY(QAbstractListModel* componentModel READ componentModel)

public:
    ComponentGroup(const QString& name,
                            QObject *parent = nullptr);
    QString name() const { return m_name; }

    ComponentModel* componentModel() {
        return &m_components;
    }

//    static void registerQmlType()
//    {
//        qmlRegisterUncreatableType<ComponentGroup>
//                ("energycalc.component_group", 1, 0, "ComponentGroup","");
//    }

signals:

private:
    QString m_name;
    ComponentModel m_components;
};

#endif // COMPONENTGROUP_H
