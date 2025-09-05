import Realtydesktop
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: pageRoot
    property string heading

    // signal back()
    property var parentStack: null

    // 👇 Direct children of InnerPage will go inside contentColumn.data
    default property alias data: contentColumn.data

    width: parent? parent.width : 0
    height: parent? parent.height : 0

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // --- Fixed Header ---
        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: childrenRect.height
            Layout.margins: Style.spacing.small
            spacing: Style.spacing.small

            ToolButton {
                icon.source: "qrc:/images/arrow-left.svg"
                icon.color: Style.color.accent
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor  // Hand cursor when hovering
                    onClicked: ()=>{
                                   if (pageRoot.parentStack)
                                    pageRoot.parentStack.pop()
                               }
                }
            }

            Text {
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                text: pageRoot.heading
                font.pixelSize: Style.fontSize.medium
                font.bold: true
                elide: Text.ElideRight
                color: Style.color.text
            }
        }

        // --- Scrollable Content ---
        ScrollView {
            implicitWidth: parent.width
            width: parent.width
            Layout.fillHeight: true

            Column {
                id: contentColumn
                width: pageRoot.width - 40
                spacing: Style.spacing.small
                anchors.margins: Style.spacing.large
                padding: 20
            }
        }

    }
}
