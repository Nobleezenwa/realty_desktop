import Realtydesktop
import QtQuick

Table {
    columnWidths: [0.7, 0.3]
    headers: [
        qsTr("Info"),
        qsTr("Time"),
    ]
    rows: [
        {
            cells: ["Ethan Harper sent you a message", "2023-08-15 13:00PM"],
        },
        {
            cells: ["A new property sold by Olivia Bennett", "2023-08-14 13:00PM"],
        },
        {
            cells: ["SOS alert was activated in pentville Estate", "2023-08-13 13:00PM"],
        },
        {
            cells: ["43 payments are due", "2023-08-12 13:00PM"],
        },
        {
            cells: ["Noah Reynolds made an offer for 3 bedroom terrace unit in ", "2023-08-11 13:00PM"],
        },
    ]
}
