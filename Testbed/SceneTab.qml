import QtQuick 2.4
import QtQuick.Controls 1.3
import "." 1.0 as App

Tab {
    id: sceneTab

    active: true

    property bool scroll: true
    property string source: ""

    signal selected()

    onSelected: {
        item.selected()
    }

    SceneEditor {
        anchors.fill: parent
        scroll: sceneTab.scroll
        source: sceneTab.source
    }
}
