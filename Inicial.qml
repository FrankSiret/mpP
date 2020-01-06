import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.2
import "qml"
import "qml/Investigaciones"
import "qml/Manuales"

ApplicationWindow {
    id: root
    title: qsTr("Cuidadores y Vejez")
    property bool animationFoo: false
    signal closingEvent()
    signal started()

    font.family: openSans.name
    font.pixelSize: 16
    FontLoader { id: openSans; source: "qrc:/font/OpenSans-Regular.ttf" }
    FontLoader { id: openSansLight; source: "qrc:/font/OpenSans-Light.ttf" }
    FontLoader { id: tangerine; source: "qrc:/font/Tangerine_Regular.ttf" }

    header: Bar { pwidth: screen.width; pheight: screen.height }
    footer: Foo { animationRunning: animationFoo; pwidth: screen.width; pheight: screen.height }

    property real pheight: screen.height - header.height - footer.height
    property real pwidth: screen.width

    property real bwidth: pwidth * 1 / 6
    property real cwidth: pwidth * 5 / 6

    property bool flag: false

    StackView {
        id: stackView

        focus: true
        anchors.fill: parent

        initialItem: HomePage {
            onLaunched: stackView.push(page)
        }
    }

    Rectangle {
        id: credits
        width: pwidth
        height: pheight
        visible: false
        anchors.centerIn: parent

        Column {
            padding: 20 * pwidth / 1366
            anchors.horizontalCenter: credits.horizontalCenter

            Label {
                id: label1
                height: credits.height / 2
                color: "#001"
                font.family: openSansLight.name
                font.pixelSize: 25 * pwidth / 1366
                text: "<h2>Proyecto:</h2><br>"+
                      "<i><b><u>\"Caracterización e intervención en un grupo de cuidadores formales<br>"+
                      "e informales de adultos mayores.\"</u></b></i>"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Label {
                id: label2
                color: "#001"
                width: label1.width

                font.family: openSans.name
                font.bold: true
                font.pixelSize: 25 * pwidth / 1366
                text: "Presentado por:"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
            }

            Label {
                id: label3
                color: "#001"
                width: label2.width
                leftPadding: 20 * pwidth / 1366

                font.family: openSans.name
                font.pixelSize: 25 * pwidth / 1366
                text: "Frank Rodríguez Siret"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
            }
        }
    }

    NumberAnimation {
        id: endAnimation
        duration: 10000
        onStopped: {
            closingEvent()
        }
    }

    onStarted: exitButton.enabled = true

    property real botonWidth: (bwidth - 50 * pwidth / 1366) / 3.0

    Row {
        anchors.bottom: footer.top
        leftPadding: 20 * pwidth / 1366
        spacing: 5 * pwidth / 1366

        NaviButton {
            id: homeButton
            enabled: stackView.depth > 1
            pwidth: botonWidth
            imageSource: "qrc:/images/home.png"
            toolTipText: "Página Principal"
            onClicked: stackView.pop(null)
        }
        NaviButton {
            id: backButton
            enabled: stackView.depth > 1
            pwidth: botonWidth
            imageSource: "qrc:/images/back.png"
            toolTipText: "Página Anterior"
            onClicked: stackView.pop()
        }
        NaviButton {
            id: exitButton
            enabled: false
            pwidth: botonWidth
            imageSource: "qrc:/images/close.png"
            toolTipText: "Salir de la Aplicación"
            onClicked: close()
        }
    }

    Shortcut {
        sequence: "Esc"
        context: Qt.WindowShortcut
        onActivated: exitButton.clicked()
    }

    onClosing: {
        stackView.clear()
        homeButton.enabled = false
        backButton.enabled = false
        endAnimation.running = true
        credits.visible = true
        close.accepted = flag
        if(flag) closingEvent()
        flag = true
    }
}
