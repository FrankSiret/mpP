import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.2

Item {
    property int pheight: root.height - header.height - footer.height
    property int pwidth: root.width
    signal launched(string page)

    Row {
        Rectangle {
            id: rect1
            width: pwidth * 1 / 6
            height: pheight

            Column {
                anchors.bottom: rect1.bottom
                anchors.horizontalCenter: rect1.horizontalCenter
                padding: pheight * 1 / 30
                spacing: pheight * 1 / 30

                AnimatedImage {
                    id: mundo
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/images/mundo.gif"
                    playing: true
                    width: rect1.width * 5 / 7
                    height: rect1.width * 5 / 7
                }
                Image {
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/images/y.png"
                    width: rect1.width * 5 / 7
                    height: rect1.width * 5 / 7
                }
            }
        }

        Rectangle {
            id: rect2
            width: pwidth * 5 / 6
            height: pheight

            Column {
                anchors.horizontalCenter: rect2.horizontalCenter
                spacing: pheight * 1 / 30
                padding: pheight * 1 / 30

                Label {
                    id: label1
                    height: rect2.height / 2
                    color: "#001"
                    font.family: "Open Sans Light"
                    font.pixelSize: 25 * pwidth / 1366
                    text: "La presente multimedia aborda el tema del cuidado.<br>"+
                          "Si usted es un cuidador (formal o informal) podrá encontrar<br>"+
                          "disímiles respuestas a sus dudas e inquietudes con solo dar un click.<br>"+
                          "Somos parte del Proyecto de alcance Nacional:<br>"+
                          "<i><b><u>\"Caracterización e intervención en un grupo de cuidadores formales<br>"+
                          "e informales de adultos mayores.\"</u></b></i>"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                Label {
                    id: label2
                    color: "#001"

                    font.family: "Tangerine"
                    font.pixelSize: 45 * pwidth / 1366
                    text: "<b>Cuidar es \"un acto de vida que tiene por objetivo, en primer lugar<br>"+
                          "y por encima de todo, permitir que la vida continúe y se desarrolle\"</b>"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                Label {
                    id: label3
                    color: "#001"
                    width: label2.width

                    font.family: "Tangerine"
                    font.pixelSize: 38 * pwidth / 1366
                    text: "(Colliére, 1993 citado en Esteban, 2001)"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignRight
                }
            }
        }
    }

    Boton {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: 20
        anchors.rightMargin: 100
        psource: "qrc:/images/left-arrow-1.svg"
        ptext: "Continuar"
        pmirror: true
        onClick: {
            timer.stop()
            launched("qrc:/qml/HomePage.qml")
        }
    }

    Timer {
        id: timer
        interval: 5000
        repeat: false
        running: true
        onTriggered: launched("qrc:/qml/HomePage.qml")
    }
}
