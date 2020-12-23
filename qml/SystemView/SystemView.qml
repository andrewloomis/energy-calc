import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import energycalc.design_manager 1.0
import "../"
import "../text/"
import "../editor/"
import "../ComponentsPage"

Pane {
    property DesignManager designManager
    anchors.fill: parent

    ColumnLayout {
        anchors.fill: parent
        TitleText {
            Layout.alignment: Qt.AlignTop + Qt.AlignHCenter
            text: designManager.name
        }

        SwipeView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: bar.currentIndex

            ComponentsPage {
                componentManager: designManager.componentManager
            }
        }
        TabBar {
            id: bar
            width: parent.width
            position: TabBar.Footer
            Material.accent: "#FF9800"

            Repeater {
                model: ["Inputs", "Charger", "Storage", "Power Supply",
                    "Components", "Simulation"]

                TabButton {
                    text: modelData
                    font.pointSize: 14
                    width: bar.width / 6
                    Material.accent: "#FF9800"
                }
            }
        }
    }
}
