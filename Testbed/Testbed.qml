import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import GameFrame 1.0 as GF
import "../Testbed" as App

GF.ApplicationWindow {
    id: appWindow

    property var scene
    property string statusText
    property var world: scene ? scene.world : null

    width: 800
    height: 600

    title: "QML GameFrame Testbed"

    Binding on statusText {
        when: world
        value: { if (world) qsTr("[Debug: %1]  [Paused: %2]  [Gravity: %3]").arg(
                                world.debug).arg(!world.running).arg(world.gravity) }
    }

    menuBar: App.MenuBar { }

    Item {
        id: keyHandler
        focus: true
        Keys.onEnterPressed: { if (world) world.running = !world.running; }
//        Keys.onSpacePressed: { if (world) world.debug = !world.debug; }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
//        onClicked:
//        onPositionChanged:
    }

    Loader {
        id: sceneLoader
        anchors.fill: parent
        focus: false
        source: "./examples/fixtures/Scene.qml"
        onLoaded: {
            scene = item;
            scene.active = true;
        }
    }

    App.Actions { id: actions }

    statusBar: StatusBar {
        width: appWindow.width
        RowLayout {
            anchors.fill: parent
            Label { text: appWindow.statusText }
        }
    }
}
