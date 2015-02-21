import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import GameFrame 1.0 as GF
import "../Testbed" as App

Item {
    id: stage

    property alias sceneLoader: sceneLoader

    width: 800
    height: 600

    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal

        Rectangle {
            id: main

            color: "LightGray"
            Layout.minimumWidth: 50
            Layout.fillWidth: true

            App.SceneLoader { id: sceneLoader }
        }

        Rectangle {
            id: director

            width: 200
            color: "LightGray"

            Text {
                text: "Director"
                anchors.centerIn: parent
            }
        }
    }

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
}
