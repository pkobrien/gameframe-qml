import QtQuick 2.4
import Box2D 2.0 as B2

Item {
    id: item

    property var world: parent.world

    property alias body: itemBody
    property alias bottomBoundary: bottomBoundary
    property alias leftBoundary: leftBoundary
    property alias rightBoundary: rightBoundary
    property alias topBoundary: topBoundary

    property alias categories: itemBody.categories
    property alias friction: itemBody.friction
    property alias groupIndex: itemBody.groupIndex
    property alias restitution: itemBody.restitution
    property alias sensor: itemBody.sensor

    property var _bounds: parent

    signal beginContact(var other)
    signal endContact(var other)

    transformOrigin: Item.TopLeft

    B2.Body {
        id: itemBody

        property int categories: B2.Fixture.Category1
        property real friction
        property int groupIndex: 1
        property real restitution
        property bool sensor

        signal beginContact(var other)
        signal endContact(var other)

        bodyType: B2.Body.Static
        target: item
        world: item.world

        onBeginContact: item.beginContact(other)
        onEndContact: item.endContact(other)

        B2.Box {
            id: bottomBoundary
            width: _bounds.width
            height: 2
            x: _bounds.x
            y: _bounds.y + _bounds.height
            categories: itemBody.categories
            friction: itemBody.friction
            groupIndex: itemBody.groupIndex
            restitution: itemBody.restitution
            sensor: itemBody.sensor
            onBeginContact: itemBody.beginContact(other)
            onEndContact: itemBody.endContact(other)
        }
        B2.Box {
            id: topBoundary
            width: _bounds.width
            height: 2
            x: _bounds.x
            y: _bounds.y - height
            categories: itemBody.categories
            friction: itemBody.friction
            groupIndex: itemBody.groupIndex
            restitution: itemBody.restitution
            sensor: itemBody.sensor
            onBeginContact: itemBody.beginContact(other)
            onEndContact: itemBody.endContact(other)
        }
        B2.Box {
            id: leftBoundary
            width: 2
            height: _bounds.height
            x: _bounds.x - width
            y: _bounds.y
            categories: itemBody.categories
            friction: itemBody.friction
            groupIndex: itemBody.groupIndex
            restitution: itemBody.restitution
            sensor: itemBody.sensor
            onBeginContact: itemBody.beginContact(other)
            onEndContact: itemBody.endContact(other)
        }
        B2.Box {
            id: rightBoundary
            width: 2
            height: _bounds.height
            x: _bounds.x + _bounds.width
            y: _bounds.y
            categories: itemBody.categories
            friction: itemBody.friction
            groupIndex: itemBody.groupIndex
            restitution: itemBody.restitution
            sensor: itemBody.sensor
            onBeginContact: itemBody.beginContact(other)
            onEndContact: itemBody.endContact(other)
        }
    }
}
