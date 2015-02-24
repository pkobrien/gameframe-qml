import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import Box2D 2.0 as B2
import "." 1.0 as App

Rectangle {
    id: director

//    width: App.Settings.director.width
    width: Layout.width

    color: "#eeeeee"

    property var world: App.Active.world

    Layout.minimumWidth: App.Settings.director.width

    GroupBox {
        id: worldGroupBox

        title: "World"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 8
        Layout.fillWidth: true

        ColumnLayout {

//            width: parent.width - 16

            Layout.minimumWidth: App.Settings.director.width
            spacing: 8

            Text {
                text: "Initial Gravity X: " + App.Active.initialGravity.x
            }

            Text {
                text: "Current Gravity X: " + world.gravity.x
            }

            Rectangle {
//                width: parent.width
                height: 40
                color: "Transparent"
                border.width: 0
                Layout.fillWidth: true
                Slider {
                    anchors.fill: parent
                    maximumValue: Math.max(App.Settings.maxGravity.x, App.Active.maxGravity.x)
                    minimumValue: Math.min(App.Settings.minGravity.x, App.Active.minGravity.x)
                    updateValueWhileDragging: true
                    value: world.gravity.x
                    onValueChanged: world.gravity.x = value
                }
            }

            Text {
                text: "Initial Gravity Y: " + App.Active.initialGravity.y
            }

            Text {
                text: "Current Gravity Y: " + world.gravity.y
            }

            Rectangle {
//                width: parent.width
                height: 40
                color: "Transparent"
                border.width: 0
                Layout.fillWidth: true
                Slider {
                    anchors.fill: parent
                    maximumValue: Math.max(App.Settings.maxGravity.y, App.Active.maxGravity.y)
                    minimumValue: Math.min(App.Settings.minGravity.y, App.Active.minGravity.y)
                    updateValueWhileDragging: true
                    value: world.gravity.y
                    onValueChanged: world.gravity.y = value
                }
            }
        }
    }

    GroupBox {
        id: debugDrawGroupBox

        title: "DebugDraw"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: worldGroupBox.bottom
        anchors.margins: 8
        Layout.fillWidth: true

        ColumnLayout {

//            width: parent.width - 16

            Layout.minimumWidth: App.Settings.director.width
            spacing: 8

            App.DebugDrawFlagCheckBox {
                flag: B2.DebugDraw.AABB
                text: "AABB (Active Area Bounding Box)"
            }

            App.DebugDrawFlagCheckBox {
                flag: B2.DebugDraw.CenterOfMass
                text: "Center Of Mass"
            }

            App.DebugDrawFlagCheckBox {
                flag: B2.DebugDraw.Joint
                text: "Joint"
            }

            App.DebugDrawFlagCheckBox {
                flag: B2.DebugDraw.Pair
                text: "Pair"
            }

            App.DebugDrawFlagCheckBox {
                flag: B2.DebugDraw.Shape
                text: "Shape"
            }
        }
    }
}
