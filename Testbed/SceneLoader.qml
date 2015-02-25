import QtQuick 2.4
import QtQuick.Controls 1.3
import "." 1.0 as App

Loader {
    id: sceneLoader

    signal selected()

    function reload() {
        if (source.toString() !== "") {
            var src = source;
            source = "";
            source = src;
        } else {
            var comp = sourceComponent;
            sourceComponent = undefined;
            sourceComponent = comp;
        }
    }

    onLoaded: {
        App.Active.scene = item;
        App.Active.scene.active = true;
    }

    onSelected: {
        if (App.Active.scene) {
            App.Active.scene.active = false;
        }
        if (App.Active.world) {
            App.Active.world.running = false;
        }
        App.Active.scene = item;
        App.Active.scene.active = true;
    }
}
