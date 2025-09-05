import Realtydesktop
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtCharts

Table {
    id: listTable

    width: parent.width - (Style.spacing.large * 2)
    anchors.horizontalCenter: parent.horizontalCenter

    signal open(string propertyId);

    Component {
        id: infoColumn
        Item {
            width: parent.width
            height: childrenRect.height

            RowLayout {
                width: parent.width - (Style.spacing.large * 2)
                height: info.height + avatar.height + (Style.spacing.small * 2)
                spacing: Style.spacing.medium * 2

                Item { height: parent.height; width: Style.spacing.small; }

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

                ColumnLayout {
                    width: parent.width - (40 + (Style.spacing.medium * 2))

                    Column {
                        id: info
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
        "Created At",
        "Engagements",
    ]
    rows: [
        {
            onClicked: function() { listTable.open("5437") },
            cells: [
                {
                    component: infoColumn,
                    props: {image: "qrc:/images/no-image.jpg", name: "This is a sample marketing post. Thank you very much for your cooperation.", address: "Block 6, Road A1, Pentville Estate, Abuja"}
                },
                "2024-02-10 08:00AM",
                "120",
            ],
        },


    ]
}
