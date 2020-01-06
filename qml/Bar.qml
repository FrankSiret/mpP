import QtQuick 2.4
import QtQuick.Controls 2.3
import "Style"

Rectangle {
    property int pheight: 600
    property int pwidth: 400

    color: UIStyle.colorQtGreen3 //"#8080ff"
    width: pwidth
    height: {
        return label3.y + label3.height + 10
    }

    Image {
        id: label1
        source: "qrc:/images/titulo.png"
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        scale: 0.9

        ParallelAnimation {
            running: true
            loops: Animation.Infinite

            SequentialAnimation {
                NumberAnimation {
                    target: label1
                    property: "opacity"
                    duration: 1000
                    from: 0.6
                    to: 1.0
                }
                NumberAnimation {
                    target: label1
                    property: "opacity"
                    duration: 1000
                    from: 1.0
                    to: 0.6
                }
            }

            SequentialAnimation {
                NumberAnimation {
                    target: label1
                    property: "scale"
                    duration: 1000
                    from: 0.9
                    to: 1.0
                }
                NumberAnimation {
                    target: label1
                    property: "scale"
                    duration: 1000
                    from: 1.0
                    to: 0.9
                }
            }   
        }
    }

    Label {
        id: label2
        font.pixelSize: 20
        text: "Proyecto: Caracterización e intervención en un grupo "+
              "de cuidadores formales e informales de adultos mayores."
        anchors.topMargin: -12
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: label1.bottom
        color: "#001"
    }

    Label {
        id: label3
        font.pixelSize: 20
        text: "Cuidadores de personas de la tercera edad"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: label2.bottom
        anchors.topMargin: 5
        color: "#001"
    }
}
