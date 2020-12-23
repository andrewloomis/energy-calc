import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "buttons/"
Pane {
    signal startNewDesign(string name)

    ColumnLayout {
        anchors.centerIn: parent
        StyledTextButton {
            Layout.alignment: Qt.AlignHCenter
            text: "Start New Design"
            onClicked: newDesignPopup.open()
        }
        StyledTextButton {
            Layout.alignment: Qt.AlignHCenter
            text: "Open Existing Design"
        }
    }
    NewDesignPopup {
        id: newDesignPopup
        onStart: startNewDesign(name)
    }
}
