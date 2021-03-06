import QtQuick 2.4
import QtQuick.Controls 2.3

Rectangle {
    property real pwidth: 178
    property real pheight: 40
    property real pradius: 10
    property real ppixelSize: 20
    property alias text: text1.text

    width: pwidth
    height: pheight

    Text {
        id: text1
        anchors.centerIn: parent
        font.pixelSize: { return Math.min(ppixelSize * pheight / 40, ppixelSize * pwidth / 178) }
        color: "#001"
        horizontalAlignment: Text.AlignHCenter
    }
}
