import QtQuick 2.4
import QtQuick.Controls 1.3
import "../Testbed" as App

MenuBar {
    id: menuBar

    Menu {
        title: "&File"
        MenuItem { action: actions.appQuitAction }
    }

    Menu {
        title: "&World"
        MenuItem { action: actions.worldDebugAction }
        MenuItem { action: actions.worldRunningAction }
        MenuItem { action: actions.worldSingleStepAction }
        MenuSeparator { }
        MenuItem { action: actions.sceneReloadAction }
    }

//    Menu {
//        title: "&Help"
//        MenuItem {
//            text: "About..."
//            onTriggered: aboutDialog.open()
//        }
//    }
}
