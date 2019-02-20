import QtQuick 2.7
import SddmComponents 2.0
import "components"

Rectangle
{
    id: root
    color: colors.background
    property variant geometry: screenModel.geometry(screenModel.primary)
    ColorScheme { id: colors }
    Image {
        source: "assets/background.jpg";
        fillMode: Image.Tile;
        anchors.fill: parent;
        opacity: 0.4
    }
    Image
    {
        id: logo
        width: parent.width
        height: parent.height / 4
        y: parent.height / 12
        fillMode: Image.PreserveAspectFit
        source: config.logo
    }
    LoginLayout
    {
        id: loginLayout
        anchors.top: logo.bottom
        anchors.topMargin: 60
    }
    PowerControls
    {
        id: powerControls
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
    }
//    Rectangle
//    {
//        id: bandeau
//        color: colors.foreground
//        width: geometry.width
//        height: geometry.height / 2 - 20
//        y: geometry.height * 9 / 20
//
//
//        Row
//        {
//            width: geometry.width / 2
//            anchors.horizontalCenter: parent.horizontalCenter
//            Text
//            {
//                id: titleLabel
//                y: config.offset_top
//                anchors.horizontalCenter: parent.horizontalCenter
//                color: "white"
//                text: config.title
//                font.pixelSize: 40
//            }
//
//            PlaceholderTextbox
//            {
//                id: usernameTextbox
//                y: titleLabel.y + titleLabel.height + 20
//                KeyNavigation.tab: passwordTextbox
//                placeholder: "Login"
//            }
//            PlaceholderTextbox
//            {
//                id: passwordTextbox
//                y: usernameTextbox.y + usernameTextbox.height + 20
//                KeyNavigation.tab: passwordTextbox
//                KeyNavigation.backtab: usernameTextbox
//                echoMode: TextInput.Password
//                placeholder: "Password"
//            }
//        }
//    }
}
