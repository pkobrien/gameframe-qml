pragma Singleton

import QtQuick 2.4

QtObject {
    id: activeSingleton

    property var scene: null
    property var sceneLoader: null
    property string statusText: qsTr("Welcome")
    property var world: scene ? scene.world : null

    Binding on statusText {
        when: world
        value: { if (world) qsTr("[Debug: %1]  [Paused: %2]  [Gravity: %3]").arg(
                 world.debug.toString()).arg((!world.running).toString()).arg(world.gravity); }
    }
}
