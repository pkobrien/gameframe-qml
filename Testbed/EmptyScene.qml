import QtQuick 2.4
import GameFrame 1.0 as GF

GF.Scene {
    id: emptyScene

    property alias background: background

    world: GF.World { }

    Rectangle {
        id: background
        anchors.fill: parent
        color: "Gray"
        visible: !debug
    }
}
