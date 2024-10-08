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

    // FTUE
    FTUE.FTUE {
        id: ftue
        z: 2

        title: qsTr("This is a beginner's guide to application components. Click “next” to get started.")

        window: FTUE.FTUEWindow {
            // ...
        } // FTUE.FTUEWindow

        panel: FTUE.FTUEPanel {
            // ...
        } // FTUE.FTUEPanel

        effect: FTUE.FTUEEffect {
            // ...
        } // FTUE.FTUEEffect

        model: [
            FTUE.FTUEElement {
                item: button1
                description: qsTr("This is button 1. This button is necessary to turn on the user manual when pressed.")
                action: () => {
                    console.log("FTUEElement - button1");
                    bar.currentIndex = 0;
                }
            }, // FTUE.FTUEElement
            FTUE.FTUEElement {
                item: button2
                description: qsTr("This is button 2. This button is necessary to output the log “This is button 2” to the console when clicked.")
                action: () => {
                    console.log("FTUEElement - button2");
                    bar.currentIndex = 0;
                }
            }, // FTUE.FTUEElement
            FTUE.FTUEElement {
                item: label
                description: qsTr("This is label. Just the label.")
                action: () => {
                    console.log("FTUEElement - label");
                    bar.currentIndex = 1;
                }
            } // FTUE.FTUEElement
        ]

        onFinish: {
            bar.currentIndex = 0;
        }
    } // FTUE.FTUE

    // Basic page layout
    TabBar {
        id: bar

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }

        TabButton {
            text: qsTr("First page")
        } // TabButton
        TabButton {
            text: qsTr("Second page")
        } // TabButton
    } // TabBar

    StackLayout {
        id: stackLayout

        anchors {
            top: bar.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        currentIndex: bar.currentIndex

        Item {
            id: firstPage

            ColumnLayout { // or RowLayout
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
                } // Button

                Button {
                    id: button2

                    Layout.preferredHeight: 200
                    Layout.preferredWidth: 200

                    text: qsTr("Some button 2")

                    onClicked: {
                        console.log("This is button 2")
                    }
                } // Button
            } // ColumnLayout
        } // Item

        Item {
            id: secondPage

            Label {
                id: label

                anchors.centerIn: parent

                height: 50
                width: 100

                text: qsTr("Some label")
            } // Label
        } // Item
    } // StackLayout
} // ApplicationWindow
