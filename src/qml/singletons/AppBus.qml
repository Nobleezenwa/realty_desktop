// App Event Bus
pragma Singleton
import QtQuick 2.15

QtObject {
    signal windowClosed()
    signal windowRestored()
    signal windowMinimized()
    signal windowDragged(var mouse)

    property int busyCount: 0
    signal busy(bool flag)
    function setBusy(flag) {
        if (flag) {
            ++busyCount;
            busy(flag);
        } else {
            --busyCount;
            if (busyCount <= 0) {
                busyCount = 0;
                busy(flag)
            }
        }
    }


}
