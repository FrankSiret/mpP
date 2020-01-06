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
    property string docsLocation: "file:///" + applicationDirPath + "/res/Instrumentales";

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
                text: "Investigaciones\nTesis"
                width: column1.botonWidth
                height: 80
            }
            Boton {
                id: inv
                labelText: "Doctorales"
                toolTipText: "Tesis Doctorales"
                pwidth: column1.botonWidth
                onClicked: {
                    docsLocation = "file:///" + applicationDirPath + "/res/Investigaciones/Doctorales";
                    folderModel.folder = docsLocation
                    grid.visible = false
                    listView.visible = true
                    //fileDialog.open()
                }
            }
            Boton {
                id: man
                labelText: "Maestrías"
                toolTipText: "Tesis de Maestría"
                pwidth: column1.botonWidth
                onClicked: {
                    docsLocation = "file:///" + applicationDirPath + "/res/Investigaciones/Maestrias";
                    folderModel.folder = docsLocation
                    grid.visible = false
                    listView.visible = true
                    //fileDialog.open()
                }
            }
            Boton {
                id: art
                labelText: "Pregrados"
                toolTipText: "Tesis de Pregrado"
                pwidth: column1.botonWidth
                onClicked: {
                    docsLocation = "file:///" + applicationDirPath + "/res/Investigaciones/Pregrados";
                    folderModel.folder = docsLocation
                    grid.visible = false
                    listView.visible = true
                    //fileDialog.open()
                }
            }
            Boton {
                id: inst
                labelText: "Trabajos de Cursos"
                pwidth: column1.botonWidth
                onClicked: {
                    docsLocation = "file:///" + applicationDirPath + "/res/Investigaciones/Trabajos de Curso";
                    folderModel.folder = docsLocation
                    grid.visible = false
                    listView.visible = true
                    //fileDialog.open()
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
                    source: "qrc:/images/imagenes/image11.jpg"
                    fillMode: Image.Stretch
                    width: grid.imageWidth
                    height: parent.height - 40 * pwidth / 1366
                }
                Image {
                    id: image2
                    source: "qrc:/images/imagenes/image33.jpg"
                    fillMode: Image.Stretch
                    width: grid.imageWidth
                    height: parent.height - 40 * pwidth / 1366
                }
            }

//            FolderDialog {
//                id: fileDialog
//                title: "Cargar carpeta de Tesis Doctorales"
//                currentFolder: docsLocation
//                folder: docsLocation
//                onAccepted: folderModel.folder = folder
//            }

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
