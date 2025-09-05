import Realtydesktop
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Column {
    width: parent.width
    spacing: Style.spacing.medium

    GridLayout {
        id: grid
        width: parent.width
        columns: 4
        columnSpacing: Style.spacing.medium
        rowSpacing: Style.spacing.medium

        Repeater {
            model: [
                {
                  "platformName": "Blog",
                  "platformLogo": "qrc:/images/blog.png",
                  "engagements": "13,234",
                  "percentile": 50,
                  "tint": Style.color.accent
                },
                {
                  "platformName": "Email",
                  "platformLogo": "qrc:/images/email.png",
                  "engagements": "4,234",
                  "percentile": 30,
                  "tint": "#ffd401"
                },
                {
                  "platformName": "SMS",
                  "platformLogo": "qrc:/images/sms.png",
                  "engagements": "2,234",
                  "percentile": 30,
                  "tint": "#c41230"
                },
                {
                  "platformName": "Google",
                  "platformLogo": "qrc:/images/google.png",
                  "engagements": "1,234",
                  "percentile": 30,
                  "tint": "#3f80ec"
                },
                {
                  "platformName": "Facebook",
                  "platformLogo": "qrc:/images/facebook.png",
                  "engagements": "234",
                  "percentile": 10,
                  "tint": "#475993"
                },
                {
                  "platformName": "X",
                  "platformLogo": "qrc:/images/x.png",
                  "engagements": "234",
                  "percentile": 10,
                  "tint": "#494949"
                },
                {
                  "platformName": "Tiktok",
                  "platformLogo": "qrc:/images/tiktok.png",
                  "engagements": "2,345",
                  "percentile": 40,
                  "tint": "#ff2c55"
                },
                {
                  "platformName": "LinkedIn",
                  "platformLogo": "qrc:/images/linkedIn.png",
                  "engagements": "345",
                  "percentile": 25,
                  "tint": "#007ab5"
                },
                {
                  "platformName": "Instagram",
                  "platformLogo": "qrc:/images/instagram.png",
                  "engagements": "6,345",
                  "percentile": 25,
                  "tint": "#bb319f"
                }
            ]
            delegate: Component {
                Rectangle {
                    radius: 10
                    color: "transparent"
                    border.color: Style.color.surface
                    border.width: 2

                    implicitWidth: (1 / grid.column) * (parent.width) - Style.spacing.medium
                    implicitHeight: 150

                    clip: true

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: Style.spacing.medium
                        spacing: Style.spacing.small

                        Row {
                            width: parent.width
                            spacing: Style.spacing.small

                            Image {
                                width: 16
                                height: 16
                                source: modelData.platformLogo
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            Label {
                                text: modelData.platformName
                                font.pixelSize: Style.fontSize.medium
                                color: Style.color.text
                                wrapMode: Text.WordWrap
                                Layout.fillWidth: true;
                            }
                        }

                        Column {
                            spacing: Style.spacing.small
                            Label {
                                text: modelData.engagements
                                font.pixelSize: Style.fontSize.xxLarge
                                font.bold: true
                                color: Style.color.text
                            }
                            Label {
                                text:  qsTr("Engagements")
                                font.pixelSize: Style.fontSize.small
                                color: Style.color.text
                                opacity: 0.65
                            }
                        }

                        Item { Layout.fillWidth: true; Layout.fillHeight: true }

                        Text {
                            text: modelData.percentile + "%"
                            font.pixelSize: Style.fontSize.small
                            color: Style.color.text
                            opacity: 0.65
                            Layout.fillWidth: true;
                            horizontalAlignment: Text.AlignRight
                        }
                        Rectangle {
                            color: Style.color.surface
                            Layout.fillWidth: true;
                            height: 10
                            radius: 5
                            clip: true
                            Rectangle {
                                color: modelData.tint
                                width: Math.round(parent.width * (modelData.percentile / 100));
                                height: 10
                                radius: 5
                                clip: true
                            }
                        }
                    }
                }
            }
        }

    }
}
