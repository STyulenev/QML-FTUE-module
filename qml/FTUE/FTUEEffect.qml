import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: root

    anchors.fill: parent

    property bool  on: false
    property color backgroundColor: "black"
    property real  backgroundOpacity: 0.5

    function changePoint(x, y, height, width) {
        topRectangle.height = y;
        bottomRectangle.height = root.height - y - height;
        leftRectangle.width = x;
        rightRectangle.width = root.width - x - width;
    }

    Rectangle {
        id: topRectangle

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        color: root.backgroundColor
        opacity: root.backgroundOpacity
    }

    Rectangle {
        id: bottomRectangle

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        color: root.backgroundColor
        opacity: root.backgroundOpacity
    }

    Rectangle {
        id: leftRectangle

        anchors.top: topRectangle.bottom
        anchors.left: parent.left
        anchors.bottom: bottomRectangle.top

        color: root.backgroundColor
        opacity: root.backgroundOpacity
    }

    Rectangle {
        id: rightRectangle

        anchors.top: topRectangle.bottom
        anchors.right: parent.right
        anchors.bottom: bottomRectangle.top

        color: root.backgroundColor
        opacity: root.backgroundOpacity
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
