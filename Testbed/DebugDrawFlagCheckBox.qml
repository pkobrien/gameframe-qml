import QtQuick 2.4
import QtQuick.Controls 1.3
import Box2D 2.0 as B2
import "." 1.0 as App

CheckBox {
    id: debugDrawFlagCheckBox

    property int flag

    checked: (App.Active.debugDraw.flags & flag)

    onClicked: {
         if (checked) {
             App.Active.debugDraw.flags |= flag;
         } else {
             App.Active.debugDraw.flags &= ~flag;
         }
         checked = Qt.binding(function() { return (App.Active.debugDraw.flags & flag); });
    }
}
