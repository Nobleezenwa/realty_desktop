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
            text: qsTr("Profile Settings")
            font.pixelSize: Style.fontSize.large
            font.bold: true
            width: parent.width
            elide: Text.ElideRight
            color: Style.color.text
        }

        //
        Item { width: parent.width; height: Style.spacing.large; }



        //
        ColumnLayout {
            spacing: 20
            padding: 20

            // Personal Information Section
            GroupBox {
                title: "Personal Information"
                Layout.fillWidth: true

                ColumnLayout {
                    spacing: 10

                    RowLayout {
                        spacing: 10
                        TextField {
                            placeholderText: "Email Address"
                            Layout.fillWidth: true
                        }
                        TextField {
                            placeholderText: "Phone Number"
                            Layout.fillWidth: true
                        }
                    }

                    TextArea {
                        placeholderText: "Tell us about yourself"
                        Layout.fillWidth: true
                        Layout.preferredHeight: 100
                    }

                    RowLayout {
                        spacing: 10
                        TextField {
                            placeholderText: "Bank"
                            Layout.fillWidth: true
                        }
                        TextField {
                            placeholderText: "Account Number"
                            Layout.fillWidth: true
                        }
                    }

                    TextField {
                        placeholderText: "Account Name"
                        Layout.fillWidth: true
                    }

                    GroupBox {
                        title: "Social Links"
                        Layout.fillWidth: true

                        ColumnLayout {
                            spacing: 10
                            RowLayout {
                                TextField {
                                    placeholderText: "Facebook profile link"
                                    Layout.fillWidth: true
                                }
                                TextField {
                                    placeholderText: "X (Twitter) profile link"
                                    Layout.fillWidth: true
                                }
                            }
                            RowLayout {
                                TextField {
                                    placeholderText: "LinkedIn profile link"
                                    Layout.fillWidth: true
                                }
                                TextField {
                                    placeholderText: "Instagram profile link"
                                    Layout.fillWidth: true
                                }
                            }
                        }
                    }

                    Button {
                        text: "Save"
                        Layout.alignment: Qt.AlignRight
                    }
                }
            }

            // Photo Upload Section
            GroupBox {
                title: "Your Photo"
                Layout.fillWidth: true

                ColumnLayout {
                    spacing: 10

                    Rectangle {
                        width: 200
                        height: 150
                        border.width: 1
                        border.color: "#999"
                        radius: 5
                        color: "transparent"

                        Text {
                            anchors.centerIn: parent
                            text: "Click to upload\nPNG, JPG or JPEG\n(max. 2MB)"
                            horizontalAlignment: Text.AlignHCenter
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Upload photo clicked")
                            }
                        }
                    }

                    Button {
                        text: "Save"
                        Layout.alignment: Qt.AlignRight
                    }
                }
            }

            // Password Settings Section
            GroupBox {
                title: "Password Settings"
                Layout.fillWidth: true

                ColumnLayout {
                    spacing: 10

                    RowLayout {
                        TextField {
                            placeholderText: "Current Password"
                            echoMode: TextInput.Password
                            Layout.fillWidth: true
                        }
                        TextField {
                            placeholderText: "New Password"
                            echoMode: TextInput.Password
                            Layout.fillWidth: true
                        }
                    }

                    Button {
                        text: "Change Password"
                        Layout.alignment: Qt.AlignLeft
                    }
                }
            }
        }



    }
}
