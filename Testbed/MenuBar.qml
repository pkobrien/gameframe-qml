import QtQuick 2.4
import QtQuick.Controls 1.3
import "." 1.0 as App

MenuBar {
    id: menuBar

    Menu {
        title: "&File"
        MenuItem { action: App.Actions.appQuitAction }
    }

    Menu {
        title: "&World"
        MenuItem { action: App.Actions.worldDebugAction }
        MenuItem { action: App.Actions.worldRunningAction }
        MenuItem { action: App.Actions.worldSingleStepAction }
        MenuSeparator { }
        MenuItem { action: App.Actions.sceneReloadAction }
    }

    Menu {
        title: "&Debug Draw"
        MenuItem { action: App.Actions.debugDrawAABBAction }
        MenuItem { action: App.Actions.debugDrawCenterOfMassAction }
        MenuItem { action: App.Actions.debugDrawJointAction }
        MenuItem { action: App.Actions.debugDrawPairAction }
        MenuItem { action: App.Actions.debugDrawShapeAction }
    }
}
