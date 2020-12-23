#include "component_manager.h"

ComponentManager::ComponentManager(const QList<PowerSupply>& powerSupplyList,
                                   QObject *parent)
    : QObject(parent), m_powerSupplies(powerSupplyList)
{

}
