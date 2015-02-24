import QtQuick 2.4
import Box2D 2.0 as B2
import "." as GF

Item {
    id: scene

    property bool active: false
    property var debugDraw
    property string statusText
    property var world

    signal entered()
    signal exited()
    signal finished()

    focus: visible
    visible: active

    onActiveChanged: {
        if (active) {
            entered();
        } else {
            exited();
        }
    }

    Component.onCompleted: {
        if (world) {
            var comp = Qt.createComponent("DebugDraw.qml");
            debugDraw = comp.createObject(scene);
        }
    }
}
