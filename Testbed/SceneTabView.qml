import QtQuick 2.4
import QtQuick.Controls 1.3
import "." 1.0 as App

TabView {

    onCurrentIndexChanged: {
        var tab = getTab(currentIndex);
        tab.selected();
    }

    App.SceneTab {
        title: "* Improv 1 *"

        scroll: false

        Component.onCompleted: {
            loadEmptyScene();
        }
    }

    App.SceneTab {
        title: "* Improv 2 *"

        Component.onCompleted: {
            loadEmptyScene();
        }
    }

    App.SceneTab {
        title: "Scene.qml"

        Component.onCompleted: {
            loadSource("./examples/fixtures/Scene.qml");
        }
    }
}
