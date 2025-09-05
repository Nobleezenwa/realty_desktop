import Realtydesktop
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

// Dashboard.qml
ScrollView {
    id: rootScroll

    Column {
        width: rootScroll.width
        spacing: Style.spacing.medium
        bottomPadding: Style.spacing.large

        //title
        Text {
            text: qsTr("Dashboard")
            font.pixelSize: Style.fontSize.large
            font.bold: true
            width: parent.width
            elide: Text.ElideRight
            color: Style.color.text
            topPadding: Style.spacing.large
            leftPadding: Style.spacing.large
            rightPadding: Style.spacing.large
        }

        //hero
        RoundedImage {
            width: parent.width - 20
            height: 256
            radius: Style.radius.large
            source: "qrc:/images/hero.jpg"
            anchors.horizontalCenter: parent.horizontalCenter
            shade: "#7f000000"
            anchors.topMargin: -20
            Column {
                width: parent.width
                anchors.centerIn: parent
                spacing: Style.spacing.small
                leftPadding: 60
                rightPadding: 60

                Text {
                    text: "Making communities safer, smarter, and more connected."
                    font.bold: true
                    font.pixelSize: Style.fontSize.large
                    color: "#fff"
                    wrapMode: Text.WordWrap
                    width: parent.width * 0.3
                }

                Text {
                    text: "Image Credit: Group of people sunset by Dilan"
                    font.pixelSize: Style.fontSize.small
                    color: "#fff"
                    width: parent.width * 0.3
                    elide: Text.ElideLeft
                }
            }

        }

        //Quick links
        Column {
            width: parent.width - (Style.spacing.large * 2)
            leftPadding: Style.spacing.large
            rightPadding: Style.spacing.large
            bottomPadding:  Style.spacing.large
            spacing: Style.spacing.medium

            Text {
                text: qsTr("Quick Links")
                font.pixelSize: Style.fontSize.medium
                font.bold: true
                width: parent.width
                elide: Text.ElideRight
                color: Style.color.text
            }

            RowLayout {
                width: parent.width
                spacing: Style.spacing.medium
                QuickLinkCard {
                    width: parent.width * 0.25 - 15;
                    title: "Support";
                    description: "Access help resources, FAQs, and contact options for assistance."
                }
                QuickLinkCard {
                    width: parent.width * 0.25 - 15;
                    title: "Billing";
                    description: "View invoices, update payment methods, and manage your subscription."
                }
                QuickLinkCard {
                    width: parent.width * 0.25 - 15;
                    title: "Site Configuration";
                    description: "Customize and manage site-wide settings, layouts, and features."
                }
                QuickLinkCard {
                    width: parent.width * 0.25 - 15;
                    title: "Settings";
                    description: "Adjust your personal preferences, account details, and notifications."
                }
            }
        }

        //Notifications
        Text {
            text: qsTr("Notifications")
            font.pixelSize: Style.fontSize.medium
            font.bold: true
            width: parent.width
            elide: Text.ElideRight
            color: Style.color.text
            leftPadding: Style.spacing.large
            rightPadding: Style.spacing.large
        }
        Rectangle {
            width: parent.width - 40
            border.width: 2
            border.color: Style.color.surface
            radius: Style.radius.medium
            color: "transparent"

            height: notifications.implicitHeight + Style.spacing.large //

            Notifications {
                id: notifications
                width: parent.width - Style.spacing.large
                anchors.horizontalCenter: parent.horizontalCenter
            }

            anchors.horizontalCenter: parent.horizontalCenter
        }

    }
}
