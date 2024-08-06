import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    z: 2

    property bool on: false
    property int location: Qt.AlignTop
    property string status: "Start" // Start or Process

    property alias text: textArea.text
    property alias prevButtonEnabled: prevButton.enabled
    property alias nextButtonEnabled: nextButton.enabled
    property alias prevButtonVisible: prevButton.visible
    property alias nextButtonVisible: nextButton.visible
    property alias startButtonVisible: startButton.visible

    visible: root.on

    height: 100

    signal prev()
    signal next()
    signal start()
    signal stop()

    Rectangle {
        id: background

        z: 1

        anchors {
            fill: parent
            margins: 10
        }

        border.color: "black"
        border.width: 3

        radius: 5
        color: "black"
        opacity: 0.5
    } // Rectangle

    RowLayout {
        id: controlsLayout

        anchors {
            fill: parent
            margins: 20
        }

        z: 2

        spacing: 10

        Text {
            id: textArea

            Layout.fillHeight: true
            Layout.fillWidth: true

            wrapMode: Text.WordWrap
        }  // Text

        Button {
            id: prevButton

            Layout.fillHeight: true
            Layout.preferredWidth: 100

            visible: false
            text: qsTr("prev")

            onClicked: {
                root.prev();
            }
        } // Button

        Button {
            id: nextButton

            Layout.fillHeight: true
            Layout.preferredWidth: 100

            visible: false
            text: qsTr("next")

            onClicked: {
                root.next();
            }
        } // Button

        Button {
            id: startButton

            Layout.fillHeight: true
            Layout.preferredWidth: 100

            text: qsTr("start")

            onClicked: {
                root.start();
            }
        } // Button

        Button {
            id: stopButton

            Layout.fillHeight: true
            Layout.preferredWidth: 100

            text: qsTr("stop")

            onClicked: {
                root.stop();
            }
        } // Button

        states: [
            State {
                when: root.status === "Start"

                PropertyChanges {
                    target: prevButton
                    visible: false
                } // PropertyChanges
                PropertyChanges {
                    target: nextButton
                    visible: false
                } // PropertyChanges
                PropertyChanges {
                    target: startButton
                    visible: true
                } // PropertyChanges
            }, // State
            State {
                when: root.status === "Process"

                PropertyChanges {
                    target: prevButton
                    visible: true
                } // PropertyChanges
                PropertyChanges {
                    target: nextButton
                    visible: true
                } // PropertyChanges
                PropertyChanges {
                    target: startButton
                    visible: false
                } // PropertyChanges
            } // State
        ]
    } // RowLayout

    states: [
        State {
            when: root.location === Qt.AlignTop
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
            } // AnchorChanges
        }, // State
        State {
            when: root.location === Qt.AlignBottom
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
            } // AnchorChanges
        }, // State
        State {
            when: root.location === Qt.AlignCenter
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
            } // AnchorChanges
        } // State
    ]
} // Item
