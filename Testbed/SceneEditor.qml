import QtQuick 2.4
import QtQuick.Controls 1.3
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

    ScrollView {
        id: scrollView

        anchors.fill: parent
        enabled: visible

        App.SceneLoader {
            id: sceneLoader
        }
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
        if (!sceneEditor.scroll) {
            sceneLoader.parent = sceneEditor;
            sceneLoader.anchors.fill = sceneEditor;
            scrollView.visible = false;
        }
    }
}
