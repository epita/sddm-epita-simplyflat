import QtQuick 2.11
import SddmComponents 2.0
import QtGraphicalEffects 1.0

ComboBox {
    id: layoutPicker
    model: keyboard.layouts
    index: keyboard.currentLayout
    width: 175
    height: 28
    arrowIcon: "../assets/angle-down.png"
    onValueChanged: keyboard.currentLayout = id

    Connections {
        target: keyboard
        onCurrentLayoutChanged: combo.index = keyboard.currentLayout
    }

    rowDelegate: Rectangle {
        color: "transparent"
        Image {
            id: img
            source: "/usr/share/sddm/flags/%1.png".arg(modelItem ? modelItem.modelData.shortName : "zz")
            anchors.margins: 4
            fillMode: Image.PreserveAspectFit
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
        }
        Text {
            anchors.margins: 4
            anchors.left: img.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            verticalAlignment: Text.AlignVCenter
            text: modelItem ? modelItem.modelData.longName : "zz"
        }
    }
}
