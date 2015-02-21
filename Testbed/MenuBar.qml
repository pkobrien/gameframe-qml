import QtQuick 2.4
import QtQuick.Controls 1.3

MenuBar {
    id: menuBar

    Menu {
        title: "&File"
        MenuItem {
            text: "E&xit"
            shortcut: StandardKey.Quit
            onTriggered: Qt.quit()
        }
    }

    Menu {
        title: "&Debug"
        MenuItem { action: actions.worldDebugAction }
    }

//    Menu {
//        title: "&Help"
//        MenuItem {
//            text: "About..."
//            onTriggered: aboutDialog.open()
//        }
//    }
}
