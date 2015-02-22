import QtQuick 2.4
import QtQuick.Controls 1.3
import "." 1.0 as App

QtObject {
    id: actions

    property var sceneLoader: App.Active.sceneLoader
    property var world: App.Active.world

    property Action appQuitAction: Action {
        text: qsTr("E&xit")
        tooltip: qsTr("Exit the application")
        onTriggered: Qt.quit();
    }

    property Action sceneReloadAction: Action {
        enabled: (sceneLoader && sceneLoader.source.toString() !== "")
        text: qsTr("Reload scene")
        tooltip: qsTr("Reload the current scene")
        onTriggered: sceneLoader.reloadSource();
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

    Component.onCompleted: {
        // Keep all the shortcut assignments here simply to group them together for clarity.
        appQuitAction.shortcut = StandardKey.Quit
        sceneReloadAction.shortcut = "Ctrl+S"
        worldDebugAction.shortcut = "Escape"
        worldRunningAction.shortcut = "Enter"
        worldSingleStepAction.shortcut = "Space"
    }
}
