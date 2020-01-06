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
                text: "Artículos"
                width: column1.botonWidth
                height: 80
            }
        }
        Rectangle {
            id: rect2
            width: cwidth * pwidth / 1366
            height: pheight

//            FolderDialog {
//                id: fileDialog
//                title: "Cargar carpeta de Artículos"
//                currentFolder: docsLocation
//                folder: docsLocation
//                onAccepted: folderModel.folder = folder
//            }

            ListView {
                id: listView
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

    //Component.onCompleted: fileDialog.open()

    property var docNameFilters: ["*.pdf"];
    property string docsLocation: "file:///" + applicationDirPath + "/res/Articulos";
}
