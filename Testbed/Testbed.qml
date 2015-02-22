import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import "." 1.0 as App

ApplicationWindow {
    id: appWindow

    width: 800
    height: 600

    title: "QML GameFrame Testbed"
    visible: true

    menuBar: App.MenuBar { }

    toolBar: App.ToolBar { }

    App.KeyHandler { }

    App.Stage { }

    statusBar: App.StatusBar { }
}
