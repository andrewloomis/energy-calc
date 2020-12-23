#ifndef COMPONENTMANAGER_H
#define COMPONENTMANAGER_H

#include <QObject>
#include <QQmlEngine>

#include "statemodel.h"
#include "powersupply.h"
#include "component_group_model.h"

class ComponentManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList powerSupplies READ powerSupplies)
    Q_PROPERTY(QAbstractListModel* groups READ groups)
//    Q_PROPERTY(QAbstractListModel* editorStateModel READ editorStateModel)

public:
    ComponentManager(const QList<PowerSupply>& powerSupplyList,
                     QObject *parent = nullptr);

    Q_INVOKABLE bool addGroup(const QString& name)
    {
        return m_componentGroupModel.addGroup(new ComponentGroup{name});
    }
    QStringList powerSupplies() const
    {
        QStringList list;
        for (const auto& p : m_powerSupplies)
        {
            list.append(p.name() + " [" + p.voltageString() + "V]");
        }
        return list;
    }

    ComponentGroupModel* groups()
    {
        return &m_componentGroupModel;
    }

//    QAbstractListModel* editorStateModel()
//    {
//        return &m_editorStateModel;
//    }

    static void registerQmlType()
    {
        qmlRegisterUncreatableType<ComponentManager>
                ("energycalc.component_manager", 1, 0, "ComponentManager","");
    }

signals:

private:
//    StateModel m_editorStateModel;
    ComponentGroupModel m_componentGroupModel;
    const QList<PowerSupply>& m_powerSupplies;
};

#endif // COMPONENTEDITORMANAGER_H
