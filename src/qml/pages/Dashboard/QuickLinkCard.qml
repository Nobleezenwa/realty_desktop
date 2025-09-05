import QtQuick
import QtQuick.Controls

Item {
    property string title: ""
    property string description: ""

    width: parent.width
    height: 100

    Rectangle {
        anchors.fill: parent
        radius: Style.radius.medium
        color: cardMouseArea.containsMouse ? Qt.alpha(Style.color.accent, 0.5) : Style.color.background // hover color
        border.color: Style.color.surface
        border.width: 2
        clip: true

        MouseArea {
            id: cardMouseArea
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton | Qt.RightButton

            onClicked: (mouse) => {

            }
            cursorShape: Qt.PointingHandCursor
        }

        Column {
            width: parent.width
            anchors.centerIn: parent
            spacing: Style.spacing.small
            leftPadding: Style.spacing.large
            rightPadding: Style.spacing.large

            Text {
                text: title
                font.bold: true
                font.pixelSize: Style.fontSize.medium
                color: Style.color.text
                wrapMode: Text.WordWrap
                width: parent.width - (Style.spacing.large * 3)
            }

            Text {
                text: description
                font.pixelSize: Style.fontSize.small
                color: Style.color.text
                wrapMode: Text.WordWrap
                width: parent.width - (Style.spacing.large * 3)
            }
        }
    }
}
