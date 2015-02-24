import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import "." 1.0 as App

SplitView {
    id: stage

    focus: true

    anchors.fill: parent
    orientation: Qt.Horizontal

    App.SceneTabView {
        id: sceneTabView

        Layout.minimumWidth: 100
        Layout.fillWidth: true
    }

    App.Director {
        id: director

        Layout.minimumWidth: width
    }

    Component.onCompleted: sceneTabView.currentIndexChanged();

    Keys.onPressed: App.Actions.keyPressed(event, stage)
}
