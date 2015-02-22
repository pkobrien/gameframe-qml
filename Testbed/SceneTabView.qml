import QtQuick 2.4
import QtQuick.Controls 1.3
import "." 1.0 as App

TabView {
    id: sceneTabView

    onCurrentIndexChanged: {
        if (App.Active.scene) {
            App.Active.scene.active = false;
        }
        if (App.Active.world) {
            App.Active.world.running = false;
        }
        var tab = getTab(currentIndex);
        var scene = tab.item;
        scene.active = true;
        App.Active.scene = scene;
        App.Active.sceneLoader = tab;
    }

    Component {
        id: emptySceneComp
        App.EmptyScene {
            anchors.fill: parent
        }
    }

    App.SceneTab {
        active: true
        sourceComponent: emptySceneComp
        title: "* Improv *"
    }

    App.SceneTab {
        source: "./examples/fixtures/Scene.qml"
        title: "Scene.qml"
    }
}
