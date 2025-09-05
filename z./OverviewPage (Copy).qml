import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Column {
    bottomPadding:  Style.spacing.large
    GridLayout {
        id: grid
        width: parent.width
        height: 768
        columns: 12
        rows: 12
        columnSpacing: 14
        rowSpacing: 14

        Component {
            id: tile
            Rectangle {
                property int col: 0
                property int row: 0
                property int cs: 1
                property int rs: 1
                property color tint: "#B573FF"

                radius: 10
                // color: tint
                color: "transparent"
                border.color: Style.color.surface
                border.width: 2

                Layout.column: col
                Layout.row: row
                Layout.columnSpan: cs
                Layout.rowSpan: rs
                implicitWidth: (cs / 12) * (grid.width) - 14
                implicitHeight: (rs / 12) * grid.height
            }
        }

        // Use Instantiator instead of Loader so the item is a direct child
        Instantiator {
            model: [
                { col:0, row:0, cs:3, rs:6, tint:"red" },
                { col:0, row:6, cs:3, rs:6, tint:"yellow" },
                { col:3, row:0, cs:3, rs:3, tint:"green" },
                { col:6, row:0, cs:3, rs:3, tint:"blue" },
                { col:9, row:0, cs:3, rs:6, tint:"cyan" },
                { col:9, row:6, cs:3, rs:3, tint:"orange" },
                { col:3, row:3, cs:6, rs:6, tint:"purple" },
                { col:3, row:9, cs:3, rs:3, tint:"#FFFFFF" },
                { col:6, row:9, cs:6, rs:3, tint:"pink" }
            ]

            delegate: tile
            onObjectAdded: (idx, obj) => {
                               obj.parent = grid // make it a direct child so layout works
                               obj.col = model[idx].col
                               obj.row = model[idx].row
                               obj.cs = model[idx].cs
                               obj.rs = model[idx].rs
                               obj.tint = model[idx].tint
                           }
        }
    }
}
