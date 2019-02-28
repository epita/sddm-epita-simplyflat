import QtQuick 2.2
import SddmComponents 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.2

Rectangle
{
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width
    height: loginRoot.height
    color: "transparent"

    TextConstants { id: textConstants }
    Connections {
        target: sddm
        onLoginSucceeded: {
            errorMessageLabel.color = "steelblue"
            errorMessageLabel.text = textConstants.loginSucceeded
        }
        onLoginFailed: {
            errorMessageLabel.color = "red"
            errorMessageLabel.text = textConstants.loginFailed
        }
    }
    Rectangle
    {
        id: loginRoot
        width: 300
        anchors.horizontalCenter: parent.horizontalCenter
        height: 300
        color: "transparent"
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
            anchors.topMargin: 60
            style: TextFieldStyle {
                textColor: "black"
                background: Rectangle {
                    radius: 4
                    implicitWidth: 360
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
                passwordField.forceActiveFocus()
            }
        }
        TextField
        {
            id: passwordField
            placeholderText: "Password"
            horizontalAlignment: TextInput.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: userNameField.bottom
            anchors.topMargin: 5
            echoMode: TextInput.Password
            style: TextFieldStyle {
                textColor: "black"
                background: Rectangle {
                    radius: 4
                    implicitWidth: 360
                    implicitHeight: 30
                    border.color: "#333"
                    border.width: 1
                }
            }
            onAccepted:
            {
                parent.authUser()
            }
            onTextChanged:
            {
                errorMessageLabel.text = ""
            }
            Keys.onBacktabPressed:
            {
                userNameField.forceActiveFocus()
            }
            Keys.onTabPressed:
            {
                parent.authUser()
            }
        }
        // FIXME: For some reason, this is not a real button
        Button
        {
            id: loginButton
            anchors.top: passwordField.bottom
            anchors.left: passwordField.left
            anchors.topMargin: 30
            width: passwordField.width

            style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 35
                        border.color: "#00000000"
                        color: "#007ee3"
                        radius: 4
                        Text {
                            anchors.centerIn: parent
                            text: "Connexion"
                            color: "white"
                            font.bold: true
                            font.pixelSize: 14
                        }
                    }
            }
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: loginRoot.authUser()
            }
        }
        Row
        {
            spacing: 10
            anchors.top: loginButton.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 30
            SessionPicker
            {
                id: sessionPicker
            }
            KeyboardLayoutPicker
            {
                id: keyboardLayoutPicker
            }
        }

        Text
        {
            id: errorMessageLabel
            anchors.top: loginButton.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 30
            text: ""
            color: "red"
            font.pixelSize: 18
        }

        function authUser()
        {
            console.log("Trying to login with password " + passwordField.text)
            sddm.login(userNameField.text, passwordField.text, sessionPicker.index)
        }
    }
}
