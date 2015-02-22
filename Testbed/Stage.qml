import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import "." 1.0 as App

SplitView {
    id: stage

    anchors.fill: parent
    orientation: Qt.Horizontal

    App.SceneTabView {
        id: sceneTabView

        Layout.minimumWidth: 100
        Layout.fillWidth: true
    }

    Rectangle {
        id: director

        width: 200
        color: "LightGray"
        Layout.minimumWidth: 200

        Text {
            text: "Director"
            anchors.centerIn: parent
        }
    }

    Component.onCompleted: sceneTabView.currentIndexChanged();
}
