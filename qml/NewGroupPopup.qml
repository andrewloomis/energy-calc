import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import energycalc.component_manager 1.0
import "text/"
import "buttons/"
import "editor/"

Popup {
    signal add(string groupName)

    id: popup
    parent: Overlay.overlay
    anchors.centerIn: parent
    closePolicy: Popup.CloseOnEscape
    modal: true
    dim: true
    padding: 30
    width: parent.width/3

    Overlay.modal: Rectangle {
        color: "#F0524438"
    }

    onClosed: {
        nameInput.clear()
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        TitleText {
            text: "New Group"
        }

        EditorTextInput {
            id: nameInput
            placeholderText: "Name"
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
            Layout.topMargin: 20

            spacing: 20

            StyledTextButton {
                text: "Add"
                onPressed: {
                    add(nameInput.text)
                    popup.close()
                }
            }

            StyledTextButton {
                text: "Close"
                onPressed: {
                    popup.close()
                }
            }
        }
    }

    background: Pane {
        Material.background: "#43312B"
        Material.elevation: 10
        padding: 10
    }
}



