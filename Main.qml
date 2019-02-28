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
    Rectangle
    {
    id: imageNameBanner
    anchors.top: parent.top
    anchors.topMargin: 20
    height: 40
    width: parent.width
    color: config.title_bg
    Text
    {
        anchors.top: parent.top
        font.pixelSize: 32
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
        text: config.title
    }
    }
    Image
    {
        id: logo
        anchors.top: imageNameBanner.bottom
        anchors.bottom: loginLayout.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        anchors.bottomMargin: 20
        fillMode: Image.PreserveAspectFit
        source: config.logo
    }
    LoginLayout
    {
        id: loginLayout
        anchors.top: parent.verticalCenter
        anchors.topMargin: - loginLayout.height / 2
    }
    PowerControls
    {
        id: powerControls
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
    }
}
