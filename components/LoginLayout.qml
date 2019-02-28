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
                passwordField.forceActiveFocus()
            }
        }
        SessionPicker
        {
            id: sessionPicker
            anchors.right: passwordField.left
            anchors.rightMargin: 5
            anchors.top: passwordField.top
        }
        KeyboardLayoutPicker
        {
            id: keyboardLayoutPicker
            anchors.right: userNameField.left
            anchors.rightMargin: 5
            anchors.top: userNameField.top
        }
        TextField
        {
            id: passwordField
            placeholderText: "Password"
            horizontalAlignment: TextInput.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: userNameField.bottom
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
            anchors.topMargin: 20
            width: passwordField.width
            text: "Connexion"

            style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 25
                        border.color: "#00000000"
                        color: "#007ee3"
                        radius: 4
                    }
            }
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: loginRoot.authUser()
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
