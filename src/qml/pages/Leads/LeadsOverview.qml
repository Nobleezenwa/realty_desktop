import Realtydesktop
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtCharts

Column {
    width: parent.width
    spacing: Style.spacing.medium

    GridLayout {
        id: grid
        width: parent.width
        columns: 3
        columnSpacing: Style.spacing.medium
        rowSpacing: Style.spacing.medium

        Repeater {
            model: [
                {
                  "heading": "Sales",
                  "valueText": "13,234",
                  "subText": "▲ 0.2% vs last 30d",
                },
                {
                  "heading": "Rentals",
                  "valueText": "1,234",
                  "subText": "▼ 0.2% vs last 30d",
                },
                {
                  "heading": "Others",
                  "valueText": "234",
                  "subText": "▼ 0.2% vs last 30d",
                },
            ]
            delegate: Component {
                Rectangle {
                    radius: 10
                    color: "transparent"
                    border.color: Style.color.surface
                    border.width: 2

                    implicitWidth: (1 / grid.column) * (parent.width) - Style.spacing.medium
                    implicitHeight: 115

                    clip: true

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: Style.spacing.medium
                        spacing: Style.spacing.small

                        Label {
                            text: modelData.heading
                            font.pixelSize: Style.fontSize.medium
                            color: Style.color.text
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true;
                        }

                        Column {
                            spacing: Style.spacing.small
                            Label {
                                text: modelData.valueText
                                font.pixelSize: Style.fontSize.xxLarge
                                font.bold: true
                                color: Style.color.text
                            }
                            Label {
                                text: modelData.subText
                                font.pixelSize: Style.fontSize.small
                                color: modelData.subText.indexOf("▲") !== -1 ? Style.color.success : Style.color.danger
                            }
                        }

                    }
                }
            }
        }



    }

    Rectangle {
        property int col: 3
        property int row: 3
        property int cs: 6
        property int rs: 6
        property color tint: Style.color.surface

        radius: Style.radius.medium
        color: "transparent"
        border.color: tint
        border.width: 2

        Layout.column: col
        Layout.row: row
        Layout.columnSpan: cs
        Layout.rowSpan: rs
        width: parent.width
        height: 450

        clip: true
        property string heading: qsTr("Total Leads")
        property string valueText: "94,906,278"
        property string subText: "▲ 30.2% in last 30d"

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: Style.spacing.medium
            spacing: Style.spacing.small

            Label {
                text: parent.parent.heading
                font.pixelSize: Style.fontSize.medium
                color: Style.color.text
                wrapMode: Text.WordWrap
                Layout.fillWidth: true;
            }

            Column {
                spacing: Style.spacing.small
                Label {
                    text: parent.parent.parent.valueText
                    font.pixelSize: Style.fontSize.xxLarge
                    font.bold: true
                    color: Style.color.text
                }
                Label {
                    visible: parent.parent.parent.subText.length > 0
                    text:  parent.parent.parent.subText
                    font.pixelSize: Style.fontSize.small
                    color: parent.parent.parent.subText.indexOf("▲") !== -1 ? Style.color.success : Style.color.danger
                }
            }

            ChartView {
                Layout.fillWidth: true
                Layout.fillHeight: true
                antialiasing: true
                backgroundColor: "transparent"
                titleColor: Style.color.text
                legend.visible: false

                LineSeries {
                    axisX: ValueAxis { gridVisible: false; labelsColor: Style.color.text }
                    axisY: ValueAxis { gridVisible: false; labelsColor: Style.color.text }
                    name: "Line"
                    color: Style.color.success
                    pointLabelsColor: Style.color.text
                    XYPoint { x: 0; y: 0 }
                    XYPoint { x: 1.1; y: 2.1 }
                    XYPoint { x: 1.9; y: 3.3 }
                    XYPoint { x: 2.1; y: 2.1 }
                    XYPoint { x: 2.9; y: 4.9 }
                    XYPoint { x: 3.4; y: 3.0 }
                    XYPoint { x: 4.1; y: 3.3 }
                }
            }
        }
    }



}
