pragma Singleton

import QtQuick 2.4

QtObject {
    id: activeSingleton

    property point gravity: world ? world.gravity : Qt.point(0, 0)
    property point initialGravity
    property point maxGravity
    property point minGravity

    property var debugDraw: scene ? scene.debugDraw : null
    property var scene: null
    property var sceneEditor: null
    property string statusText: qsTr("Welcome")
    property var world: scene ? scene.world : null

    Binding on statusText {
        when: world
        value: { if (world) qsTr("[Debug: %1]  [Paused: %2]  [Gravity: %3]").arg(
                 world.debug.toString()).arg((!world.running).toString()).arg(world.gravity); }
    }

    onGravityChanged: {
        maxGravity.x = Math.max(maxGravity.x, gravity.x)
        maxGravity.y = Math.max(maxGravity.y, gravity.y)
        minGravity.x = Math.min(minGravity.x, gravity.x)
        minGravity.y = Math.min(minGravity.y, gravity.y)
    }

    onSceneChanged: {
        if (!scene) {
            return;
        }
        initialGravity = scene.world.gravity;
        maxGravity = scene.world.gravity;
        minGravity = scene.world.gravity;
    }
}
