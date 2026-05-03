import QtQuick
import Quickshell
import Quickshell.Bluetooth


Rectangle {
    property bool isHovered: btMouse.containsMouse
    property real targetWidth: btLayoutRow.width + barWindow.s(24)
    property bool initAnimTrigger: false

    clip: true
    color: isHovered ? Qt.rgba(mocha.base.r, mocha.base.g, mocha.base.b, 0.6) : Qt.rgba(mocha.base.r, mocha.base.g, mocha.base.b, 0.75); 
    width: targetWidth
    scale: isHovered ? 1.05 : 1.0
    opacity: initAnimTrigger ? 1 : 0
    transform: Translate { y: btPill.initAnimTrigger ? 0 : barWindow.s(15); Behavior on y { NumberAnimation { duration: 500; easing.type: Easing.OutBack } } }

    function getIconBluetooth(){
        const adapterIsOk = Bluetooth.defaultAdapter.state === BluetoothAdapterState.Enabled
        let isDevicedConected = []; 
        
        if(!adapterIsOk) return "󰂲"; 
        
        isDevicedConected = Bluetooth.devices.values.find(device => device.connected);
        if (isDevicedConected) return "󰂱"; // Señal excelente
        if (!isDevicedConected) return "󰂯"; // Usa iconos específicos si tu fuente los tiene (ej:   ,   )
        return "󰂲";
    }

    Behavior on width { NumberAnimation { duration: 500; easing.type: Easing.OutQuint } }
    Behavior on scale { NumberAnimation { duration: 250; easing.type: Easing.OutExpo } }
    Behavior on color { ColorAnimation { duration: 200 } }
    Behavior on opacity { NumberAnimation { duration: 400; easing.type: Easing.OutCubic } }
    Timer { running: rightLayout.showLayout && !btPill.initAnimTrigger; interval: 100; onTriggered: btPill.initAnimTrigger = true }

    Row { 
        id: btLayoutRow; anchors.centerIn: parent; spacing: barWindow.s(8)
        Text { anchors.verticalCenter: parent.verticalCenter; text: getIconBluetooth(); font.family: "Iosevka Nerd Font"; font.pixelSize: barWindow.s(12); color: mocha.subtext0 }
    }
    MouseArea { id: btMouse; hoverEnabled: true; anchors.fill: parent; onClicked: Quickshell.execDetached(["bash", "-c", "~/.config/hypr/scripts/qs_manager.sh toggle network bt"]) }
}



