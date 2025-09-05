import QtQuick
import QtQuick.Controls

ScrollView {
    z: 0
    anchors.fill: parent

    Column {
        width: parent.width
        spacing: Style.spacing.medium
        // Example content
    }

    Component.onCompleted: {
        console.log("Communities page loaded")
    }
}
