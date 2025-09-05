import QtQuick

Rectangle {
    property alias source: img.source
    property alias shade: overlay.color
    border.width: 0
    border.color: Style.color.background
    color: "transparent"
    Image {
        id: img
        anchors.centerIn: parent
        width: parent.width - (parent.radius / 2) - 4
        height: parent.height - (parent.radius / 2) - 4
        fillMode: Image.PreserveAspectCrop
        smooth: true
        antialiasing: true
    }
    Rectangle {
        id: overlay
        anchors.fill: parent
        radius: parent.radius
        border.width: parent.radius / 2
        border.color: Style.color.background
        antialiasing: true
    }
}
