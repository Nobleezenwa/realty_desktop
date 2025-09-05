import QtQuick 2.15
import QtQml 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: root
    property alias font: initialsText.font
    property string name: ""
    property int size: 48
    // Optional border customization
    property color borderColor: Qt.rgba(0,0,0,0.12)
    property int borderWidth: 0

    width: size
    height: size
    radius: width / 2
    border.color: borderColor
    border.width: borderWidth
    clip: true
    color: bgColor

    readonly property string initials: {
        var n = (name || "").trim()
        if (!n.length) return "?"
        // split on whitespace; remove empties
        var parts = n.split(/\s+/).filter(function(p){ return p.length > 0 })
        if (parts.length === 1) {
            // Single word: take up to first 2 letters
            return parts[0].slice(0, 2).toUpperCase()
        }
        // Two or more words: take first letter of first two words
        return (parts[0][0] + parts[1][0]).toUpperCase()
    }

    // --- Color logic: stable hue from name, pick best contrasting text color ---
    readonly property color bgColor: {
        var h = hashToHue(name)
        // hsla(h, s, l, a). Keep l in mid-range so contrast choice works well.
        return Qt.hsla(h, 0.55, 0.52, 1.0)
    }

    readonly property color fgColor: {
        // Choose black/white based on highest WCAG contrast with bg
        var Lbg = relLuminance(bgColor)
        var contrastWithWhite = (1.0 + 0.05) / (Math.min(Lbg, 1.0) + 0.05)
        var contrastWithBlack = (Math.max(Lbg, 0.0) + 0.05) / (0.0 + 0.05)
        return (contrastWithWhite >= contrastWithBlack) ? "white" : "black"
    }

    function hashToHue(str) {
        // Stable positive integer hash -> [0,1) hue
        var s = (str || "").toString()
        var h = 0
        for (var i = 0; i < s.length; i++) {
            h = ((h << 5) - h) + s.charCodeAt(i)   // h*31 + char
            h |= 0                                  // to 32-bit int
        }
        if (h < 0) h = -h
        return (h % 360) / 360.0
    }

    function relLuminance(c) {
        // c.r/g/b in [0,1]
        function lin(v) { return (v <= 0.03928) ? v / 12.92 : Math.pow((v + 0.055) / 1.055, 2.4) }
        var R = lin(c.r)
        var G = lin(c.g)
        var B = lin(c.b)
        return 0.2126 * R + 0.7152 * G + 0.0722 * B
    }

    Text {
        id: initialsText
        anchors.centerIn: parent
        text: root.initials
        color: root.fgColor
        font.pixelSize: Math.round(root.size * 0.42)
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    // Optional: accessible name for screen readers
    Accessible.role: Accessible.StaticText
    Accessible.name: name.length ? ("Avatar for " + name) : "Avatar"
}
