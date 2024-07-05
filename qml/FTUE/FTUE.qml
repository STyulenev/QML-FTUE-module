import QtQuick

Rectangle {
    id: root

    color: "transparent"
    anchors.fill: parent

    signal changePoint(int x, int y, int height,int width)
    signal start()
    signal finish()

    required property list<FTUEElement> model
    required property FTUEWindow window
    required property FTUEPanel panel
    required property FTUEEffect effect
    required property string title

    Component.onCompleted: {
        root.changePoint.connect(window.changePoint);
        root.start.connect(window.start);
        root.finish.connect(window.finish);

        panel.next.connect(internal.increment);
        panel.prev.connect(internal.decrement);
        panel.stop.connect(root.finish);

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
            } else {
                root.finish();
            }
        }

        function decrement() {
            if (internal.currentItem > 0) {
                internal.currentItem = internal.currentItem - 1;
                internal.update();
            }
        }

        function update() {
            var point = root.parent.mapFromItem(model[internal.currentItem].item.parent,
                                                model[internal.currentItem].item.x,
                                                model[internal.currentItem].item.y);

            panel.location = (point.y < root.height / 2) ? Qt.AlignBottom : Qt.AlignTop;
            panel.text = model[internal.currentItem].description;

            console.log(panel.location + " " + model[internal.currentItem].description)

            root.changePoint(point.x - 5,
                             point.y - 5,
                             model[internal.currentItem].item.height + 10,
                             model[internal.currentItem].item.width + 10);
        }
    }

    onStart: {
        internal.initialization();
    }

    onFinish: {
        internal.finalization();
    }
}
