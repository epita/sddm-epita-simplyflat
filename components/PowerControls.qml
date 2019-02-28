import QtQuick 2.2
import SddmComponents 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Row
{
    anchors.horizontalCenter: parent.horizontalCenter
    spacing: 20
    Button
    {
        id: rebootButton
        width: 200

        style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    border.color: "#00000000"
                    color: "#e3b500"
                    radius: 4
                    Text {
                        anchors.centerIn: parent
                        text: "Reboot"
                        font.bold: true
                        font.pixelSize: 16
                    }
                }
        }
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: loginRoot.authUser()
        }
    }
    Button
    {
        id: poweroffButton
        width: 200

        style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    border.color: "#00000000"
                    color: "#e30000"
                    radius: 4
                    Text {
                        anchors.centerIn: parent
                        text: "Poweroff"
                        font.bold: true
                        font.pixelSize: 16
                    }
                }
        }
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: loginRoot.authUser()
        }
    }
}
