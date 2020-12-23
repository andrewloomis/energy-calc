#ifndef COMPONENT_GROUP_MODEL_H
#define COMPONENT_GROUP_MODEL_H

#include <QAbstractListModel>
#include "componentgroup.h"

class ComponentGroupModel : public QAbstractListModel
{
    Q_OBJECT
public:
    ComponentGroupModel(QObject* parent = nullptr)
        : QAbstractListModel(parent) {}

    bool addGroup(const QPointer<ComponentGroup>& group)
    {
        for (const auto& element : elements)
            if (element->name() == group->name()) return false;
        auto endOfRows = rowCount();
        beginInsertRows(QModelIndex(), endOfRows, endOfRows);
        elements.append(group);
        endInsertRows();
        return true;
    }

    Q_INVOKABLE void removeGroup(int index)
    {
        beginRemoveRows(QModelIndex(), index, index);
        elements.erase(elements.begin() + index);
        endRemoveRows();
    }

    enum Roles
    {
        Name = Qt::UserRole + 1,
        Group
    };

    QHash<int, QByteArray> roleNames() const override
    {
        QHash<int, QByteArray> roles;
        roles[Name] = "name";
        roles[Group] = "group";

        return roles;
    }

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override
    {
        auto row = index.row();
        switch (role) {
        case Name:
            return elements[row]->name();
        case Group:
            return QVariant::fromValue(elements[row].data());
        default:
            return -1;
        }
    }

    int rowCount(const QModelIndex& = QModelIndex()) const override
    {
        return elements.size();
    }

private:
    QList<QPointer<ComponentGroup>> elements;
};

#endif // COMPONENT_SELECTION_MODEL_H
