import QtQuick 2.2
import SddmComponents 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.2

Column
{
    spacing: 5
    Text
    {
        id: buildLabel
        text: config.footer
        color: "#bcbcbc"
    }
    Text
    {
        id: hostnameLabel
        text: sddm.hostName
        anchors.right: parent.right
        color: "white"
        font.pixelSize: 16
    }
}
