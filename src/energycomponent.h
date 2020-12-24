#ifndef ENERGYCOMPONENT_H
#define ENERGYCOMPONENT_H

#include <QObject>
#include <QQmlEngine>
#include "statemodel.h"

class EnergyComponent : public QObject
{
    Q_OBJECT
//    Q_PROPERTY(QString name MEMBER m_name NOTIFY nameChanged)
//    Q_PROPERTY(QAbstractListModel* stateModel READ stateModel)

public:
    EnergyComponent(const QString& name,
                    int quantity,
                    const ComponentStateList& states,
                    QObject *parent = nullptr);
    QString name() const { return m_name; }
    StateModel* stateModel()
    {
        return &m_states;
    }

//    static void registerQmlType()
//    {
//        qmlRegisterUncreatableType<EnergyComponent>
//                ("energycalc.energy_component", 1, 0, "EnergyComponent","");
//    }

signals:
    void nameChanged();

private:
    QString m_name;
    int m_quantity = 1;
    StateModel m_states;
};

#endif // ENERGYCOMPONENT_H
