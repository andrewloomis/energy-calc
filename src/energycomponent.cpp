#include "energycomponent.h"

EnergyComponent::EnergyComponent(const QString& name,
                                 int quantity,
                                 const ComponentStateList& states,
                                 QObject *parent)
    : QObject(parent), m_name(name), m_quantity(quantity),
      m_states(states)
{

}
