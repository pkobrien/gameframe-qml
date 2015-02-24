import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import "." 1.0 as App

ToolBar {
    id: toolBar

    height: App.Settings.toolBar.height
    RowLayout {
        anchors.fill: parent
        ToolButton { action: App.Actions.worldDebugAction }
        ToolButton { action: App.Actions.worldRunningAction }
        ToolButton { action: App.Actions.worldSingleStepAction }
        Item { Layout.fillWidth: true }
        ToolButton { action: App.Actions.sceneReloadAction }
    }
}
