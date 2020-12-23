import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import energycalc.component_manager 1.0
import "../buttons/"
import "../"
Pane {
//    id: page
//    property ComponentManager componentManager

//    GridLayout {
//        anchors.fill: parent
//        anchors.margins: 10
//        columns: 3

//        Repeater {
//            model: componentManager.groups
//            delegate: GroupPane {
//                Layout.alignment: Qt.AlignCenter
//                componentGroup: group
//                editor: componentEditor
//                onRemoveGroup: {
//                    componentManager.groups.removeGroup(index)
//                }
//            }
//        }
//        Item {
//            Layout.alignment: Qt.AlignCenter
//            Layout.minimumWidth: parent.width/8
//            Layout.minimumHeight: parent.height/5
//            AddButton {
//                anchors.centerIn: parent
//                text: "New Group"
//                onClicked: newGroupPopup.open()
//            }
//        }
//    }

//    ComponentEditor {
//        id: componentEditor
//        componentManager: page.componentManager
//    }
//    NewGroupPopup {
//        id: newGroupPopup
//        onAdd: page.componentManager.addGroup(groupName)
//    }
}
