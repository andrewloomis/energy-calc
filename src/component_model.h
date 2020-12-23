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

    void addComponent(const EnergyComponent& comp)
    {
        auto endOfRows = rowCount();
        beginInsertRows(QModelIndex(), endOfRows, endOfRows);
        elements.append(comp);
        endInsertRows();
    }

    Q_INVOKABLE void addComponent(const QString& name,
                                  int quantity)
    {

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
        Current
    };

    QHash<int, QByteArray> roleNames() const override
    {
        QHash<int, QByteArray> roles;
        roles[Name] = "name";

        return roles;
    }

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override
    {
        auto row = index.row();
        switch (role) {
        case Name:
            return elements[row].name();
        default:
            return -1;
        }
    }

    int rowCount(const QModelIndex& = QModelIndex()) const override
    {
        return elements.size();
    }
//    int currentDialogIndex() const { return (rowCount() - 1); }

private:
    QList<EnergyComponent> elements;
};

#endif // COMPONENT_SELECTION_MODEL_H
