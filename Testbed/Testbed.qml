import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import "." 1.0 as App

ApplicationWindow {
    id: appWindow

    width: App.Settings.appWindow.width
    height: App.Settings.appWindow.height

    title: App.Settings.appWindow.title
    visible: true

    menuBar: App.MenuBar { }

    toolBar: App.ToolBar { }

    App.Stage { }

    statusBar: App.StatusBar { }

    Item {
        id: keyHandler
        Keys.onPressed: App.Actions.keyPressed(event, appWindow)
    }
}
