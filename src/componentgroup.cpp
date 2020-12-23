#include "componentgroup.h"

ComponentGroup::ComponentGroup(const QString& name,
                               QObject *parent)
    : QObject(parent), m_name(name)
{

}
