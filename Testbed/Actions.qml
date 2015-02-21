import QtQuick 2.4
import QtQuick.Controls 1.3

QtObject {
    id: actions

    property Action worldDebugAction: Action {
        checkable: true
        checked: world.debug
        enabled: (world)
        text: checked ? qsTr("Leave Debug Mode") : qsTr("Enter Debug Mode")
        tooltip: text + qsTr(" for the Box2D physics world")
        onTriggered: world.debug = !world.debug;
    }

    Component.onCompleted: {
        // Keep all the shortcut assignments here simply to group them together for clarity.
        worldDebugAction.shortcut = "Escape"
    }
}
