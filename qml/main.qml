import QtQuick 2.12
import QtQuick.Controls 2.12
import energycalc.design_manager 1.0
import "SystemView/"

ApplicationWindow {
    width: 1280
    height: 720
    visible: true
    title: "Energy Calc"

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: Home {
            onStartNewDesign:
            {
                designManager.name = name
                stack.push(systemView)
            }
        }

        SystemView {
            id: systemView
            designManager: designManager
        }
    }

    DesignManager {
        id: designManager
    }
}
