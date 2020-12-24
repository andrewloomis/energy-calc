#ifndef STATE_MODEL_H
#define STATE_MODEL_H

#include <QAbstractListModel>
#include <QQmlEngine>
#include "component_state.h"

using ComponentStateList = QList<QPointer<ComponentState>>;

class StateModel : public QAbstractListModel
{
    Q_OBJECT
public:
    StateModel(QObject* parent = nullptr)
        : QAbstractListModel(parent) {}
    StateModel(const ComponentStateList& states,
               QObject* parent = nullptr)
        : QAbstractListModel(parent)
    {
        for(const auto& state : states) addState(state);
    }

    void addState(QPointer<ComponentState> state)
    {
        auto endOfRows = rowCount();
        beginInsertRows(QModelIndex(), endOfRows, endOfRows);
        elements.append(state);
        endInsertRows();
    }
    Q_INVOKABLE void addNewEditorState()
    {
        addState(new ComponentState{"",0,this});
    }
    Q_INVOKABLE void editStateName(int index, const QString& name)
    {
        elements[index]->setName(name);
    }
    Q_INVOKABLE void editStateCurrent(int index, double current)
    {
        elements[index]->setCurrent(current);
    }

    Q_INVOKABLE void removeState(int index)
    {
        beginRemoveRows(QModelIndex(), index, index);
        elements.removeAt(index);
        endRemoveRows();
    }

    const ComponentStateList& states() const
    {
        return elements;
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
        roles[Current] = "current";

        return roles;
    }

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override
    {
        auto row = index.row();
        switch (role) {
        case Name:
            return elements[row]->name();
        case Current:
            return elements[row]->current();
        default:
            return -1;
        }
    }

    Q_INVOKABLE void clear()
    {
        beginResetModel();
        elements.clear();
        endResetModel();
    }

    int rowCount(const QModelIndex& = QModelIndex()) const override
    {
        return elements.size();
    }

    static void registerQmlType()
    {
        qmlRegisterType<StateModel>
                ("energycalc.state_model", 1, 0, "StateModel");
    }

private:
    ComponentStateList elements;
};

#endif // COMPONENT_SELECTION_MODEL_H
