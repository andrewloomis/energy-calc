import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import energycalc.component_model 1.0
import "../"
import "../text/"
import "../buttons/"

ScrollView {
    id: scrollView
    property ComponentModel componentModel

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

            model: componentModel
            delegate: ComponentPane {
                componentName: name
                componentStateModel: stateModel
                width: scrollView.width
                onRemove: {
                    componentModel.removeComponent(index)
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
        onAddComponent: {
            componentModel.addComponent(name, quantity,stateModel)
        }
    }
}
