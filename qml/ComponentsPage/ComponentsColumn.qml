import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import energycalc.component_group 1.0
import "../"
import "../text/"
import "../buttons/"

ScrollView {
    id: scrollView
    property ComponentGroup compGroup

    Layout.fillHeight: true
    Layout.fillWidth: true
    clip: true

    ColumnLayout {
        id: column
        anchors.fill: parent
        ListView {
            id: listView
            Layout.alignment: Qt.AlignCenter
            Layout.preferredHeight: 120 * count
            Layout.preferredWidth: scrollView.width
            spacing: 10

            model: compGroup.componentModel
            delegate: StatePane {
                width: scrollView.width
                onClose: {
                    editor.stateModel.removeState(index)
                }
            }
        }
        AddButton {
            scale: 0.7
            Layout.alignment: Qt.AlignCenter
            onClicked: {
                editor.open()
            }
        }
    }
    ComponentEditor {
        id: editor
        powerSupplies: ["3.3V"]
//            onAddComponent: {
//                compGroup.componentModel.addComponent(name, quantity)
//            }
    }
}
