import Realtydesktop
import QtQuick
import QtQuick.Controls

Button {
    property bool active
    property string iconSource: ""

    id: control
    width: parent.width
    contentItem: Row {
        id: contentRow
        height: 35
        width: parent.width
        ModSvg {
            anchors.verticalCenter: contentRow.verticalCenter
            width: 16
            height: 16
            source: control.iconSource
            replace: control.hovered || active ? Style.color.accentContrast :
                     Style.color.text
            find: "currentColor" // The color in the SVG file to replace
        }
        Text {
            anchors.verticalCenter: contentRow.verticalCenter
            text: control.text
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            leftPadding: Style.spacing.medium
            width: parent.width - 36
            elide: Text.ElideRight
            color: control.hovered || active ? Style.color.accentContrast :
                                     Style.color.text
        }
    }
    background: Rectangle {
        radius: Style.radius.small
        implicitHeight: 35
        width: parent.width
        color: active? Style.color.accent :
               control.hovered? Qt.alpha(Style.color.accent, 0.5) :
               Style.color.surface
        border.width: 0
        Behavior on color {
            ColorAnimation { duration: 150 }
        }
    }
    clip: true
    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor  // Hand cursor when hovering
        onClicked: parent.clicked()         // Forward click to the button
    }
    ToolTip.visible: hovered
    ToolTip.text: control.text
    ToolTip.delay: 1000
}
