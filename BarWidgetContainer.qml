import QtQuick
import QtQuick.Layouts

Rectangle {
    id: container

    default property alias content: innerLayout.children
    signal clicked()

    implicitWidth: 44
    implicitHeight: 44
    radius: 10
    color: mouseArea.containsMouse ? Qt.rgba(1, 1, 1, 0.15) : Qt.rgba(0.18, 0.18, 0.24, 0.6)
    border.color: mouseArea.containsMouse ? "#cba6f7" : Qt.rgba(1, 1, 1, 0.1)
    border.width: 1

    Behavior on color { ColorAnimation { duration: 120 } }

    ColumnLayout {
        id: innerLayout
        anchors.centerIn: parent
        spacing: 2
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: container.clicked()
    }
}
