import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import LauncherUri 1.0
import "./Style"

Item {
    id: root
    width: parent.width
    height: rect.height

    property alias docName: label.text
    property url docDir: ""

    FontLoader { id: openSans; source: "qrc:/font/OpenSans-Semibold.ttf" }

    Rectangle {
        id: rect
        width: root.width - 40
        height: label.height + 10
        color: UIStyle.colorQtGreen2

        Label {
            id: label
            width: rect.width - 20
            anchors.verticalCenter: parent.verticalCenter
            wrapMode: Label.Wrap
            font.pointSize: 16
            font.family: openSans.name
            color: "#001"
            text: "adsdas"
            anchors.centerIn: parent
        }
    }

    Image {
        id: image
        source: "qrc:/images/diceplayer.png"
        anchors.left: rect.right
        anchors.leftMargin: -20
        anchors.verticalCenter: rect.verticalCenter
        sourceSize.width: 45
        sourceSize.height: 45
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            rect.color = UIStyle.colorQtGreen3
            image.scale = 1.2
        }
        onExited: {
            rect.color = UIStyle.colorQtGreen2
            image.scale = 1.0
        }
        onClicked: {
            //mouse.released()
            //console.log(docDir)
            Qt.openUrlExternally(docDir);
        }
    }
}
