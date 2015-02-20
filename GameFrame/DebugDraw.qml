import QtQuick 2.4
import Box2D 2.0 as B2

B2.DebugDraw {
    id: debugDraw

    opacity: 0.75
    visible: parent.world.debug
    world: parent.world
    z: 99
}
