# Changelog

Todos los cambios notables de este proyecto se documentan aquí.  
El formato está basado en [Keep a Changelog](https://keepachangelog.com/es/1.0.0/).

---

## [Unreleased]

### Modificado

- **Instalador modularizado** — El script de instalación fue reestructurado en módulos independientes para facilitar el mantenimiento, la lectura y futuras actualizaciones sin afectar el flujo completo.

- **TopBar rediseñada** (`hypr/scripts/quickshell/TopBar.qml`) — Se rediseñó el componente de la barra superior con los siguientes cambios respecto al original de [@ilyamirox](https://github.com/ilyamiro):
  - Nuevo diseño visual más cercano al gusto personal: píldoras de workspace con esquinas asimétricas, módulos de tiempo y fecha separados, efecto typewriter en la fecha al inicio.
  - Sistema de escalado responsivo mediante componente `Scaler` externo.
  - Mejoras de rendimiento: actualizaciones dirigidas (solo se reasignan propiedades que cambian), compuerta de datos (`isDataReady`) para evitar saltos de layout en el arranque, y failsafe timer de 600ms.
  - Batería comentada/deshabilitada intencionalmente (proyecto orientado a PC de escritorio).
  - Animaciones de entrada escalonadas (staggered) para workspaces y paneles laterales.

- **Widgets de red y Bluetooth rediseñados** (`hypr/scripts/quickshell/components/NetworkPill.qml`, `BluetoothPill.qml`) — Se refactorizó el funcionamiento interno de ambos componentes con foco en rendimiento:
  - Lecturas de estado más eficientes, evitando evaluaciones innecesarias en cada ciclo.
  - Animaciones de entrada controladas por `initAnimTrigger` con timer escalonado para no bloquear el arranque.
  - Comportamientos (`Behavior`) unificados para transiciones de ancho, escala, color y opacidad.

---

> Los widgets de Quickshell son obra original de [@ilyamirox](https://github.com/ilyamiro). Los cambios aquí documentados son adaptaciones sobre esa base.
