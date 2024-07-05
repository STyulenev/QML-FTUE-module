import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    z: 2

    property bool on: false

    property int location: Qt.AlignTop
    property alias text: textArea.text

    visible: root.on

    height: 100

    signal prev()
    signal next()
    signal stop()

    Rectangle {

        z: 1

        anchors.fill: parent

        border.color: "black"
        border.width: 3
        radius: 5
        color: "black"
        opacity: 0.5
    }

    RowLayout {
        anchors.fill: parent

        z: 2

        spacing: 20

        Text {
            id: textArea

            Layout.fillHeight: true
            Layout.fillWidth: true



        }

        Button {
            id: prev

            Layout.fillHeight: true
            Layout.preferredWidth: 100

            text: "prev"

            onClicked: {
                root.prev();
            }
        }

        Button {
            id: next

            Layout.fillHeight: true
            Layout.preferredWidth: 100

            text: "next"

            onClicked: {
                root.next();
            }
        }

        Button {
            id: stop

            Layout.fillHeight: true
            Layout.preferredWidth: 100

            text: "stop"

            onClicked: {
                root.stop();
            }
        }
    }

    states: [
        State {
            when: location === Qt.AlignTop
            AnchorChanges {
                target: root

                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                    bottom: undefined
                    horizontalCenter: undefined
                    verticalCenter: undefined
                }
            }
        },
        State {
            when: location === Qt.AlignBottom
            AnchorChanges {
                target: root

                anchors {
                    top: undefined
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                    horizontalCenter: undefined
                    verticalCenter: undefined
                }
            }
        },
        State {
            when: location === Qt.AlignCenter
            AnchorChanges {
                target: root

                anchors {
                    top: undefined
                    left: undefined
                    right: undefined
                    bottom: undefined
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
            }
        }
    ]
}
