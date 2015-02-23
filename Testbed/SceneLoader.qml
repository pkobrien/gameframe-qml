import QtQuick 2.4
import QtQuick.Controls 1.3
import "." 1.0 as App

Loader {
    id: sceneLoader

    function reload() {
        App.Active.scene = null;
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
}
