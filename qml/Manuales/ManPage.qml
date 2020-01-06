import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.0
import Qt.labs.folderlistmodel 1.0
import Qt.labs.platform 1.0
import QtQuick.Layouts 1.3
import "../"

Item {
    signal launched(string page)

    property real pheight: screen.height - header.height - footer.height
    property real pwidth: screen.width

    property real bwidth: pwidth * 1 / 6
    property real cwidth: pwidth * 5 / 6

    property var docNameFilters: ["*.pdf"];
    property string docsLocation: "file:///" + applicationDirPath + "/res/Manuales";

    Row {
        Column {
            id: column1
            width: bwidth
            height: pheight
            spacing: 10 * pwidth / 1366
            padding: 20 * pwidth / 1366

            property real botonWidth: bwidth - 40 * pwidth / 1366

            Label2 {
                id: label
                text: "Manuales y\nMateriales"
                width: column1.botonWidth
                height: 80
            }
            Boton {
                id: inv
                labelText: "Manuales"
                pwidth: column1.botonWidth
                onClicked: {
                    docsLocation = "file:///" + applicationDirPath + "/res/Manuales/Manuales";
                    folderModel.folder = docsLocation
                    grid.visible = false
                    listView.visible = true
                }
            }
            Boton {
                id: man
                labelText: "Guias"
                pwidth: column1.botonWidth
                onClicked: {
                    docsLocation = "file:///" + applicationDirPath + "/res/Manuales/Guias";
                    folderModel.folder = docsLocation
                    grid.visible = false
                    listView.visible = true
                }
            }
        }
        Rectangle {
            id: rect2
            width: cwidth * pwidth / 1366
            height: pheight

            Grid {
                id: grid
                columns: 2
                width: cwidth * pwidth / 1366
                height: pheight
                spacing: 10 * pwidth / 1366
                padding: 20 * pwidth / 1366
                visible: true

                property real imageWidth: (cwidth - 50 * pwidth / 1366) / 2

                Image {
                    id: image1
                    source: "qrc:/images/imagenes/image5.jpg"
                    fillMode: Image.Stretch
                    width: grid.imageWidth
                    height: parent.height - 40 * pwidth / 1366
                }
                Image {
                    id: image2
                    source: "qrc:/images/imagenes/image30.jpg"
                    fillMode: Image.Stretch
                    width: grid.imageWidth
                    height: parent.height - 40 * pwidth / 1366
                }
            }

            ListView {
                id: listView
                visible: false
                anchors.margins: 20
                model: FolderListModel {
                    id: folderModel
                    objectName: "folderModel"
                    showDirs: false
                    folder: docsLocation
                    nameFilters: docNameFilters
                }
                delegate: DocModel {
                    docName: fileName
                    docDir: folderModel.folder + "/" + fileName
                }
                anchors.fill: parent
                spacing: 5
                focus: true
                Keys.onUpPressed: scrollBar.decrease()
                Keys.onDownPressed: scrollBar.increase()
                ScrollBar.vertical: ScrollBar { id: scrollBar }
            }
        }
    }
}
