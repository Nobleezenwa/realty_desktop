import Realtydesktop
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: ScrollView {
            id: rootScroll

            Column {
                width: rootScroll.width - (Style.spacing.large * 2)
                padding: Style.spacing.large

                //title
                Text {
                    text: qsTr("Communities")
                    font.pixelSize: Style.fontSize.large
                    font.bold: true
                    width: parent.width
                    elide: Text.ElideRight
                    color: Style.color.text
                }

                Component {
                    id: overview
                    CommunitiesOverview {}
                }

                Component {
                    id: listing
                    CommunitiesList {
                        onOpen: stackView.push(communityPageComponent)
                    }
                }

                TabView {
                    currentIndex: 0
                    width: parent.width
                    tabs: [qsTr("Overview"), qsTr("Communities")]
                    tabViews: [overview, listing]
                }
            }
        }

        // Component.onCompleted: stackView.push(communityPageComponent)
    }

    Component {
        id: communityPageComponent

        CommunityPage {
            parentStack: stackView
        }
    }
}
