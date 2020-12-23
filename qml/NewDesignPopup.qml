import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import "text/"
import "buttons/"
import "editor/"

Popup {
    signal start(string name)

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
            text: "New Design"
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
                text: "Start"
                onPressed: {
                    start(nameInput.text)
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



