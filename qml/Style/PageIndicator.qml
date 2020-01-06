import QtQuick 2.7
import QtQuick.Templates 2.0 as T
import "."

T.PageIndicator {
    id: control

    implicitWidth: contentItem.implicitWidth + leftPadding + rightPadding
    implicitHeight: contentItem.implicitHeight + topPadding + bottomPadding

    spacing: 6
    padding: 6
    bottomPadding: 7

    delegate: Rectangle {
        implicitWidth: 8
        implicitHeight: 8

        radius: width / 2
        color: UIStyle.colorQtGray3

        opacity: index === control.currentIndex ? 1.0 : 0.35

        Behavior on opacity {
            OpacityAnimator {
                duration: 100
            }
        }
    }

    contentItem: Row {
        spacing: control.spacing

        Repeater {
            model: control.count
            delegate: control.delegate
        }
    }
}
