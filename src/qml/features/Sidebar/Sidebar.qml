import Realtydesktop
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    property string currentRoute
    signal navigate(string page)

    width: 220
    color: Style.color.surface

    // Main content layout
    ColumnLayout {
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: bottomBar.top
        }
        spacing: Style.spacing.large
        height: parent.height

        Item {
            id: root

            // Column content
            Column {
                id: content
                anchors.fill: parent
                spacing: 0

                Text {
                    text: "Nabework"
                    font.pixelSize: Style.fontSize.large
                    font.bold: true
                    topPadding: Style.spacing.large
                    leftPadding: Style.spacing.large
                    rightPadding: Style.spacing.large
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    color: Style.color.text
                }
                Text {
                    text: "v1.0.0"
                    font.pointSize: 10
                    color: Style.color.text
                    leftPadding: Style.spacing.large
                    rightPadding: Style.spacing.large
                }
            }

            // Overlay MouseArea
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeAllCursor
                onPressed: function(mouse) {
                    AppBus.windowDragged(mouse)
                }
            }

            // Implicit size comes from column
            implicitWidth: content.implicitWidth
            implicitHeight: content.implicitHeight
        }

        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            padding: Style.spacing.large

            Column {
                width: parent.width
                spacing: Style.spacing.medium
                SidebarMenuItem {
                    text: qsTr("Dashboard");
                    iconSource: "qrc:/images/gauge.svg"
                    onClicked: navigate("Dashboard")
                    active: currentRoute == "Dashboard"
                }
                SidebarMenuItem {
                    text: qsTr("Properties");
                    iconSource: "qrc:/images/building-2.svg"
                    onClicked: navigate("Properties")
                    active: currentRoute == "Properties"
                }
                SidebarMenuItem {
                    text: qsTr("Communities");
                    iconSource: "qrc:/images/network.svg"
                    onClicked: navigate("Communities")
                    active: currentRoute == "Communities"
                }
                SidebarMenuItem {
                    text: qsTr("Marketing");
                    iconSource: "qrc:/images/megaphone.svg"
                    onClicked: navigate("Marketing")
                    active: currentRoute == "Marketing"
                }
                SidebarMenuItem {
                    text: qsTr("Leads");
                    iconSource: "qrc:/images/contact-round.svg"
                    onClicked: navigate("Leads")
                    active: currentRoute == "Leads"
                }
                SidebarMenuItem {
                    text: qsTr("Support");
                    iconSource: "qrc:/images/message-square-text.svg"
                    onClicked: navigate("Support")
                    active: currentRoute == "Support"
                }
                SidebarMenuItem {
                    text: qsTr("Personnel");
                    iconSource: "qrc:/images/users-round.svg"
                    onClicked: navigate("Personnel")
                    active: currentRoute == "Personnel"
                }
                SidebarMenuItem {
                    text: qsTr("Payments");
                    iconSource: "qrc:/images/arrow-right-left.svg"
                    onClicked: navigate("Payments")
                    active: currentRoute == "Payments"
                }
                SidebarMenuItem {
                    text: qsTr("Configuration");
                    iconSource: "qrc:/images/wrench.svg"
                    onClicked: navigate("Configuration")
                    active: currentRoute == "Configuration"
                }
            }
        }
    }

    // Fixed bottom bar
    Column {
        id: bottomBar
        spacing: Style.spacing.small
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        width: parent.width
        bottomPadding:  Style.spacing.medium

        // Rectangle {
        //     height: 1
        //     color: Style.color.text
        //     width: parent.width - (Style.spacing.medium * 2)
        //     anchors.horizontalCenter: parent.horizontalCenter
        // }

        Rectangle {
            height: 40
            radius: 5
            color: btMouseArea.containsMouse? Qt.alpha(Style.color.accent, 0.5) : Style.color.accent
            width: parent.width - (Style.spacing.medium * 2)
            anchors.horizontalCenter: parent.horizontalCenter

            Row {
                id: row
                anchors.fill: parent
                anchors.margins: 8
                spacing: Style.spacing.small
                // verticalAlignment: Qt.AlignVCenter

                // Avatar
                Rectangle {
                    width: 32
                    height: 32
                    radius: width / 2
                    color: "transparent"
                    clip: true

                    Image {
                        anchors.fill: parent
                        source: "qrc:/images/avatar.png"
                        fillMode: Image.PreserveAspectCrop
                        smooth: true
                        antialiasing: true
                    }

                    anchors.verticalCenter: parent.verticalCenter
                }

                // Name + Email column
                Column {
                    id: textColumn
                    spacing: 0
                    anchors.verticalCenter: parent.verticalCenter
                    // Take up all remaining space before gear
                    Layout.fillWidth: true

                    Text {
                        text: "Long Name Example That Will Ellide"
                        color: Style.color.accentContrast
                        font.bold: true
                        elide: Text.ElideRight
                        verticalAlignment: Text.AlignVCenter
                        width: row.width
                              - (row.spacing * 2)
                              - 32 /*avatar*/
                              - 20 /*gear*/
                    }

                    Text {
                        text: "email@example.com"
                        color: Style.color.accentContrast
                        font.pointSize: 10
                        elide: Text.ElideRight
                        verticalAlignment: Text.AlignVCenter
                        width: row.width
                              - (row.spacing * 2)
                              - 32
                              - 20 /*gear*/
                    }
                }

                // Gear icon
                ModSvg {
                    anchors.verticalCenter: parent.verticalCenter
                    width: 20
                    height: 20
                    source: "qrc:/images/settings.svg"
                    replace: Style.color.accentContrast
                    find: "currentColor" // The color in the SVG file to replace
                }
            }

            MouseArea {
                id: btMouseArea
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: navigate("ProfileSettings")
            }

        }

    }
}
