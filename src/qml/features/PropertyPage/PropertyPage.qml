import Realtydesktop
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

InnerPage {
    id: propertyPage
    heading: qsTr("Property")
    Component.onCompleted: ()=>{
                               console.log("propertyPage", heading);
                           }

    Rectangle {
        width: parent.width;
        height: childrenRect.height;
        color: Style.color.surface
        radius: Style.radius.medium

        RowLayout {
            width: parent.width
            height: Math.max(communityAvatar.height, communityInfo.implicitHeight) + (Style.spacing.large * 2)
            spacing: Style.spacing.large * 2

            //avatar
            Item {
                width: 80
                Layout.fillHeight: true
                Layout.leftMargin: Style.spacing.large
                Layout.topMargin: Style.spacing.large
                Avatar {
                    id: communityAvatar;
                    name: "5 bedroom";
                    size: 80;
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            //meta data
            ColumnLayout {
                width: parent.width
                // Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.rightMargin: Style.spacing.large

                Column {
                    id: communityInfo
                    width: parent.width
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                    Text {
                        width: parent.width
                        text: "Five Bedroom Duplex"
                        font.pixelSize: Style.fontSize.large
                        wrapMode: Text.WordWrap
                        font.bold: true
                        color: Style.color.text
                    }
                    Text {
                        width: parent.width
                        text: "Apo, Lokogoma, FCT, Abuja, Nigeria"
                        font.pixelSize: Style.fontSize.medium
                        wrapMode: Text.WordWrap
                        color: Style.color.text
                    }

                    Item { width: parent.width; height: 20; }

                    Flow {
                        width: parent.width
                        anchors.margins: 4
                        spacing: Style.spacing.large * 3

                        Repeater {
                            model: [
                                {value: "2,535", label: "label metric"},
                                {value: "-3%", label: "metric label", color: Style.color.warning},
                                {value: "2,535", label: "label metric"},
                                {value: "-3%", label: "metric label", color: Style.color.warning},
                                {value: "2,535", label: "label metric"},
                                {value: "-3%", label: "metric label", color: Style.color.warning},
                                {value: "2,535", label: "label metric"},
                                {value: "-3%", label: "metric label", color: Style.color.warning},
                            ]
                            Column {
                                spacing: Style.spacing.small

                                Text {
                                    text: modelData.value
                                    font.bold: true
                                    font.pixelSize: Style.fontSize.xLarge
                                    color: modelData.color? modelData.color : Style.color.accent
                                }

                                Text {
                                    text: modelData.label
                                    font.pixelSize: Style.fontSize.small
                                    color: Style.color.text
                                    wrapMode: Text.WordWrap
                                    width: parent.width - (Style.spacing.large * 3)
                                }
                            }
                        }

                    }
                }
            }
        }
    }

    Component {
        id: communitiesList
        PropertyCommunitiesList {
            onOpen: (communityId)=>{
                        propertyPage.parentStack.pop();
                        // propertyPage.parentStack.push(communityPageComponent, {communityId});
                    }
        }
    }
    Component {
        id: leadsList
        PropertyLeadsList {
            onOpen: (leadId)=>propertyPage.parentStack.push(leadPageComponent, {leadId})
        }
    }
    // Component {
    //     id: devicesList
    //     DevicesList {}
    // }
    // Component {
    //     id: activtiesList
    //     ActivtiesList {}
    // }

    //lists
    TabView {
        topPadding: 10
        currentIndex: 0
        width: parent.width
        tabs: [qsTr("Communities"), qsTr("Leads"), /*qsTr("Devices"), qsTr("Activties")*/]
        tabViews: [communitiesList, leadsList, /*devicesList, activtiesList*/]
    }

    //imported components
    Component {
        id: communityPageComponent

        Loader {
            property var parentStack: propertyPage.parentStack
            source: "qrc:/features/CommunityPage/CommunityPage.qml"
        }
    }
    
    Component {
        id: leadPageComponent

        Loader {
            property var parentStack: propertyPage.parentStack
            source: "qrc:/features/LeadPage/LeadPage.qml"
        }
    }
    
}
