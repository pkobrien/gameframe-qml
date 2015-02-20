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

    function getWorldCenter() { itemBody.getWorldCenter() }

    readonly property var worldCenter: function() { return itemBody.getWorldCenter(); }

    //Simulation properties and functions
    property alias angularDamping: itemBody.angularDamping
    property alias angularVelocity: itemBody.angularVelocity
    property alias bullet: itemBody.bullet
    property alias gravityScale: itemBody.gravityScale
    property alias linearDamping: itemBody.linearDamping
    property alias linearVelocity: itemBody.linearVelocity

    function applyLinearImpulse(impulse, point) { itemBody.applyLinearImpulse(impulse, point) }

    transformOrigin: Item.TopLeft

    onHeightChanged: console.error("Do not set a height on a Dynamic Body Item.");
    onWidthChanged: console.error("Do not set a width on a Dynamic Body Item.");

    B2.Body {
        id: itemBody

        bodyType: B2.Body.Dynamic
        bullet: false
        target: item
        world: item.world
    }
}
