import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import "." 1.0 as App

SplitView {
    id: stage

    anchors.fill: parent
    focus: true
    orientation: App.Settings.stage.orientation

    App.SceneTabView {
        id: sceneTabView

        Layout.minimumWidth: App.Settings.sceneTabView.minimumWidth
        Layout.fillWidth: true
    }

    App.Director {
        id: director

        Layout.minimumWidth: App.Settings.director.minimumWidth
    }

    Component.onCompleted: sceneTabView.currentIndexChanged();

    Keys.onPressed: App.Actions.keyPressed(event, stage)
}
