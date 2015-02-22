pragma Singleton

import QtQuick 2.4

QtObject {
    id: activeSingleton

    property var scene
    property var sceneLoader
    property string statusText: qsTr("Welcome")
    property var world: scene ? scene.world : null

    Binding on statusText {
        when: world
        value: { if (world) qsTr("[Debug: %1]  [Paused: %2]  [Gravity: %3]").arg(
                                 world.debug).arg(!world.running).arg(world.gravity); }
    }
}
