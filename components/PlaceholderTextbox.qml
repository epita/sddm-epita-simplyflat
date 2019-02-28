import QtQuick 2.11

import SddmComponents 2.0

TextBox
{
    property alias placeholder: placeholderLabel.text
    anchors.horizontalCenter: parent.horizontalCenter
    color: colors.input_background
    height: 40
    radius: 3
    width: parent.width / 3
    font.pixelSize: 18
    ColorScheme { id: colors }
    Text
    {
        id: placeholderLabel
        x: parent.x
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: "Login"
        font.pixelSize: parent.font.pixelSize
        visible: parent.text.length <= 0
        color: colors.placeholder_color
    }
}
