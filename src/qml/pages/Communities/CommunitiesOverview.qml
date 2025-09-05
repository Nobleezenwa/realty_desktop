import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtCharts

Column {
    bottomPadding: Style.spacing.large
    GridLayout {
        id: grid
        width: parent.width
        height: 768
        columns: 12
        rows: 12
        columnSpacing: Style.spacing.medium
        rowSpacing: Style.spacing.medium

        //Members
        Rectangle {
            property int col: 0
            property int row: 0
            property int cs: 3
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
            implicitWidth: (cs / 12) * (grid.width) - Style.spacing.medium
            implicitHeight: (rs / 12) * grid.height

            clip: true
            property string heading: qsTr("Total members")
            property string valueText: "6,278"
            property string subText: "▲ 0.2% vs last 30d"
            property string content: ""

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: Style.spacing.medium
                spacing: Style.spacing.small

                Label {
                    text: parent.parent.heading
                    font.pixelSize: Style.fontSize.medium
                    color: Style.color.text
                    opacity: 0.65
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
                        axisY: ValueAxis { gridVisible: false;  labelsColor: Style.color.text }
                        name: "Line"
                        color: "orange"
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

        //Sentiment score
        Rectangle {
            property int col: 0
            property int row: 6
            property int cs: 3
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
            implicitWidth: (cs / 12) * (grid.width) - Style.spacing.medium
            implicitHeight: (rs / 12) * grid.height

            clip: true
            property string heading: qsTr("Sentiment score")
            property string valueText: "+30%"
            property string subText: "▲ positive since last 30d"
            property string content: ""

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: Style.spacing.medium
                spacing: Style.spacing.small

                Label {
                    text: parent.parent.heading
                    font.pixelSize: Style.fontSize.medium
                    color: Style.color.text
                    opacity: 0.65
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

                    PieSeries {
                        id: pieSeries
                        PieSlice { label: "Positive"; value: 60; color: "cyan" }
                        PieSlice { label: "Negative"; value: 20; color: "pink" }
                        PieSlice { label: "Neutral"; value: 20; color: "gray" }
                    }
                }
            }
        }

        //Communities
        Rectangle {
            property int col: 3
            property int row: 0
            property int cs: 3
            property int rs: 3
            property color tint: Style.color.surface

            radius: Style.radius.medium
            color: "transparent"
            border.color: tint
            border.width: 2

            Layout.column: col
            Layout.row: row
            Layout.columnSpan: cs
            Layout.rowSpan: rs
            implicitWidth: (cs / 12) * (grid.width) - Style.spacing.medium
            implicitHeight: (rs / 12) * grid.height

            clip: true
            property string heading: qsTr("Communities")
            property string valueText: "12"
            property string subText: "Total"
            property string content: "Number of communities managed"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: Style.spacing.medium
                spacing: Style.spacing.small

                Label {
                    text: parent.parent.heading
                    font.pixelSize: Style.fontSize.medium
                    color: Style.color.text
                    opacity: 0.65
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
                        color: Style.color.text
                    }
                }

                Item { Layout.fillWidth: true; Layout.fillHeight: true }

                Text {
                    text: parent.parent.content
                    font.pixelSize: Style.fontSize.small
                    color: Style.color.text
                    opacity: 0.85
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true;
                }
            }
        }

        //Businesses
        Rectangle {
            property int col: 6
            property int row: 0
            property int cs: 3
            property int rs: 3
            property color tint: Style.color.surface

            radius: Style.radius.medium
            color: "transparent"
            border.color: tint
            border.width: 2

            Layout.column: col
            Layout.row: row
            Layout.columnSpan: cs
            Layout.rowSpan: rs
            implicitWidth: (cs / 12) * (grid.width) - Style.spacing.medium
            implicitHeight: (rs / 12) * grid.height

            clip: true
            property string heading: qsTr("Businesses")
            property string valueText: "42"
            property string subText: "▲ 0.2% vs last 30d"
            property string content: "Total active community businesses"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: Style.spacing.medium
                spacing: Style.spacing.small

                Label {
                    text: parent.parent.heading
                    font.pixelSize: Style.fontSize.medium
                    color: Style.color.text
                    opacity: 0.65
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

                Item { Layout.fillWidth: true; Layout.fillHeight: true }

                Text {
                    text: parent.parent.content
                    font.pixelSize: Style.fontSize.small
                    color: Style.color.text
                    opacity: 0.85
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true;
                }
            }
        }

        //Engagement rate
        Rectangle {
            property int col: 9
            property int row: 0
            property int cs: 3
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
            implicitWidth: (cs / 12) * (grid.width) - Style.spacing.medium
            implicitHeight: (rs / 12) * grid.height

            clip: true
            property string heading: qsTr("Engagement Rate")
            property string valueText: "6,278"
            property string subText: "▲ 0.2% vs last 30d"
            property string content: ""

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: Style.spacing.medium
                spacing: Style.spacing.small

                Label {
                    text: parent.parent.heading
                    font.pixelSize: Style.fontSize.medium
                    color: Style.color.text
                    opacity: 0.65
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

                    BarSeries {
                        axisY: ValueAxis{ gridVisible: false; labelsColor: Style.color.text  }
                        axisX: BarCategoryAxis { gridVisible: false; labelsColor: Style.color.text; categories: ["2007", "2008", "2009", "2010", "2011", "2012" ] }
                        BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8]; color: Style.color.danger }
                    }
                }
            }
        }

        //Devices
        Rectangle {
            property int col: 9
            property int row: 6
            property int cs: 3
            property int rs: 3
            property color tint: Style.color.surface

            radius: Style.radius.medium
            color: "transparent"
            border.color: tint
            border.width: 2

            Layout.column: col
            Layout.row: row
            Layout.columnSpan: cs
            Layout.rowSpan: rs
            implicitWidth: (cs / 12) * (grid.width) - Style.spacing.medium
            implicitHeight: (rs / 12) * grid.height

            clip: true
            property string heading: qsTr("Devices")
            property string valueText: "352"
            property string subText: "▲ 0.2% vs last 30d"
            property string content: "Total active devices"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: Style.spacing.medium
                spacing: Style.spacing.small

                Label {
                    text: parent.parent.heading
                    font.pixelSize: Style.fontSize.medium
                    color: Style.color.text
                    opacity: 0.65
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

                Item { Layout.fillWidth: true; Layout.fillHeight: true }

                Text {
                    text: parent.parent.content
                    font.pixelSize: Style.fontSize.small
                    color: Style.color.text
                    opacity: 0.85
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true;
                }
            }
        }

        //Revenue
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
            implicitWidth: (cs / 12) * (grid.width) - Style.spacing.medium
            implicitHeight: (rs / 12) * grid.height

            clip: true
            property string heading: qsTr("Revenue")
            property string valueText: "$34,906,278"
            property string subText: "▲ 30.2% in last 30d"
            property string content: ""

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: Style.spacing.medium
                spacing: Style.spacing.small

                Label {
                    text: parent.parent.heading
                    font.pixelSize: Style.fontSize.medium
                    color: Style.color.text
                    opacity: 0.65
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

        //Tickets
        Rectangle {
            property int col: 3
            property int row: 9
            property int cs: 3
            property int rs: 3
            property color tint: Style.color.surface

            radius: Style.radius.medium
            // color: tint
            color: "transparent"
            border.color: tint
            border.width: 2

            Layout.column: col
            Layout.row: row
            Layout.columnSpan: cs
            Layout.rowSpan: rs
            implicitWidth: (cs / 12) * (grid.width) - Style.spacing.medium
            implicitHeight: (rs / 12) * grid.height

            clip: true
            property string heading: qsTr("Tickets")
            property string valueText: "352"
            property string subText: "▲ 0.2% vs last 30d"
            property string content: "Total open tickets"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: Style.spacing.medium
                spacing: Style.spacing.small

                Label {
                    text: parent.parent.heading
                    font.pixelSize: Style.fontSize.medium
                    color: Style.color.text
                    opacity: 0.65
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

                Item { Layout.fillWidth: true; Layout.fillHeight: true }

                Text {
                    text: parent.parent.content
                    font.pixelSize: Style.fontSize.small
                    color: Style.color.text
                    opacity: 0.85
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true;
                }
            }
        }

        //Debts
        Rectangle {
            property int col: 6
            property int row: 9
            property int cs: 6
            property int rs: 3
            property color tint: Style.color.surface

            radius: Style.radius.medium
            // color: tint
            color: "transparent"
            border.color: tint
            border.width: 2

            Layout.column: col
            Layout.row: row
            Layout.columnSpan: cs
            Layout.rowSpan: rs
            implicitWidth: (cs / 12) * (grid.width) - Style.spacing.medium
            implicitHeight: (rs / 12) * grid.height

            clip: true
            property string heading: qsTr("Debts")
            property string valueText: "$34,906,278"
            property string subText: "▲ 30.2% in last 30d"
            property string content: ""

            RowLayout {
                anchors.fill: parent
                anchors.margins: Style.spacing.medium
                spacing: Style.spacing.small

                Column {
                    spacing: Style.spacing.small
                    Label {
                        text: parent.parent.parent.heading
                        font.pixelSize: Style.fontSize.medium
                        color: Style.color.text
                        opacity: 0.65
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true;
                        bottomPadding: Style.spacing.small
                    }
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
                        color: Style.color.danger
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
}
