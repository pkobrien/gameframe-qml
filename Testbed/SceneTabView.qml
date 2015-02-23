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
        var scene = tab.item.scene;
        scene.active = true;
        App.Active.scene = scene;
        App.Active.sceneLoader = tab.item.sceneLoader;
    }

    Component {
        id: emptySceneComp
        App.EmptyScene {
            width: 600
            height: 400
        }
    }

    App.SceneTab {
        title: "* Improv *"

        Component.onCompleted: {
            item.sceneLoader.sourceComponent = emptySceneComp;
        }
    }

    App.SceneTab {
        title: "Scene.qml"

        Component.onCompleted: {
            item.sceneLoader.source = "./examples/fixtures/Scene.qml";
        }
    }
}
