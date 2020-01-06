import QtQuick 2.4
import QtQuick.Controls 2.3
import "Style"

Rectangle {
    id: rect1
    property int pheight: 600
    property int pwidth: 400
    property alias animationRunning: animation.running

    color: UIStyle.colorQtGreen3 //"#8080ff"
    width: pwidth
    height: {
        return text1.height;
    }

    FontLoader { id: tangerine; source: "qrc:/font/Tangerine_Regular.ttf" }

    Label {
        id: text1
        color: "#001"
        font.family: tangerine.name
        font.bold: true
        font.pixelSize: 35
        text: "Cuidar es \"un acto de vida que tiene por objetivo, en primer lugar y por "+
              "encima de todo, permitir que la vida continúe y se desarrolle\""
        visible: true
        padding: 7
        x: rect1.pwidth

        NumberAnimation {
            id: animation
            target: text1
            property: "x"
            from: pwidth
            to: {
                return -text1.width
            }
            duration: 20000
            loops: Animation.Infinite
        }
    }
}
