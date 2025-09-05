// TabView.qml (your custom component)
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Column {
    id: root
    property var tabs: []         // ["Overview", "Listing"]
    property var tabViews: []     // [Component, Component, ...]
    property int currentIndex: 0
    signal tabChanged(int index)

    width: parent.width
    spacing: Style.spacing.medium

    TabBar {
        id: tabBar
        height: 50
        currentIndex: root.currentIndex
        background: Rectangle { color: "transparent" }

        Repeater {
            model: root.tabs
            TabButton {
                text: modelData
                leftPadding: Style.spacing.large
                rightPadding: Style.spacing.large
                implicitWidth: contentItem.implicitWidth + leftPadding + rightPadding

                background: Item {
                    anchors.fill: parent
                    Rectangle {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        height: 2
                        color: parent.parent.checked ? Style.color.accent : "transparent"
                        Behavior on color {
                            ColorAnimation { duration: 150 }
                        }
                    }
                }

                contentItem: Text {
                    text: parent.text
                    color: Style.color.text
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: {
                    root.currentIndex = index
                    root.tabChanged(index)
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor  // Hand cursor when hovering
                    onClicked: parent.clicked()         // Forward click to the button
                }
            }
        }
    }

    // One visible tab at a time
    Loader {
        id: contentLoader
        width: parent.width
        sourceComponent: (root.tabViews.length > root.currentIndex && root.currentIndex >= 0)
                         ? root.tabViews[root.currentIndex]
                         : null

        // Make the loaded root use our width so its implicitHeight lays out correctly
        onLoaded: if (item) item.width = width
    }
}

