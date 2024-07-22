import QtQuick

Rectangle {
    id: root

    anchors.fill: parent

    color: "transparent"

    signal changePoint(int x, int y, int height,int width)
    signal start()
    signal finish()

    required property list<FTUEElement> model
    required property FTUEWindow window
    required property FTUEPanel panel
    required property FTUEEffect effect
    required property string title

    property int panelMargin: 5

    Component.onCompleted: {
        root.changePoint.connect(window.changePoint);
        root.start.connect(window.start);
        root.finish.connect(window.finish);

        panel.next.connect(internal.increment);
        panel.prev.connect(internal.decrement);
        panel.stop.connect(root.finish);
        panel.start.connect(function () {
            panel.status = "Process";

            internal.increment();
        });

        root.changePoint.connect(effect.changePoint);

        window.parent = root;
        panel.parent = root;
        effect.parent = root;
    }

    QtObject {
        id: internal

        property int currentItem: -1

        function initialization() {
            panel.on = true;
            window.on = true;
            effect.on = true;

            internal.currentItem = -1;

            root.changePoint(root.height, root.width, root.height, root.width);
            panel.location = Qt.AlignCenter;
            panel.text = root.title;
            panel.prevButtonEnabled = false;
        }

        function finalization() {
            panel.on = false;
            window.on = false;
            effect.on = false;

            root.changePoint(0, 0, 0, 0);
        }

        function increment() {
            if (internal.currentItem < model.length - 1) {
                internal.currentItem = internal.currentItem + 1;
                internal.update();
            }
        }

        function decrement() {
            if (internal.currentItem > 0) {
                internal.currentItem = internal.currentItem - 1;
                internal.update();
            }
        }

        function update() {
            panel.nextButtonEnabled = !(internal.currentItem === model.length - 1);
            panel.prevButtonEnabled = !(internal.currentItem === 0);

            try {
                model[internal.currentItem].action();
            } catch (error) {
                console.log(error);
            }

            var point = root.parent.mapFromItem(model[internal.currentItem].item.parent,
                                                model[internal.currentItem].item.x,
                                                model[internal.currentItem].item.y);

            panel.location = (point.y < root.height / 2) ? Qt.AlignBottom : Qt.AlignTop;
            panel.text = model[internal.currentItem].description;

            root.changePoint(point.x - root.panelMargin,
                             point.y - root.panelMargin,
                             model[internal.currentItem].item.height + 2 * root.panelMargin,
                             model[internal.currentItem].item.width + 2 * root.panelMargin);
        }
    }

    onStart: {
        internal.initialization();
    }

    onFinish: {
        internal.finalization();

        panel.status = "Start";
    }
}
