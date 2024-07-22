import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import FTUE 1.0 as FTUE

ApplicationWindow {
    id: application

    width: 640
    height: 480
    visible: true
    title: qsTr("First-time user experience module")

    FTUE.FTUE {
        id: ftue
        z: 2

        title: qsTr("This is a beginner's guide to application components. Click “next” to get started.")

        window: FTUE.FTUEWindow {
            // ...
        }

        panel: FTUE.FTUEPanel {
            // ...
        }

        effect: FTUE.FTUEEffect {
            // ...
        }

        model: [
            FTUE.FTUEElement {
                item: button1
                description: qsTr("This is button 1. This button is necessary to turn on the user manual when pressed.")
                action: () => {
                    console.log("FTUEElement - button1")
                }
            },
            FTUE.FTUEElement {
                item: button2
                description: qsTr("This is button 2. This button is necessary to output the log “This is button 2” to the console when clicked.")
                action: () => {
                    console.log("FTUEElement - button2")
                }
            },
            FTUE.FTUEElement {
                item: label
                description: qsTr("This is label. Just the label.")
                action: () => {
                    console.log("FTUEElement - label")
                }
            }
        ]
    }

    ColumnLayout { // RowLayout ColumnLayout
        anchors.centerIn: parent

        spacing: 20

        Button {
            id: button1

            Layout.preferredHeight: 50
            Layout.preferredWidth: 100

            text: qsTr("Start FTUE")

            onClicked: {
                ftue.start();
            }
        }

        Button {
            id: button2

            Layout.preferredHeight: 200
            Layout.preferredWidth: 200

            text: qsTr("Some button 2")

            onClicked: {
                console.log("This is button 2")
            }
        }

        Label {
            id: label

            Layout.preferredHeight: 50
            Layout.preferredWidth: 100

            text: qsTr("Some label")
        }
    }
}
