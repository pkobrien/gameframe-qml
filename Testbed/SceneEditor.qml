import QtQuick 2.4
import QtQuick.Controls 1.3
import Box2D 2.0 as B2
import "." 1.0 as App

Item {
    id: sceneEditor

    property bool scroll: true
    property alias source: sceneLoader.source

    signal selected()

    function reload() {
        sceneLoader.reload();
    }

    onSelected: {
        App.Active.sceneEditor = sceneEditor;
        sceneLoader.selected();
    }

    Rectangle {
        id: sceneView
        width: sceneLoader.width + 24
        height: sceneLoader.height + 24
        x: Math.max(0, Math.round((sceneEditor.width - width) / 2))
        y: Math.max(0, Math.round((sceneEditor.height - height) / 2))

        border.color: "DarkGray"
        border.width: sceneEditor.scroll ? 1 : 0
        color: "White"
        radius: 6

        App.SceneLoader {
            id: sceneLoader
            anchors.centerIn: parent
        }

        MouseArea {
            id: mouseArea

            property real ppm: App.Active.world.pixelsPerMeter

            anchors.fill: sceneLoader
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true

            onClicked: {
                console.log("clicked", mouse.x, mouse.y);
            }

            onExited: App.Active.statusText = "";

            onPositionChanged: {
                App.Active.statusText = "Mouse @  X px: %1,  Y px: %2,   World X m: %3,  World Y m: %4".arg(
                            mouse.x).arg(mouse.y).arg(mouse.x / ppm).arg(mouse.y / ppm);
            }
        }
    }

    ScrollView {
        id: scrollView

        anchors.fill: parent
        enabled: visible
        visible: sceneEditor.scroll
    }

    Component {
        id: emptySceneComp
        App.EmptyScene {
            width: App.Settings.emptyScene.width
            height: App.Settings.emptyScene.height
        }
    }

    Component.onCompleted: {
        if (sceneLoader.source.toString() === "") {
            sceneLoader.sourceComponent = emptySceneComp;
        }
        if (sceneEditor.scroll) {
            scrollView.contentItem = sceneView;
        } else {
            sceneView.anchors.fill = sceneEditor;
            sceneLoader.anchors.fill = sceneView;
        }
    }
}
