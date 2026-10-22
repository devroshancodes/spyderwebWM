import QtQuick
import Quickshell
import Quickshell.Wayland

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            WlrLayershell.layer: WlrLayer.Background
						exclusionMode: ExclusionMode.Ignore
            anchors {
                top: true
                bottom: true
                left: true
                right: true
            }

            color: "#11111b"

            Image {
                anchors.fill: parent
                // Dynamically uses /home/spyx instead of a hardcoded username
                source: "file://" + Quickshell.env("HOME") + "/pictures/Pictures/a_bird_on_a_branch.jpg"
                fillMode: Image.PreserveAspectCrop
                asynchronous: true
                cache: false
            }
        }
    }
}
