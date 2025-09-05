import QtQuick
import QtQuick.Controls.FluentWinUI3

ApplicationWindow {
    id: root
    width: 1200
    height: 800
    visible: true
    title: "Nabework"
    color: Style.color.background
    flags: Qt.FramelessWindowHint | Qt.Window

    minimumWidth: 1024
    minimumHeight: 450

    maximumWidth: 1440
    maximumHeight: 900

    Component.onCompleted: {
        x = Screen.width / 2 - width / 2
        y = Screen.height / 2 - height / 2
        Style.init();
        AppBus.windowClosed.connect(root.close);
        AppBus.windowRestored.connect(function() {
            if (root.visibility === Window.Maximized) {
                root.showNormal()
            } else {
                root.showMaximized()
            }
        });
        AppBus.windowMinimized.connect(root.showMinimized);
        AppBus.windowDragged.connect(root.startSystemMove);
    }

    palette: Palette {
        // Window & background areas
        window: Style.color.background                // Main window background
        windowText: Style.color.text                   // Text on window background

        // Base control background (menus, text fields, etc.)
        base: Style.color.surface
        // text: Style.color.text                         // Main text on base backgrounds

        // Buttons
        button: Style.color.accent
        buttonText: Style.color.accentContrast

        // Highlights & selection
        highlight: Style.color.accent
        highlightedText: Style.color.accentContrast

        // Borders & midtones
        mid: Style.color.border
        midlight: Qt.lighter(Style.color.border, 1.4)  // Slightly lighter divider
        dark: Qt.darker(Style.color.border, 1.4)       // Darker version of border
        light: Qt.lighter(Style.color.surface, 1.4)    // Light surface shade
        shadow: Qt.darker(Style.color.background, 1.4) // Shadow color

        // Tooltips
        toolTipBase: Style.color.surface
        toolTipText: Style.color.text

        // Links
        link: Style.color.accent
        linkVisited: Qt.darker(Style.color.accent, 1.2)

        // Alternate row backgrounds
        alternateBase: Qt.lighter(Style.color.surface, 1.1)
    }

    App {
        anchors.fill: parent
    }

    // --- Resize handles using startSystemResize() ---
    Rectangle {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 6
        color: "transparent"
    }

    Rectangle {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 6
        color: "transparent"
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.SizeHorCursor
            onPressed: function(mouse) {
                root.startSystemResize(Qt.RightEdge, mouse)
            }
        }
    }

    Rectangle {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 6
        color: "transparent"
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.SizeVerCursor
            onPressed: function(mouse) {
                root.startSystemResize(Qt.BottomEdge, mouse)
            }
        }
    }

    Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 6
        color: "transparent"
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.SizeVerCursor
            onPressed: function(mouse) {
                root.startSystemResize(Qt.TopEdge, mouse)
            }
        }
    }


}
