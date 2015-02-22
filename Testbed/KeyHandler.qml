import QtQuick 2.4
//import QtQuick.Controls 1.3
import "." 1.0 as App

// There is currently a bug in QML when the Actions.qml file is a singleton
// whereby the shortcuts do not work. So the key handling is also defined here.

Item {
    id: keyHandler
    focus: true

    // "Enter" for worldRunningAction.
    Keys.onEnterPressed: App.Actions.worldRunningAction.trigger(keyHandler)

    // "Escape" for worldDebugAction.
    Keys.onEscapePressed: App.Actions.worldDebugAction.trigger(keyHandler)

    // "Space" for worldSingleStepAction.
    Keys.onSpacePressed: App.Actions.worldSingleStepAction.trigger(keyHandler)

    Keys.onPressed: {

        // "Ctrl+Q" or StandardKey.Quit for appQuitAction.
        if (event.matches(StandardKey.Quit) ||
                (event.key === Qt.Key_Q && event.modifiers === Qt.ControlModifier)) {
            App.Actions.appQuitAction.trigger(keyHandler);

        // "Ctrl+R" for sceneReloadAction.
        } else if (event.key === Qt.Key_R && event.modifiers === Qt.ControlModifier) {
            App.Actions.sceneReloadAction.trigger(keyHandler);

        } else {
            return;
        }
        event.accept = true;
    }
}
