import QtQuick 2.11
import SddmComponents 2.0
import QtGraphicalEffects 1.0


Rectangle
{
    id: avatarRoot
    property alias source: avatar.source
    color: "transparent"
    Image
    {
        id: avatar
        height: avatarRoot.height
        source: config.guest_url
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: mask
        }
        onStatusChanged: {
            console.log("Avatar status changed to " + status);
            if (status == Image.Error)
            {
                console.log("source: " + source + ": failed to load");
                source = config.guest_url
            }
         }
    }
    Rectangle
    {
        id: mask
        width: avatarRoot.width
        height: avatarRoot.height
        radius: 5
        visible: false
    }
}
