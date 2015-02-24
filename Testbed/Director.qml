import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import "." 1.0 as App

Rectangle {
    id: director

    width: App.Settings.director.width

    color: "LightGray"

    property var world: App.Active.world

    ColumnLayout {

        spacing: 4

        Text {
            text: "World"
        }

        Text {
            text: "Initial Gravity x: " + App.Active.initialGravity.x
        }

        Text {
            text: "Current Gravity x: " + world.gravity.x
        }

        Slider {
            maximumValue: Math.max(App.Settings.maxGravity.x, App.Active.maxGravity.x)
            minimumValue: Math.min(App.Settings.minGravity.x, App.Active.minGravity.x)
            updateValueWhileDragging: true
            value: world.gravity.x
            onValueChanged: world.gravity.x = value
        }

        Text {
            text: "Initial Gravity y: " + App.Active.initialGravity.y
        }

        Text {
            text: "Current Gravity y: " + world.gravity.y
        }

        Slider {
            maximumValue: Math.max(App.Settings.maxGravity.y, App.Active.maxGravity.y)
            minimumValue: Math.min(App.Settings.minGravity.y, App.Active.minGravity.y)
            updateValueWhileDragging: true
            value: world.gravity.y
            onValueChanged: world.gravity.y = value
        }
    }
}
