import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import energycalc.component_model 1.0
import "../text"
import "../buttons"

Rectangle {
    id: pane
    property string groupName
    property ComponentModel groupComponentModel

    signal removeGroup()

    color: "#524438"
//    Layout.preferredWidth: parent.width/2
    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.maximumWidth: parent.width/3
    Layout.maximumHeight: parent.height
    Layout.minimumWidth: parent.width/3
    Layout.minimumHeight: parent.height/2


    LabelText {
        id: title
        color: Material.primaryTextColor
        anchors.margins: 5
        anchors.top: parent.top
        anchors.left: parent.left
        text: groupName
    }

    CloseButton {
        anchors.top: parent.top
        anchors.right: parent.right
        padding: 5
        scale: 0.7
        anchors.margins: -5
        onClicked: {
            removeGroup()
        }
    }

    Rectangle {
        anchors.margins: 2
        anchors.topMargin: title.contentHeight*1.5
        anchors.fill: parent
        color: "#4f4f4f"

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 10

            TabBar {
                id: bar
                Layout.fillWidth: true
                position: TabBar.Header
                Material.accent: "#FF9800"
                Material.background: "#4f4f4f"

                Repeater {
                    model: ["Components","Stats"]
                    TabButton {
                        text: modelData
                        font.pointSize: 12
                        Material.accent: "#FF9800"
                    }
                }
            }
            SwipeView {
                Layout.fillHeight: true
                Layout.fillWidth: true
                currentIndex: bar.currentIndex

                ComponentsColumn {
                    componentModel: groupComponentModel
                }
            }
        }
    }
}
