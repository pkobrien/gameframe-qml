pragma Singleton

import QtQuick 2.4
import QtQuick.Controls 1.3
import Box2D 2.0 as B2
import "." 1.0 as App

QtObject {
    id: actionsSingleton

    property bool debugAllowed: world && scene && scene.debugAllowed
    property var debugDraw: App.Active.debugDraw
    property var scene: App.Active.scene
    property var sceneEditor: App.Active.sceneEditor
    property var world: App.Active.world

    property Action appQuitAction: Action {
        text: qsTr("E&xit")
        tooltip: qsTr("Exit the application")
        onTriggered: Qt.quit();
    }

    property Action debugDrawAABBAction: Action {
        property int flag: B2.DebugDraw.AABB
        checkable: true
        checked: (enabled && debugDraw.flags & flag)
        enabled: debugAllowed
        text: qsTr("AABB (Axis-Aligned Bounding Box)")
        onTriggered: debugDrawFlagTriggered(flag);
    }

    property Action debugDrawCenterOfMassAction: Action {
        property int flag: B2.DebugDraw.CenterOfMass
        checkable: true
        checked: (enabled && debugDraw.flags & flag)
        enabled: debugAllowed
        text: qsTr("Center Of Mass")
        onTriggered: debugDrawFlagTriggered(flag);
    }

    property Action debugDrawJointAction: Action {
        property int flag: B2.DebugDraw.Joint
        checkable: true
        checked: (enabled && debugDraw.flags & flag)
        enabled: debugAllowed
        text: qsTr("Joint")
        onTriggered: debugDrawFlagTriggered(flag);
    }

    property Action debugDrawPairAction: Action {
        property int flag: B2.DebugDraw.Pair
        checkable: true
        checked: (enabled && debugDraw.flags & flag)
        enabled: debugAllowed
        text: qsTr("Pair")
        onTriggered: debugDrawFlagTriggered(flag);
    }

    property Action debugDrawShapeAction: Action {
        property int flag: B2.DebugDraw.Shape
        checkable: true
        checked: (enabled && debugDraw.flags & flag)
        enabled: debugAllowed
        text: qsTr("Shape")
        onTriggered: debugDrawFlagTriggered(flag);
    }

    property Action sceneReloadAction: Action {
        enabled: (sceneEditor)
        text: qsTr("Reload scene")
        tooltip: qsTr("Reload the current scene")
        onTriggered: sceneEditor.reload();
    }

    property Action worldDebugAction: Action {
        checkable: true
        checked: (enabled && scene.debug)
        enabled: debugAllowed
        text: checked ? qsTr("Hide debug visuals") : qsTr("Display debug visuals")
        tooltip: text + qsTr(" for the Box2D physics world")
        onTriggered: scene.debug = !scene.debug;
    }

    property Action worldRunningAction: Action {
        checkable: true
        checked: (world && world.running)
        enabled: (world)
        text: checked ? qsTr("Pause world") : qsTr("Start world")
        tooltip: text + qsTr(" for the Box2D physics world")
        onTriggered: world.running = !world.running;
    }

    property Action worldSingleStepAction: Action {
        enabled: (world)
        text: qsTr("Single step")
        tooltip: qsTr("Run a single step of the Box2D physics world")
        onTriggered: { world.running = false; world.step(); }
    }

    function debugDrawFlagTriggered(flag) {
        if (debugDraw.flags & flag) {
            debugDraw.flags &= ~flag;
        } else {
            debugDraw.flags |= flag;
        }
    }

    function keyPressed(event, source) {
        if (event.matches(StandardKey.Quit) ||
                (event.key === Qt.Key_Q && event.modifiers === Qt.ControlModifier)) {
            appQuitAction.trigger(source);
        } else if (event.key === Qt.Key_R && event.modifiers === Qt.ControlModifier) {
            sceneReloadAction.trigger(source);
        } else if (event.key === Qt.Key_Escape) {
            worldDebugAction.trigger(source);
        } else if (event.key === Qt.Key_Enter) {
            worldRunningAction.trigger(source);
        } else if (event.key === Qt.Key_Space) {
            worldSingleStepAction.trigger(source);
        } else {
            event.accepted = false;
            return;
        }
        event.accepted = true;
    }

    Component.onCompleted: {
        // Keep all the shortcut assignments here simply to group them together for clarity.
        appQuitAction.shortcut = "Ctrl+Q"
        sceneReloadAction.shortcut = "Ctrl+R"
        worldDebugAction.shortcut = "Escape"
        worldRunningAction.shortcut = "Enter"
        worldSingleStepAction.shortcut = "Space"
        // There is currently a bug in QML when this file is a singleton whereby the shortcuts
        // no longer work. Therefore the key handling is also handled in the keyPressed function.
    }
}
