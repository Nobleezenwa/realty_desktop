import Realtydesktop
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtCharts

Table {
    id: listTable

    signal open(string communityId);

    Component {
        id: infoColumn
        Item {
            height: childrenRect.height

            RowLayout {
                width: parent.width
                height: Math.max(communityAvatar.height, communityInfo.implicitHeight) + (Style.spacing.medium * 2)
                spacing: Style.spacing.medium * 2

                //avatar
                Item {
                    width: 40
                    height: 40
                    Image {
                        id: avatar
                        width: parent.width
                        height: parent.height
                        // radius: Style.radius.small
                        source: cellData.image
                    }
                }

                //meta data
                ColumnLayout {
                    width: parent.width
                    Layout.fillHeight: true
                    Layout.rightMargin: Style.spacing.medium

                    Column {
                        id: communityInfo
                        width: parent.width
                        Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                        Text {
                            width: parent.width
                            text: cellData.name
                            font.pixelSize: Style.fontSize.medium
                            wrapMode: Text.WordWrap
                            font.bold: true
                            color: Style.color.text
                        }
                        Text {
                            width: parent.width
                            text: cellData.address
                            font.pixelSize: Style.fontSize.small
                            wrapMode: Text.WordWrap
                            color: Style.color.text
                        }
                    }
                }
            }
        }
    }

    Component {
        id: statusPill
        Item {
            height: 50
            Rectangle {
                property string statusText: cellData   // <-- use cellData from Table
                anchors.verticalCenter: parent.verticalCenter
                width: 70
                height: 25
                radius: 14
                color: statusText == "Active" ? Style.color.success
                     : Style.color.danger
                clip: true

                Text {
                    width: parent.width
                    anchors.centerIn: parent
                    text: qsTr(parent.statusText)
                    elide: Text.ElideRight
                    color: "#fff"
                    font.pixelSize: Style.fontSize.small
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }

    columnWidths: [0.6, 0.2, 0.2]
    headers: [
        "Info",
        "Price",
        "Units",
        "Status"
    ]
    rows: [
        {
            onClicked: function() { listTable.open("5437") },
            cells: [
                {
                    component: infoColumn,
                    props: {image: "qrc:/images/sample-prop.jpg", name: "zyxFive Bedroom Fully Detached Duplex", address: "Bloack 6, Road A1, Pentville Estate, Abuja"}
                },
                "$234,098,000",
                "12",
                {component: statusPill, props: "Active"}
            ],
        },

    ]
}
