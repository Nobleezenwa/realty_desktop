import QtQuick 2.15  // or QtQuick 6.x

ShaderEffect {
    id: roundedImage
    width: 200
    height: 200
    property alias source: src.source
    property real radius: 20.0
    property var size: Qt.vector2d(width, height)

    Image {
        id: src
        visible: false
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }

    fragmentShader: "qrc:/shaders/roundedimage.frag.qsb"
}
