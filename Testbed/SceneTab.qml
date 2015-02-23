import QtQuick 2.4
import QtQuick.Controls 1.3
import "." 1.0 as App

Tab {
    id: tab

    active: true

    property bool scroll: true

    signal selected()

    function loadEmptyScene() {
        item.view.sceneLoader.loadEmptyScene(scroll);
    }

    function loadSource(sceneSource) {
        item.view.sceneLoader.source = sceneSource;
    }

    function loadSourceComponent(sceneSourceComp) {
        item.view.sceneLoader.sourceComponent = sceneSourceComp;
    }

    onSelected: {
        item.view.selected()
    }

    Item {
        anchors.fill: parent
        property var view
    }

    Component.onCompleted: {
        var name = (scroll) ? "SceneScrollView.qml" : "SceneView.qml"
        var comp = Qt.createComponent(name);
        var view = comp.createObject(item);
        item.view = view;
    }
}
