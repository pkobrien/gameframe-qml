import QtQuick 2.4

Item {
    id: game

    property Scene activeScene
    property string domain
    property string name
    property string organization: name
    property string status
    property string version: "0.0.0"
//    property int updatesPerSecond: 30

//    focus: true

    function activate(scene) {
        if (game.activeScene) {
            game.activeScene.active = false;
        }
        game.activeScene = scene;
        scene.active = true;
    }

    onDomainChanged: Qt.application.domain = game.domain;
    onNameChanged: Qt.application.name = game.name;
    onOrganizationChanged: Qt.application.organization = game.organization;
    onVersionChanged: Qt.application.version = game.version

//    Timer {
//        id: timer
//        interval: 1000 / game.updatesPerSecond
//        repeat: true
//        onTriggered: { }
//    }

//    Component.onCompleted: timer.start();
}
