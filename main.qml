import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.2
import LauncherUri 1.0
import "qml"

ApplicationWindow {
    id: root
    visibility: "FullScreen"
    title: qsTr("Cuidadores y Vejez")

    font.family: openSans.name
    font.pixelSize: 16

    FontLoader { id: openSans; source: "qrc:/font/OpenSans-Regular.ttf" }
    FontLoader { id: openSansLight; source: "qrc:/font/OpenSans-Light.ttf" }
    FontLoader { id: tangerine; source: "qrc:/font/Tangerine_Regular.ttf" }

    header: Bar { pwidth: screen.width; pheight: screen.height }
    footer: Foo { animationRunning: false; pwidth: screen.width; pheight: screen.height }

    property real pheight: screen.height - header.height - footer.height
    property real pwidth: screen.width;

    property real bwidth: screen.width * 1 / 6
    property real cwidth: screen.width * 5 / 6

    Row {
        Rectangle {
            id: rect1
            width: bwidth
            height: pheight

            Column {
                anchors.bottom: rect1.bottom
                anchors.horizontalCenter: rect1.horizontalCenter
                spacing: 10 * pwidth / 1366
                padding: 20 * pwidth / 1366

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
            width: cwidth
            height: pheight

            Column {
                spacing: 10 * pwidth / 1366
                padding: 20 * pwidth / 1366
                anchors.horizontalCenter: rect2.horizontalCenter

                Label {
                    id: label1
                    height: rect2.height / 2
                    color: "#001"
                    font.family: openSansLight.name
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

                    font.family: tangerine.name
                    font.bold: true
                    font.pixelSize: 45 * pwidth / 1366
                    text: "Cuidar es \"un acto de vida que tiene por objetivo, en primer lugar<br>"+
                          "y por encima de todo, permitir que la vida continúe y se desarrolle\""
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                Label {
                    id: label3
                    color: "#001"
                    width: label2.width

                    font.family: tangerine.name
                    font.pixelSize: 38 * pwidth / 1366
                    text: "(Colliére, 1993 citado en Esteban, 2001)"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignRight
                }
            }
        }
    }

    NaviButton {
        id: boton
        enabled: false
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 100 * screen.width / 1366
        imageSource: "qrc:/images/next.png"
        toolTipText: "Continuar"
        focus: true
        Keys.onPressed: {
            if(event.key === Qt.Key_Space || event.key === Qt.Key_Enter || event.key === Qt.Key_Return)
                clicked()
        }
        onClicked: {
            timer.stop()
            boton.enabled = false
            //root.releaseResources()
            //root.requestUpdate()
            //close()
            inicialPage.showFullScreen()
            inicialPage.requestUpdate()
            inicialPage.animationFoo = true;
            inicialPage.started()
        }
    }

    Shortcut {
        sequence: "Esc"
        context: Qt.WindowShortcut
        onActivated: Qt.quit()
    }

    Timer {
        id: timer
        interval: 20000
        running: true
        onTriggered: boton.clicked()
    }

    Inicial {
        id: inicialPage
        modality: Qt.ApplicationModal
        onClosingEvent: Qt.quit()
    }

    Launcher { id: myLauncher }

    Component.onCompleted: boton.enabled = true
}
