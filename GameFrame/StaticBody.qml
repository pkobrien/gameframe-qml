import QtQuick 2.4
import Box2D 2.0 as B2

Item {
    id: item

    property alias body: itemBody

    property var world: parent.world

    property alias active: itemBody.active
    property alias awake: itemBody.awake
    property alias fixedRotation: itemBody.fixedRotation
    property alias fixtures: itemBody.fixtures
    property alias sleepingAllowed: itemBody.sleepingAllowed

    transformOrigin: Item.TopLeft

    B2.Body {
        id: itemBody

        awake: false
        bodyType: B2.Body.Static
        sleepingAllowed: true
        target: item
        world: item.world
    }
}
