import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: barWindow
		
    color: "transparent"
		
		required property bool barOnRight
    required property int barWidth

    signal openSettings()

    WlrLayershell.layer: WlrLayer.Top

    anchors {
        top: true
        bottom: true
        left: !barOnRight
        right: barOnRight
    }
		exclusiveZone: barWidth
		exclusionMode: ExclusionMode.Ignore
    implicitWidth: barWidth

    Rectangle {
        anchors.fill: parent
				color: "#1a1e1e2e" 
				//border.color: Qt.rgba(1, 1, 1, 0.12)
        border.width: 1

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: barWindow.barWidth * 0.2
            spacing: barWindow.barWidth * 0.25

            BarWidgetContainer {
                Layout.fillWidth: true
                Text { text: "⚡"; font.pixelSize: barWindow.barWidth * 0.4 }
							}

            Item { Layout.fillHeight: true }

            //CpuWidget { Layout.alignment: Qt.AlignHCenter }

            Item { Layout.fillHeight: true }

            BarWidgetContainer {
                Layout.fillWidth: true
                onClicked: barWindow.openSettings()
                Text { text: "⚙"; color: "#cdd6f4"; font.pixelSize: barWindow.barWidth * 0.4 }
            }
        }
    }
}
