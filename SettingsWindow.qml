import QtQuick
import QtQuick.Layouts
import Quickshell

PopupWindow {
    id: settingsWindow

    // 1. Required property to accept the sidebar reference from shell.qml
    property var parentWindow: null
    anchor.window: parentWindow

    property bool barOnRight: false
    signal barToggleRequested(bool newState)

    visible: true
    implicitWidth: 360
    implicitHeight: 240
    color: "#181825"

    Rectangle {
        anchors.fill: parent
        radius: 12
        border.color: "#45475a"
        border.width: 1
        color: "transparent"

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 16

            Text {
                text: "spyderweb settings"
                color: "#cba6f7"
                font.bold: true
                font.pixelSize: 16
            }

            RowLayout {
                Layout.fillWidth: true
                Text { text: "Dock Bar on Right Side"; color: "#cdd6f4"; Layout.fillWidth: true }

                Rectangle {
                    implicitWidth: 40
                    implicitHeight: 22
                    radius: 11
                    color: settingsWindow.barOnRight ? "#a6e3a1" : "#313244"

                    Rectangle {
                        x: settingsWindow.barOnRight ? 20 : 2
                        y: 2
                        implicitWidth: 18
                        implicitHeight: 18
                        radius: 9
                        color: "#11111b"
                        Behavior on x { NumberAnimation { duration: 120 } }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: settingsWindow.barToggleRequested(!settingsWindow.barOnRight)
                    }
                }
            }
        }
    }
}
