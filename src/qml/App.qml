import Realtydesktop
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    id: app

    property string currentRoute: "Leads"

    function mapRouteToPage (route) {
        return route === "Dashboard" ? "qrc:/pages/Dashboard/Dashboard.qml"
                                     : route === "Properties" ? "qrc:/pages/Properties/Properties.qml"
                                     : route === "Communities" ? "qrc:/pages/Communities/Communities.qml"
                                     : route === "Marketing" ? "qrc:/pages/Marketing/Marketing.qml"
                                     : route === "Leads" ? "qrc:/pages/Leads/Leads.qml"
                                     : route === "Support" ? "qrc:/pages/Support/Support.qml"
                                     : route === "Personnel" ? "qrc:/pages/Personnel/Personnel.qml"
                                     : route === "Payments" ? "qrc:/pages/Payments/Payments.qml"
                                     : route === "Configuration" ? "qrc:/pages/Configuration/Configuration.qml"
                                     : route === "ProfileSettings" ? "qrc:/pages/ProfileSettings/ProfileSettings.qml"
                                     : "";
    }

    anchors.fill: parent
    color: Style.color.background

    // Sidebar (fixed)
    Sidebar {
        z: 2
        id: sidebar
        width: 220
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        currentRoute: parent.currentRoute
        onNavigate: (route) => {
            currentRoute = route;
            pageLoader.source = app.mapRouteToPage(route);
        }
    }

    // Header container
    Item {
        z: 1
        id: header
        height: 50
        anchors.left: sidebar.right
        anchors.right: parent.right
        anchors.top: parent.top

        Rectangle {
            // anchors.fill: parent
            anchors.left: parent.left
            anchors.right: parent.right
            height: 50
            color: Style.color.accent
        }

        // Header content
        RowLayout {
            anchors.fill: parent
            anchors.margins: 8
            spacing: Style.spacing.small

            // Search bar (expands to fill space)
            TextField {
                placeholderText: "Search..."
                Layout.fillWidth: true
                Layout.maximumWidth: 500
                background: null
            }

            Rectangle {
                Layout.fillWidth: true
            }

            // Icons
            ToolButton {
                icon.source: Style.isDark ? "qrc:/images/sun.svg"
                                          : "qrc:/images/moon.svg"
                icon.color: Style.color.accentContrast
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor  // Hand cursor when hovering
                    onClicked: Style.toggle()
                }
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Style")
                ToolTip.delay: 1000
            }
            ToolButton {
                icon.source: "qrc:/images/info.svg"
                icon.color: Style.color.accentContrast
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor  // Hand cursor when hovering
                }
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Help & Support")
            }
            ToolButton {
                icon.source: "qrc:/images/minus.svg"
                icon.color: Style.color.accentContrast
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor  // Hand cursor when hovering
                    onClicked: AppBus.windowMinimized()
                }
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Minimize")
            }
            ToolButton {
                icon.source: "qrc:/images/window-restore.svg"
                icon.color: Style.color.accentContrast
                icon.width: 14
                icon.height: 14
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor  // Hand cursor when hovering
                    onClicked: AppBus.windowRestored()
                }
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Restore")
            }
            ToolButton {
                icon.source: "qrc:/images/x.svg"
                icon.color: Style.color.accentContrast
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor  // Hand cursor when hovering
                    onClicked: AppBus.windowClosed()
                }
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Close")
            }
        }
    }

    // Body (fixed under header)
    Loader {
        id: pageLoader
        z: 0
        anchors.top: header.bottom
        anchors.left: sidebar.right
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        source: app.mapRouteToPage(currentRoute)
    }

}
