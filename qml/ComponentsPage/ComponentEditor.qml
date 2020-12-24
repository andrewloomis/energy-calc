import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2
import energycalc.state_model 1.0
import "../text/"
import "../buttons/"
import "../editor/"

Popup {
    property var powerSupplies
    signal addComponent(string name, int quantity, var stateModel)

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
        quantityInput.clear()
        stateModel.clear()
    }

    function isFilledOut()
    {
        if (nameInput.text !== "" &&
                quantityInput.text !== "")
        {
            return true
        }
        else return false
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        TitleText {
            text: "New Component"
        }

        EditorTextInput {
            id: nameInput
            placeholderText: "Name"
        }

        EditorTextInput {
            id: quantityInput
            placeholderText: "Quantity"
            validator: IntValidator { bottom: 0 }
        }

        EditorComboOption {
            id: powerSupplyInput
            label: "Power Supply"
            options: powerSupplies
        }

        LabelText {
            text: "States"
        }
        ScrollView {
            id: scrollView
            Layout.preferredHeight: listView.count > 0 ? 200 : 100
            Layout.fillWidth: true
            clip: true

            ColumnLayout {
                id: column
                anchors.fill: parent

                StateModel {
                    id: stateModel
                }
                ListView {
                    id: listView
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredHeight: 120 * count
                    Layout.preferredWidth: scrollView.width
                    spacing: 10

                    model: stateModel
                    delegate: StatePane {
                        width: scrollView.width
                        onRemove: {
                            stateModel.removeState(index)
                        }
                        onNameChanged: {
                            stateModel.editStateName(index,name)
                        }
                        onCurrentChanged: {
                            stateModel.editStateCurrent(index,current)
                        }
                    }
                }
                AddButton {
                    scale: 0.7
                    Layout.alignment: Qt.AlignCenter
                    onClicked: {
                        stateModel.addNewEditorState()
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
            Layout.topMargin: 20

            spacing: 20

            MessageDialog {
                id: notCompleteMessage
                title: "Cannot add component"
                icon: StandardIcon.Warning
                text: "Please finish filling out component details"
            }

            StyledTextButton {
                text: "Add"
                onPressed: {
                    if(isFilledOut())
                    {
                        addComponent(nameInput.text, parseInt(quantityInput.text),
                                     stateModel)
                    }
                    else notCompleteMessage.open()
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



