import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Window {
    id: app

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    FTUE {
        id: ftue
        z: 2

        title: "khdsjfbkesaihfblsidjhfls"

        window: FTUEWindow {

        }

        panel: FTUEPanel {

        }

        effect: FTUEEffect {

        }

        model: [
            FTUEElement {
                item: button1
                description: "123123123"
            },
            FTUEElement {
                item: button2
                description: "----"
            },
            FTUEElement {
                item: label
                description: "----"
            }
        ]
    }

    ColumnLayout { //RowLayout ColumnLayout
        anchors.centerIn: parent

        spacing: 20

        Button {
            id: button1

            Layout.preferredHeight: 50
            Layout.preferredWidth: 100

            text: "1"

            onClicked: {
                ftue.start();
            }
        }

        Button {
            id: button2

            Layout.preferredHeight: 200
            Layout.preferredWidth: 200

            text: "2"
        }

        Label {
            id: label

            Layout.preferredHeight: 50
            Layout.preferredWidth: 100

            text: "2"
        }
    }
}
