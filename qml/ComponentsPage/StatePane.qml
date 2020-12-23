import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import "../"
import "../editor/"
import "../text/"
import "../buttons/"

Pane {
    property string name: ""
    property string current: ""
    signal close()

    Material.elevation: 5
    ColumnLayout {
        anchors.fill: parent
        RowLayout {
            Layout.fillWidth: true
            EditorTextInput {
                id: stateNameInput
                text: name
                placeholderText: "State Name"
            }
            CloseButton {
                Layout.margins: -15
                Layout.alignment: Qt.AlignRight
                scale: 0.7
                padding: 5
                onClicked: close()
            }
        }

        EditorTextInput {
            id: supplyCurrentInput
            text: current
            placeholderText: "Current [mA]"
            validator: DoubleValidator { bottom: 0 }
        }
    }
}
