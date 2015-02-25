pragma Singleton

import QtQuick 2.4
import QtQuick.Controls 1.3
import "." 1.0 as App

QtObject {
    id: actionsSingleton

    property var sceneEditor: App.Active.sceneEditor
    property var world: App.Active.world

    property Action appQuitAction: Action {
        text: qsTr("E&xit")
        tooltip: qsTr("Exit the application")
        onTriggered: Qt.quit();
    }

    property Action sceneReloadAction: Action {
        enabled: (sceneEditor)
        text: qsTr("Reload scene")
        tooltip: qsTr("Reload the current scene")
        onTriggered: sceneEditor.reload();
    }

    property Action worldDebugAction: Action {
        checkable: true
        checked: (world && world.debug)
        enabled: (world)
        text: checked ? qsTr("Hide debug visuals") : qsTr("Display debug visuals")
        tooltip: text + qsTr(" for the Box2D physics world")
        onTriggered: world.debug = !world.debug;
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
