import QtQuick 2.4
import Box2D 2.0 as B2
import "." as GF

Item {
    id: scene

    property bool active: false
    property string status
    property var world
    property var _debugDraw

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
            _debugDraw = comp.createObject(scene);
        }
    }
}
