import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import "." 1.0 as App

ToolBar {
    id: toolbar

    property var actions: App.Active.actions

    height: 40
    RowLayout {
        anchors.fill: parent
        ToolButton { action: actions.worldDebugAction }
        ToolButton { action: actions.worldRunningAction }
        ToolButton { action: actions.worldSingleStepAction }
        Item { Layout.fillWidth: true }
        ToolButton { action: actions.sceneReloadAction }
    }
}
