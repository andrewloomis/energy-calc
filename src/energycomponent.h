#ifndef ENERGYCOMPONENT_H
#define ENERGYCOMPONENT_H

#include <QObject>

class EnergyComponent
{
public:
    EnergyComponent();
    QString name() const { return m_name; }

private:
    QString m_name;
};

#endif // ENERGYCOMPONENT_H
