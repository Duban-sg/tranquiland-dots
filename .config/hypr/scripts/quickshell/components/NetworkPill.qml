import QtQuick
import Quickshell
import Quickshell.Networking

Rectangle {
    property bool isHovered: wifiMouse.containsMouse
    property real targetWidth: wifiLayoutRow.width + barWindow.s(24)
    property bool initAnimTrigger: false
    readonly property var activeConn: Networking.primaryConnection
    readonly property var device: Networking.devices.values.find(device => device.connected)

     
     radius: barWindow.s(4); topLeftRadius: 0; topRightRadius: 0; bottomRightRadius: 0; 
     color: isHovered ? Qt.rgba(mocha.base.r, mocha.base.g, mocha.base.b, 0.4) : Qt.rgba(mocha.base.r, mocha.base.g, mocha.base.b, 0.75); 
     width: targetWidth
     clip: true
     scale: isHovered ? 1.05 : 1.0
     opacity: initAnimTrigger ? 1 : 0
     transform: Translate { y: initAnimTrigger ? 0 : barWindow.s(15); Behavior on y { NumberAnimation { duration: 500; easing.type: Easing.OutBack } } }
    
     function getIconWifi(strength){
        if (strength >= 80) return "󰤨"; // Señal excelente
        if (strength >= 60) return "󰤥"; // Usa iconos específicos si tu fuente los tiene (ej:   ,   )
        if (strength >= 40) return "󰤢"; // Señal media
        if (strength >= 20) return "󰤟"; // Señal baja
        return "󰤯";
     }

     function getIconNetwork(){
        if (!device) return "󰌙";
        
        if (device.type === DeviceType.Ethernet) {
            return "󰌗";
        } 
        
        if (device.type === DeviceType.Wifi) {
            // Acceso directo a la propiedad de señal del objeto Wifi
            // Usamos el operador ? para evitar errores si desaparece
            const wifi = device.networks.values.find(device => device.connected);
            const signalStrength = (wifi?.signalStrength * 100) ;
            
            return getIconWifi(signalStrength);
        }
        
        return "󰌙";
     }
     
     Behavior on width { NumberAnimation { duration: 500; easing.type: Easing.OutQuint } }
     Behavior on scale { NumberAnimation { duration: 250; easing.type: Easing.OutExpo } }
     Behavior on color { ColorAnimation { duration: 200 } }
     Behavior on opacity { NumberAnimation { duration: 400; easing.type: Easing.OutCubic } }
     
     Timer { running: rightLayout.showLayout && !initAnimTrigger; interval: 50; onTriggered: initAnimTrigger = true }
     Row { 
         id: wifiLayoutRow; anchors.centerIn: parent; spacing: barWindow.s(2)
         Text { anchors.verticalCenter: parent.verticalCenter; text: getIconNetwork(); font.family: "Iosevka Nerd Font"; font.pixelSize: barWindow.s(12); color: mocha.subtext0 }
     }
     MouseArea { id: wifiMouse; hoverEnabled: true; anchors.fill: parent; onClicked: Quickshell.execDetached(["bash", "-c", "~/.config/hypr/scripts/qs_manager.sh toggle network wifi"]) }

}

