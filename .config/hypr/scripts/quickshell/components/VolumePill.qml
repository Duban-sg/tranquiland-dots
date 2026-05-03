import QtQuick
import Quickshell

Rectangle {
    property bool isHovered: volMouse.containsMouse
    property real targetWidth: volLayoutRow.width + barWindow.s(24)
    property bool initAnimTrigger: false

    color: isHovered ? Qt.rgba(mocha.base.r, mocha.base.g, mocha.base.b, 0.6) : Qt.rgba(mocha.base.r, mocha.base.g, mocha.base.b, 0.75); 
    radius: barWindow.s(4); topLeftRadius:0; bottomLeftRadius: 0; topRightRadius: 0;
    clip: true
    width: targetWidth
    scale: isHovered ? 1.05 : 1.0
    opacity: initAnimTrigger ? 1 : 0
    transform: Translate { y: audioPill.initAnimTrigger ? 0 : barWindow.s(15); Behavior on y { NumberAnimation { duration: 500; easing.type: Easing.OutBack } } }
    
    
    Behavior on width { NumberAnimation { duration: 500; easing.type: Easing.OutQuint } }
    Behavior on scale { NumberAnimation { duration: 250; easing.type: Easing.OutExpo } }
    Behavior on color { ColorAnimation { duration: 200 } }
    Behavior on opacity { NumberAnimation { duration: 400; easing.type: Easing.OutCubic } }
    
    Timer { running: rightLayout.showLayout && !audioPill.initAnimTrigger; interval: 150; onTriggered: audioPill.initAnimTrigger = true }

    Row { 
        id: volLayoutRow; anchors.centerIn: parent; spacing: barWindow.s(8)
        Text { 
            anchors.verticalCenter: parent.verticalCenter
            text: barWindow.volIcon; font.family: "Iosevka Nerd Font"; font.pixelSize: barWindow.s(12); 
            color:  mocha.subtext0 
        }
        Text { 
            anchors.verticalCenter: parent.verticalCenter
            text: barWindow.volPercent; 
            font.family: "JetBrains Mono"; font.pixelSize: barWindow.s(8); font.weight: Font.Black; 
            color:  mocha.text; 
        }
    }
    MouseArea { id: volMouse; hoverEnabled: true; anchors.fill: parent; onClicked: Quickshell.execDetached(["bash", "-c", "~/.config/hypr/scripts/qs_manager.sh toggle volume"]) }
} 