import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import GameFrame 1.0 as GF
import "../Testbed" as App

GF.ApplicationWindow {
    id: appWindow

    property var activeScene
    property string statusText
    property var world: activeScene ? activeScene.world : null

    width: 800
    height: 600

    title: "QML GameFrame Testbed"

    Binding on statusText {
        when: world
        value: { if (world) qsTr("[Debug: %1]  [Paused: %2]  [Gravity: %3]").arg(
                                world.debug).arg(!world.running).arg(world.gravity) }
    }

    menuBar: App.MenuBar { }

    toolBar: App.ToolBar { }

//    Item {
//        id: keyHandler
//        focus: true
//        Keys.onEnterPressed: { if (world) world.running = !world.running; }
//        Keys.onSpacePressed: { if (world) world.debug = !world.debug; }
//    }

//    MouseArea {
//        id: mouseArea
//        anchors.fill: parent
//        hoverEnabled: true
//        onClicked:
//        onPositionChanged:
//    }

//    Item {
//        id: item

//        ScrollView {
//            id: scrollView

//            horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOn
//            verticalScrollBarPolicy: Qt.ScrollBarAlwaysOn

//        }
//    }

    App.Actions { id: actions }

    App.SceneLoader { id: sceneLoader }

    statusBar: StatusBar {
        width: appWindow.width
        RowLayout {
            anchors.fill: parent
            Label { text: appWindow.statusText }
        }
    }
}
