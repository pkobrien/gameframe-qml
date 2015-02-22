import QtQuick 2.4
import QtQuick.Controls 1.3
import GameFrame 1.0 as GF
import "." 1.0 as App

Tab {
    id: sceneTab

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

//    Item {
//        ScrollView {
//            id: scrollView
//            horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOn
//            verticalScrollBarPolicy: Qt.ScrollBarAlwaysOn
//        }
//    }

}
