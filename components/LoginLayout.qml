import QtQuick 2.11
import SddmComponents 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle
{
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width
    height: loginRoot.height
    color: "transparent"
    Rectangle
    {
        id: loginRoot
        width: 300
        anchors.horizontalCenter: parent.horizontalCenter
        height: 300
        color: "transparent"
        state: "login"
        states: [
            State {
                name: "login"
                PropertyChanges { target: userNameField; visible: true }
                PropertyChanges { target: userNameLabel; visible: false; opacity: 0 }
                PropertyChanges { target: passwordField; visible: false; opacity:0 }
            },
            State {
                name: "password"
                PropertyChanges { target: userNameField; visible: false }
                PropertyChanges { target: passwordField; visible: true; opacity: 1 }
                AnchorChanges { target: keyboardLayoutPicker; anchors.top: passwordField.top }
            }
        ]
        //transitions: Transition {
        //    from: "login"; to: "password";
        //    PropertyAnimation {
        //        target: userNameLabel; properties: "opacity"; duration: 0
        //    }
        //    PropertyAnimation {
        //        target: passwordField; properties: "opacity"; duration: 0
        //    }
        //    AnchorAnimation {
        //        targets: [keyboardLayoutPicker]; duration: 0
        //    }
        //}
        UserAvatar
        {
            id: userAvatar
            width: 200
            height: 200
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 20
        }
        TextField
        {
            id: userNameField
            placeholderText: "Login / Email"
            horizontalAlignment: TextInput.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: userAvatar.bottom
            anchors.topMargin: 20
            style: TextFieldStyle {
                textColor: "black"
                background: Rectangle {
                    radius: 20
                    opacity: 0.6
                    implicitWidth: 280
                    implicitHeight: 30
                    border.color: "#333"
                    border.width: 1
                }
            }
            onAccepted: {
                beginAuth()
            }
            Keys.onTabPressed:
            {
                beginAuth()
            }
            function beginAuth()
            {
                if (text.endsWith("@epita.fr")) {
                    text = text.replace("@epita.fr", "")
                }
                console.log("Logging in with login " + text)
                userAvatar.source = config.photo_url + text
                loginRoot.state = "password"
                passwordField.forceActiveFocus()
            }
        }
        Text
        {
            id: userNameLabel
            anchors.top: userAvatar.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 10
            text: userNameField.text
            font.pixelSize: 25
            color: "white"
            opacity: 0.8
        }
        KeyboardLayoutPicker
        {
            id: keyboardLayoutPicker
            anchors.right: passwordField.left
            anchors.rightMargin: 5
            anchors.top: userNameField.top
        }
        TextField
        {
            id: passwordField
            placeholderText: "Password"
            horizontalAlignment: TextInput.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: userNameLabel.bottom
            anchors.topMargin: 20
            echoMode: TextInput.Password
            style: TextFieldStyle {
                textColor: "black"
                background: Rectangle {
                    radius: 20
                    implicitWidth: 280
                    implicitHeight: 30
                    border.color: "#333"
                    border.width: 1
                    opacity: 0.6
                }
            }
            onAccepted:
            {
                authUser()
            }
            Keys.onBacktabPressed:
            {
                loginRoot.state = "login"
                userNameField.forceActiveFocus()
            }
            Keys.onTabPressed:
            {
                authUser()
            }
            function authUser()
            {
                console.log("Trying to login with password " + text)
            }
        }
    }
}
