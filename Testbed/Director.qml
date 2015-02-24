import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import "." 1.0 as App

Rectangle {
    id: director

    width: 200
    color: "LightGray"

    ColumnLayout {

        spacing: 4

        Text {
            text: "World"
        }

        Text {
            text: "Gravity x: " + App.Active.world.gravity.x
        }

        Slider {
            maximumValue: 30
            minimumValue: -30
            updateValueWhileDragging: true
            value: App.Active.world.gravity.x
            onValueChanged: App.Active.world.gravity.x = value
        }

        Text {
            text: "Gravity y: " + App.Active.world.gravity.y
        }

        Slider {
            maximumValue: 30
            minimumValue: -30
            updateValueWhileDragging: true
            value: App.Active.world.gravity.y
            onValueChanged: App.Active.world.gravity.y = value
        }
    }
}
