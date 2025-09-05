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
            text: qsTr("Leads")
            font.pixelSize: Style.fontSize.large
            font.bold: true
            width: parent.width
            elide: Text.ElideRight
            color: Style.color.text
        }

        Component {
            id: overview
            LeadsOverview {}
        }

        Component {
            id: listing
            LeadsList {}
        }

        TabView {
            currentIndex: 0
            width: parent.width
            tabs: [qsTr("Overview"), qsTr("Leads")]
            tabViews: [overview, listing]
        }

    }
}
