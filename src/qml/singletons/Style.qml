pragma Singleton
import QtQuick 2.15

QtObject {
    property bool isDark: false
    signal themeChanged()

    property QtObject color: QtObject {
        property color background: isDark ? "#1c1b22" : "#FFFFFF"
        property color surface:    isDark ? "#2b2a33" : "#EEEEEE"
        property color text:       isDark ? "#FFFFFF" : "#000000"
        property color accent:     "#009689"
        property color accentContrast: "#ffffff"
        property color border:     isDark ? "#444444" : "#DDDDDD"

        property color warning:    "#ffc107"
        property color danger:     "#dc3545"
        property color success:    "#198754"
        property color neutral:    "#6c757d"
    }

    property QtObject radius: QtObject {
        property int large: 25
        property int medium: 15
        property int small: 5
    }

    property QtObject spacing: QtObject {
        property int large: 15
        property int medium: 10
        property int small: 5
    }

    property QtObject fontSize: QtObject {
        property int xxLarge: 36
        property int xLarge: 28
        property int large: 20
        property int medium: 16
        property int small: 12
    }

    function init() {
        isDark = ThemeController.loadThemePreference()
        themeChanged()
    }

    function toggle() {
        isDark = !isDark
        ThemeController.saveThemePreference(isDark)
        themeChanged()
    }
}
