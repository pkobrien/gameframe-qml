import QtQuick 2.4
import GameFrame 1.0 as GF

Loader {
    id: sceneLoader

    function reloadSource() {
        var src = source;
        source = "";
        source = src;
    }

    anchors.fill: parent
    focus: false
    source: "./examples/fixtures/Scene.qml"
//    sourceComponent: emptySceneComp
    onLoaded: {
        activeScene = item;
        activeScene.active = true;
    }

    Component {
        id: emptySceneComp
        GF.Scene {
            world: GF.World { }
        }
    }
}
