import QtQuick 2.4
import "." 1.0 as App

Item {
    id: sceneView

    anchors.fill: parent

    property alias sceneLoader: sceneLoader

    signal selected()

    onSelected: {
        sceneLoader.selected()
    }

    App.SceneLoader {
        id: sceneLoader

        anchors.fill: parent
    }
}
