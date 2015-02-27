import QtQuick 2.4
import QtQuick.Controls 1.3

CheckBox {
    id: actionCheckBox

    property Action action

    checked: action.checked
    text: action.text

    onClicked: {
        action.trigger(actionCheckBox)
        checked = Qt.binding(function() { return action.checked; });
    }
}
