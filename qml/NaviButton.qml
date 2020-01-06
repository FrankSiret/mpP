import QtQuick 2.4
import QtQuick.Controls 2.3
import "Style"

AbstractButton {
    id: button

    property real pwidth: 56
    property real pheight: 60
    property real pradius: 10
    property alias toolTipText: toolTip.text
    property alias imageSource: image.source

    width: pwidth
    height: pheight

    contentItem: Image {
        id: image
        fillMode: Image.Pad
        anchors.horizontalCenter: button.horizontalCenter
        anchors.top: button.top

        sourceSize {
            width: 40
            height: 40
        }
    }

    ToolTip {
        id: toolTip
        delay: 500
        timeout: 3000
        visible: hovered && toolTipText.length > 0
    }

    background: Rectangle {
        anchors.fill: button
        radius: pradius
        anchors.horizontalCenter: button.horizontalCenter
        anchors.top: button.top

        color: {
            if(pressed) return UIStyle.colorQtGray1
            if(hovered) return UIStyle.colorQtGray3
            return UIStyle.colorQtGray2
        }

        Rectangle {
            width: parent.width
            height: pradius
            anchors.bottom: parent.bottom
            color: parent.color
        }
    }

    transform: Translate {
        Behavior on y { NumberAnimation { easing.type: Easing.InQuad; duration: 250 } }
        y: enabled ? 0 : button.height
    }
}
