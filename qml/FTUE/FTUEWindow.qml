import QtQuick

Rectangle {
    id: root

    border.width: 2
    border.color: "red"

    color: "transparent"

    property bool on: false

    function changePoint(x, y, height, width) {
        root.x = x;
        root.y = y;
        root.height = height;
        root.width = width;
    }

    function finish() {
        root.x = 0;
        root.y = 0;
        root.height = 0;
        root.width = 0;
    }

    function start() {

    }

    states: [
        State {
            when: root.on
            PropertyChanges {
                target: root
                visible: true
            }
        },
        State {
            when: !root.on
            PropertyChanges {
                target: root
                visible: false
            }
        }
    ]
}
