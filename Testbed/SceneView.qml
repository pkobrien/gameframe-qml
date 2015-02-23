import QtQuick 2.4
import QtQuick.Controls 1.3
import "." 1.0 as App

ScrollView {

    property alias scene: sceneLoader.item
    property alias sceneLoader: sceneLoader

    App.SceneLoader {
        id: sceneLoader
    }
}
