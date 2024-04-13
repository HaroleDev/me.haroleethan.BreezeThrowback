/*
 *   Copyright 2024 Harole Ethan <https://haroleethan.studio.site>
 */

import QtQuick 2.0


Image {
    id: root
    source: "images/background.png"

    property int stage

    onStageChanged: {
        if (stage <= 1) {
            introAnimation.running = true
        }
    }

    Rectangle {
        id: ground
        width: root.width
        height: topRect.height + 1 + bottomRect.height
        color: "#00F2F2F2"
        Rectangle {
            id: topRect
            width: parent.width
            height: (root.height / 3) - bottomRect.height - 1
            y: root.height
            color: "#80F2F2F2"
        }
        Rectangle {
            id: bottomRect
            width: parent.width
            y: -height
            height: (root.height / 6)
            color: "#A6F2F2F2"
        }
    }

    Rectangle {
        id: foreground
        anchors.verticalCenter: parent.verticalCenter
        color: "#00F2F2F2"
        width: icon1.width + icon2.width + icon3.width + icon4.width + (80 * 4) + icon5.width + 20
        height: root.height / 3
        x: (root.width / 2) - ((icon1.width + icon2.width + icon3.width + icon4.width + (80 * 4) + icon5.width + 20) / 4) - ((icon1.width + icon2.width + icon3.width + icon4.width + (80 * 4) + icon5.width + 20) / (4 * 4))
        opacity: 0
        SequentialAnimation {
            running: true
            PauseAnimation { duration: 1000 } // Delay for 1000 milliseconds
            PropertyAnimation {
                target: foreground
                property: "opacity"
                to: 1
                duration: 150 * 2
            }
        }
        Image {
            id: icon1
            source: "images/icon1.svg"
            sourceSize.width: 64
            sourceSize.height: 64
            x: root.width
            y: 0
            anchors.verticalCenter: parent.verticalCenter
            Image {
                id: icon1_shadow
                source: "images/icon1_shadow.svg"
                sourceSize.width: 235
                sourceSize.height: 186
                x: 0
                y: 0
                opacity: 0
                visible: icon1.visible
                Behavior on visible {
                    NumberAnimation {
                        target: icon1_shadow
                        property: "opacity"
                        to: 1
                        duration: 150 * 10
                    }
                }
            }
            visible: stage >= 2
            Behavior on visible {
                NumberAnimation {
                    target: icon1
                    property: "x"
                    to: 0
                    duration: 150 * 10
                    easing.type: Easing.InOutQuart
                }
            }
        }
        Image {
            id: icon2
            source: "images/icon2.svg"
            sourceSize.width: icon1.width
            sourceSize.height: icon1.height
            x: root.width
            y: icon1.y
            Image {
                id: icon2_shadow
                source: "images/icon2_shadow.svg"
                sourceSize.width: 240
                sourceSize.height: icon1_shadow.height
                x: 0
                y: 0
                opacity: 0
                visible: icon2.visible
                Behavior on visible {
                    NumberAnimation {
                        target: icon2_shadow
                        property: "opacity"
                        to: 1
                        duration: 150 * 10
                    }
                }
            }
            visible: stage >= 3
            Behavior on visible {
                NumberAnimation {
                    target: icon2
                    property: "x"
                    to: icon1.x + 64 + 16
                    duration: 150 * 10
                    easing.type: Easing.InOutQuart
                }
            }
        }
        Image {
            id: icon3
            source: "images/icon3.svg"
            sourceSize.width: icon2.width
            sourceSize.height: icon2.height
            x: root.width
            y: icon2.y
            Image {
                id: icon3_shadow
                source: "images/icon3_shadow.svg"
                sourceSize.width: 224
                sourceSize.height: icon2_shadow.height
                x: 0
                y: 0
                opacity: 0
                visible: icon3.visible
                Behavior on visible {
                    NumberAnimation {
                        target: icon3_shadow
                        property: "opacity"
                        to: 1
                        duration: 150 * 10
                    }
                }
            }
            visible: stage >= 4
            Behavior on visible {
                NumberAnimation {
                    target: icon3
                    property: "x"
                    to: icon2.x + 64 + 16
                    duration: 150 * 10
                    easing.type: Easing.InOutQuart
                }
            }
        }
        Image {
            id: icon4
            source: "images/icon4.svg"
            sourceSize.width: icon3.width
            sourceSize.height: icon3.height
            x: root.width
            y: icon3.y
            Image {
                id: icon4_shadow
                source: "images/icon4_shadow.svg"
                sourceSize.width: 241
                sourceSize.height: icon3_shadow.height
                x: 0
                y: 0
                opacity: 0
                visible: icon4.visible
                Behavior on visible {
                    NumberAnimation {
                        target: icon4_shadow
                        property: "opacity"
                        to: 1
                        duration: 150 * 10
                    }
                }
            }
            visible: stage >= 5
            Behavior on visible {
                NumberAnimation {
                    target: icon4
                    property: "x"
                    to: icon3.x + 64 + 16
                    duration: 150 * 10
                    easing.type: Easing.InOutQuart
                }
            }
        }
        Image {
            id: icon5
            source: "images/icon5.svg"
            sourceSize.width: 128
            sourceSize.height: 128
            x: root.width
            y: icon4.y - (128 / 3) + 4
            Image {
                id: icon5_shadow
                source: "images/icon5_shadow.svg"
                sourceSize.width: 327
                sourceSize.height: 230
                x: 0
                y: 0
                opacity: 0
                visible: icon5.visible
                Behavior on visible {
                    NumberAnimation {
                        target: icon5_shadow
                        property: "opacity"
                        to: 1
                        duration: 150 * 10
                    }
                }
            }
            visible: stage >= 6
            Behavior on visible {
                NumberAnimation {
                    target: icon5
                    property: "x"
                    to: icon4.x + 64 + 20
                    duration: 150 * 10
                    easing.type: Easing.InOutQuart
                }
            }
        }
    }

    SequentialAnimation {
        id: introAnimation
        running: false

        ParallelAnimation {
            PropertyAnimation {
                property: "y"
                target: topRect
                to: root.height / 3
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1
            }

            PropertyAnimation {
                property: "y"
                target: bottomRect
                to: 2 * (root.height / 3) - bottomRect.height
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1
            }
        }
    }
}
