import QtQuick 2.4
import QtQuick.Controls 1.3

QtObject {
    id: actions

    property Action appQuitAction: Action {
        text: qsTr("E&xit")
        tooltip: qsTr("Exit the application")
        onTriggered: Qt.quit();
    }

    property Action worldDebugAction: Action {
        checkable: true
        checked: (world && world.debug)
        enabled: (world)
        text: checked ? qsTr("Leave Debug Mode") : qsTr("Enter Debug Mode")
        tooltip: text + qsTr(" for the Box2D physics world")
        onTriggered: world.debug = !world.debug;
    }

    property Action worldRunningAction: Action {
        checkable: true
        checked: (world && world.running)
        enabled: (world)
        text: checked ? qsTr("Pause World") : qsTr("Start World")
        tooltip: text + qsTr(" for the Box2D physics world")
        onTriggered: world.running = !world.running;
    }

    property Action worldSingleStepAction: Action {
        enabled: (world)
        text: qsTr("Single Step")
        tooltip: qsTr("Run a single step of the Box2D physics world")
        onTriggered: { world.running = false; world.step(); }
    }

    Component.onCompleted: {
        // Keep all the shortcut assignments here simply to group them together for clarity.
        appQuitAction.shortcut = StandardKey.Quit
        worldDebugAction.shortcut = "Escape"
        worldRunningAction.shortcut = "Enter"
        worldSingleStepAction.shortcut = "Space"
    }
}
