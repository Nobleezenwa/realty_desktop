import QtQuick
import QtQuick.Controls

Column {
    id: table
    width: parent ? parent.width : 600
    spacing: Style.spacing.small

    property var headers: [] // array of strings or components
    property var rows: []    // array of arrays, inner array = strings or components
    property var columnWidths: [] // optional widths (fraction of total), must match headers length

    // ----- Table Header -----
    Row {
        id: thead
        spacing: Style.spacing.large
        width: parent.width

        Repeater {
            model: table.headers.length
            delegate: Loader {
                width: table.columnWidths.length > index ? parent.width * table.columnWidths[index] : parent.width / table.headers.length
                sourceComponent: typeof table.headers[index] === "string"
                    ? headerText
                    : table.headers[index].component
                property var headerData: typeof table.headers[index] === "string"
                    ? table.headers[index]
                    : table.headers[index].props
            }
        }
    }

    // Default header text component
    Component {
        id: headerText
        Item {
            height: ht.height
            Text {
                id: ht
                width: parent.width
                wrapMode: Text.WordWrap
                text: headerData
                color: Style.color.text
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                bottomPadding: Style.spacing.medium
                // topPadding: Style.spacing.large
            }
        }
    }

    // seperator
    Rectangle {
        width: parent.width
        height: 2
        color: Style.color.surface
    }

    // ----- Table Rows -----
    Repeater {
        id: tbody
        property var _rows: table.rows.length < 2
            ? table.rows
            : table.rows.reduce((acc, row, i) => {
                if (i > 0) acc.push(false);
                acc.push(row);
                return acc;
            }, [])

        model: tbody._rows.length

        delegate: Loader {
            id: dynamicLoader
            width: parent.width
            sourceComponent: tbody._rows[index] === false
                ? separatorLine
                : rowComponent
            property var rowData: tbody._rows[index]
        }
    }

    Component {
        id: separatorLine
        Rectangle {
            height: 2
            color: Style.color.surface
        }
    }

    // Default cell text component
    Component {
        id: cellText
        Item {
            height: ct.height
            Text {
                id: ct
                width: parent.width
                wrapMode: Text.WordWrap
                text: cellData
                color: Style.color.text
                verticalAlignment: Text.AlignVCenter
                bottomPadding: Style.spacing.large
                topPadding: Style.spacing.large
                // leftPadding: Style.spacing.medium
                // rightPadding: Style.spacing.medium
            }
        }
    }

    Component {
        id: rowComponent
        Rectangle {
            id: rowRect
            height: childrenRect.height
            width: parent.width
            color: (rowData.menu || rowData.onClicked) && rowMouseArea.containsMouse ? Qt.alpha(Style.color.accent, 0.5) : "transparent"
            radius: Style.radius.small

            Row {
                spacing: Style.spacing.large
                width: parent.width
                Repeater {
                    model: rowData.cells.length
                    delegate: Loader {
                        anchors.verticalCenter: parent.verticalCenter
                        width: table.columnWidths.length > index
                            ? parent.width * table.columnWidths[index]
                            : parent.width / rowData.cells.length
                        sourceComponent: typeof rowData.cells[index] === "string"
                            ? cellText
                            : rowData.cells[index].component
                        property var cellData: typeof rowData.cells[index] === "string"
                            ? rowData.cells[index]
                            : rowData.cells[index].props
                    }
                }
            }

            MouseArea {
                id: rowMouseArea
                anchors.fill: parent
                hoverEnabled: Boolean(rowData.menu || rowData.onClicked)
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onClicked: (mouse) => {
                    if (mouse.button === Qt.RightButton && rowData.menu) {
                        rowMenu.popup()
                    }
                    else if (mouse.button === Qt.LeftButton && rowData.onClicked) {
                        rowData.onClicked()
                    }
                }
                cursorShape: (rowData.menu || rowData.onClicked)? Qt.PointingHandCursor : Qt.ArrowCursor
            }

            Menu {
                id: rowMenu
                Repeater {
                    model: rowData.menu || []
                    delegate: MenuItem {
                        text: modelData.text
                        onTriggered: modelData.onTriggered ? modelData.onTriggered.bind(rowData)() : {}
                    }
                }
            }
        }
    }

}
