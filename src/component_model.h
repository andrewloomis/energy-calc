#ifndef COMPONENT_MODEL_H
#define COMPONENT_MODEL_H

#include <QAbstractListModel>
#include "energycomponent.h"

class ComponentModel : public QAbstractListModel
{
    Q_OBJECT
public:
    ComponentModel(QObject* parent = nullptr)
        : QAbstractListModel(parent) {}

//    void addComponent(QPointer<EnergyComponent> comp)
//    {
//        auto endOfRows = rowCount();
//        beginInsertRows(QModelIndex(), endOfRows, endOfRows);
//        elements.append(comp);
//        endInsertRows();
//    }

    Q_INVOKABLE void addComponent(const QString& name,
                                  int quantity,
                                  StateModel* stateModel)
    {
        auto endOfRows = rowCount();
        beginInsertRows(QModelIndex(), endOfRows, endOfRows);
        elements.append(new EnergyComponent(name,quantity,stateModel->states()));
        endInsertRows();
    }

    Q_INVOKABLE void removeComponent(int index)
    {
        beginRemoveRows(QModelIndex(), index, index);
        elements.removeAt(index);
        endRemoveRows();
    }

    enum Roles
    {
        Name = Qt::UserRole + 1,
        _StateModel
    };

    QHash<int, QByteArray> roleNames() const override
    {
        QHash<int, QByteArray> roles;
        roles[Name] = "name";
        roles[_StateModel] = "stateModel";

        return roles;
    }

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override
    {
        auto row = index.row();
        switch (role) {
        case Name:
            return elements[row]->name();
        case _StateModel:
            return QVariant::fromValue(elements[row]->stateModel());
        default:
            return -1;
        }
    }

    int rowCount(const QModelIndex& = QModelIndex()) const override
    {
        return elements.size();
    }

    static void registerQmlType()
    {
        qmlRegisterUncreatableType<ComponentModel>
                ("energycalc.component_model", 1, 0, "ComponentModel","");
    }

private:
    QList<QPointer<EnergyComponent>> elements;
};

#endif // COMPONENT_SELECTION_MODEL_H
