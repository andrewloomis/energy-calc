import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import "../"
import "../text"

Column {
    spacing: 5
    property string label
    property var options
    signal optionChosen()

    Layout.fillWidth: true
    LabelText {
        text: label
    }

    ComboBox {
        model: options
        width: parent.width * .9
        onActivated: {
            optionChosen()
        }
        Material.accent: "#FF9800"
    }
}
