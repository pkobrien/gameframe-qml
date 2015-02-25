import QtQuick 2.4
import Box2D 2.0 as B2
import GameFrame 1.0 as GF

GF.DynamicBody {
    id: ball

    property color color: "Yellow"
    property real friction: 0.01
    property real radius: 20

//    angularDamping: 0.5
    objectName: "ball"
    sleepingAllowed: false

    ScaleAnimator on scale {
        from: 0.1;
        to: 1;
        duration: 200;
    }

    fixtures: B2.Circle {
        id: circle
        radius: ball.radius
        x: -radius
        y: -radius
        density: 1
        friction: ball.friction
        restitution: 1
    }

    Rectangle {
        id: visual
        width: ball.radius * 2
        height: width
        anchors.centerIn: ball
        border.color: Qt.lighter(ball.color)
        border.width: 1
        radius: width / 2
        smooth: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: ball.color }
            GradientStop { position: 0.5; color: ball.color }
            GradientStop { position: 1.0; color: "Black" }
        }
    }
}
