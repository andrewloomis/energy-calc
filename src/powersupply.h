#ifndef POWERSUPPLY_H
#define POWERSUPPLY_H

#include <QString>
#include "units.h"

class PowerSupply
{
public:
    PowerSupply(const QString& name, Volts voltage);
    QString name() const { return m_name; }
    Volts voltage() const { return m_voltage; }
    QString voltageString() const { return QString::number(m_voltage,'f',3); }

private:
    QString m_name;
    double m_voltage;
};

#endif // POWERSUPPLY_H
