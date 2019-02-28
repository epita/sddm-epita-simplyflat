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
}
