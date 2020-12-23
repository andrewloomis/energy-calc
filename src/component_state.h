#ifndef COMPONENT_STATE_H
#define COMPONENT_STATE_H

#include "units.h"
#include <QString>

class ComponentState
{
public:
    ComponentState(const QString& name, const Amperes& current)
        : m_name(name), m_current(current) {}
    QString name() const { return m_name; }
    Amperes current() const { return m_current; }

private:
    QString m_name;
    Amperes m_current;
};

#endif // COMPONENT_STATE_H
