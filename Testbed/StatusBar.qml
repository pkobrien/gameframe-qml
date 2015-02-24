import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import "." 1.0 as App

StatusBar {
    id: statusBar

    width: parent.width

    RowLayout {
        anchors.fill: parent
        Label { text: App.Active.statusText }
    }
}
