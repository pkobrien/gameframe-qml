import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import GameFrame 1.0 as GF

GF.ApplicationWindow {
    id: applicationWindow

    width: 800
    height: 600

    maximumWidth: width
    maximumHeight: height

    minimumWidth: width
    minimumHeight: height

    title: "QML GameFrame Testbed"

    Rectangle {
        anchors.fill: parent
        color: "Red"
    }
}
