import QtQuick 2.11
import SddmComponents 2.0
import QtGraphicalEffects 1.0

ComboBox {
    id: sessionPicker
    width: 200
    height: 28
    arrowIcon: "../assets/angle-down.png"
    model: sessionModel
    index: sessionModel.lastIndex
}
