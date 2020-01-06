import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.2

Item {
    signal launched(string page)

    property real pheight: screen.height - header.height - footer.height
    property real pwidth: screen.width

    property real bwidth: pwidth * 1 / 6
    property real cwidth: pwidth * 5 / 6

    Row {
        Column {
            id: column1
            width: bwidth
            height: pheight
            spacing: 10 * pwidth / 1366
            padding: 20 * pwidth / 1366

            property real botonWidth: bwidth - 40 * pwidth / 1366

            Boton {
                id: inv
                labelText: "Investigaciones"
                toolTipText: "Investigaciones Tesis"
                pwidth: column1.botonWidth
                onClicked: launched("qrc:/qml/Investigaciones/InvPage.qml")
            }
            Boton {
                id: man
                labelText: "Manuales"
                toolTipText: "Manuales - Materiales"
                pwidth: column1.botonWidth
                onClicked: launched("qrc:/qml/Manuales/ManPage.qml")
            }
            Boton {
                id: art
                labelText: "Artículos"
                pwidth: column1.botonWidth
                onClicked: launched("qrc:/qml/Articulos/ArtPage.qml")
            }
            Boton {
                id: inst
                labelText: "Instumentales"
                pwidth: column1.botonWidth
                onClicked: launched("qrc:/qml/Instrumentales/InstPage.qml")
            }
            Boton {
                id: inf
                labelText: "Informaciones"
                pwidth: column1.botonWidth
                onClicked: launched("qrc:/qml/Informaciones/InfPage.qml")
            }
            Boton {
                id: glo
                labelText: "Glosario"
                pwidth: column1.botonWidth
                onClicked: launched("qrc:/qml/Glosario/GloPage.qml")
            }
            Boton {
                id: vid
                labelText: "Videos"
                pwidth: column1.botonWidth
                onClicked: launched("qrc:/qml/Videos/VidPage.qml")
            }
            Boton {
                id: cont
                labelText: "Contactos"
                pwidth: column1.botonWidth
                onClicked: launched("qrc:/qml/Contactos/ContPage.qml")
            }
        }
        Grid {
            id: grid
            columns: 2
            width: cwidth * pwidth / 1366
            height: pheight
            spacing: 10 * pwidth / 1366
            padding: 20 * pwidth / 1366

            property real imageWidth: (cwidth - 50 * pwidth / 1366) / 2

            Image {
                id: image1
                source: "qrc:/images/imagenes/image1.jpg"
                //fillMode: Image.PreserveAspectFit
                fillMode: Image.Stretch
                width: grid.imageWidth
                height: parent.height - 40 * pwidth / 1366
            }
            Image {
                id: image2
                source: "qrc:/images/imagenes/image2.jpg"
                //fillMode: Image.PreserveAspectFit
                fillMode: Image.Stretch
                width: grid.imageWidth
                height: parent.height - 40 * pwidth / 1366
            }
        }
    }
}
