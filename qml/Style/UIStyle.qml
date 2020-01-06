import QtQuick 2.7

pragma Singleton

QtObject {
    id: uiStyle

    // Font Sizes
    readonly property int fontSizeXXS: 10
    readonly property int fontSizeXS: 15
    readonly property int fontSizeS: 20
    readonly property int fontSizeM: 25
    readonly property int fontSizeL: 30
    readonly property int fontSizeXL: 35
    readonly property int fontSizeXXL: 40

    // Color Scheme
    // Green
    readonly property color colorQtGreen1: "#17a81a"
    readonly property color colorQtGreen2: "#21be2b"
    readonly property color colorQtGreen3: "#41cd52"

    // Gray
    readonly property color colorQtGray1: "#09102b"
    readonly property color colorQtGray2: "#222840"
    readonly property color colorQtGray3: "#3a4055"
    readonly property color colorQtGray4: "#53586b"
    readonly property color colorQtGray5: "#53586b"
    readonly property color colorQtGray6: "#848895"
    readonly property color colorQtGray7: "#9d9faa"
    readonly property color colorQtGray8: "#b5b7bf"
    readonly property color colorQtGray9: "#cecfd5"
    readonly property color colorQtGray10: "#f3f3f4"
}
