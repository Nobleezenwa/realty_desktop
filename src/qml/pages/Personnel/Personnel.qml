import Realtydesktop
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

// Dashboard.qml
ScrollView {
    id: rootScroll

    Column {
        width: rootScroll.width - (Style.spacing.large * 2)
        padding: Style.spacing.large

        //title
        Text {
            text: qsTr("Personnel")
            font.pixelSize: Style.fontSize.large
            font.bold: true
            width: parent.width
            elide: Text.ElideRight
            color: Style.color.text
        }

        //
        Item { width: parent.width; height: Style.spacing.large; }

        //
        PersonnelList{}
    }
}
