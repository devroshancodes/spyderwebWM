//@ pragma DropExpensiveFonts
//@ pragma NativeTextRendering

import QtQuick
import Quickshell

Scope {
    id: root

    // Global state for spyderweb
    property bool barOnRight: false
    property int barWidth: 32

    // 1. Native Background Wallpaper Engine
    WallpaperEngine {}

    // 2. Vertical Frosted Glass Sidebar
    Bar {
        id: mainBar
        barOnRight: root.barOnRight
        barWidth: root.barWidth
        // Toggle visibility directly on click
        onOpenSettings: settingsWindow.visible = !settingsWindow.visible
    }

    // 3. Settings Window (Instantiated directly with static anchor)
    SettingsWindow {
        id: settingsWindow
        anchor.window: mainBar
        visible: false
        barOnRight: root.barOnRight
        onBarToggleRequested: (newState) => {
            root.barOnRight = newState;
        }
    }
}
