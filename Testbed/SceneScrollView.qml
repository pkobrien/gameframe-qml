import QtQuick 2.4
import QtQuick.Controls 1.3
import "." 1.0 as App

ScrollView {

    anchors.fill: parent

    property alias sceneLoader: sceneLoader

    signal selected()

    onSelected: {
        sceneLoader.selected()
    }

    App.SceneLoader {
        id: sceneLoader
    }
}
