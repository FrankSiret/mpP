import QtQuick 2.4
import QtQuick.Controls 2.3
import "Style"

AbstractButton {
    id: button

    property real pwidth: 180
    property real pheight: 40
    property real pradius: 10
    property real ppixelSize: 20
    property string toolTipText: ""
    property alias labelText: label.text

    width: pwidth
    height: pheight

    Label {
        id: label
        color: "#001"
        anchors.centerIn: parent
        font.pixelSize: { return Math.min(ppixelSize * pheight / 40, ppixelSize * pwidth / 178) }
    }

    ToolTip {
        id: toolTip
        text: toolTipText.length > 0 ? toolTipText : label.text
        delay: 500
        timeout: 3000
        visible: hovered
    }

    background: Rectangle {
        anchors.fill: button
        radius: pradius

        anchors.horizontalCenter: button.horizontalCenter
        anchors.top: button.top

        color: {
            if(pressed) return UIStyle.colorQtGreen1
            if(hovered) return UIStyle.colorQtGreen3
            return UIStyle.colorQtGreen2
        }
    }
}
