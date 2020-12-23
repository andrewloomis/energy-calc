#include "designmanager.h"

DesignManager::DesignManager(QObject *parent) : QObject(parent),
    m_componentManager(m_powerSupplies, parent)
{

}
