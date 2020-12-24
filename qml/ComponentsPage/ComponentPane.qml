import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import energycalc.state_model 1.0
import "../"
import "../editor/"
import "../text/"
import "../buttons/"

Pane {
    property string componentName
    property StateModel componentStateModel

    signal remove()

    Material.elevation: 5
    ColumnLayout {
        anchors.fill: parent
        RowLayout {
            Layout.fillWidth: true
            LabelText {
                text: componentName
//                Layout.alignment: Qt.AlignLeft
            }
            CloseButton {
                Layout.margins: -15
                Layout.alignment: Qt.AlignRight
                scale: 0.7
                padding: 5
                onClicked: remove()
            }
        }

        Repeater {
            model: componentStateModel
            delegate: LabelText {
                text: name
                Layout.alignment: Qt.AlignLeft
            }
        }
//        ColumnLayout {
//            Layout.fillWidth: true



//        }
    }
}
