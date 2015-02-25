import QtQuick 2.4
import QtQuick.Controls 1.3
import "." 1.0 as App

TabView {
    id: sceneTabView

    onCurrentIndexChanged: {
        var tab = getTab(currentIndex);
        tab.selected();
    }

    App.SceneTab {
        title: "* Improv 1 *"
        scroll: false
    }

    App.SceneTab {
        title: "* Improv 2 *"
    }

    App.SceneTab {
        title: "Scene.qml"
        source: "./examples/fixtures/Scene.qml"
    }
}
