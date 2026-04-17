<div align="center">

# 🌿 Tranquiland-dots

**Un entorno de escritorio personalizado para Arch Linux, basado en Hyprland.**

Fork de [imperative-dots](https://github.com/ilyamiro/imperative-dots) — adaptado con configuraciones, temas y scripts propios para un setup reproducible y minimalista.

</div>

---

> **Nota:** Este proyecto es un fork con fines personales y de aprendizaje. No tiene ningún ánimo de reemplazar, competir ni dañar el proyecto original [imperative-dots](https://github.com/ilyamiro/imperative-dots) de [@ilyamirox](https://github.com/ilyamiro). Todo el crédito por la base y la arquitectura original es suyo. Si te gusta este proyecto, considera también darle una estrella al repositorio original.

---

## ¿Qué es esto?

Tranquiland-dots es una personalización de dotfiles para Arch Linux construida sobre la base de imperative-dots. El instalador automatiza la configuración completa del entorno, incluyendo:

- **Hyprland** como compositor Wayland
- **Quickshell** para la barra superior, popups y widgets (batería, red, música, calendario, volumen, etc.)
- **SDDM** con tema personalizado generado por Matugen
- **Matugen** para theming dinámico basado en el wallpaper
- **Kitty** como terminal, **Rofi** como lanzador, **Neovim** como editor
- **SwayNC** para notificaciones y **Cava** para visualización de audio
- Fuentes **JetBrains Mono** incluidas

## Instalación

> Requiere Arch Linux. El script instala dependencias, configura drivers, copia los dotfiles y aplica el tema automáticamente.

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Duban-sg/tranquiland-dots/master/install.sh)"
```

El instalador cubre los siguientes pasos de forma automática:

1. Verificación de privilegios sudo
2. Resolución de conflictos de paquetes
3. Instalación de dependencias y drivers
4. Configuración del display manager (SDDM)
5. Descarga de wallpapers
6. Copia de dotfiles (con backup de configuraciones anteriores)
7. Instalación de fuentes
8. Configuración de adaptabilidad del sistema
9. Aplicación del tema y colores
10. Guardado del estado de configuración

> Las configuraciones anteriores se respaldan automáticamente antes de ser reemplazadas.

---

## Créditos

| Rol | Usuario |
|-----|---------|
| Autor del proyecto original | [@ilyamirox](https://github.com/ilyamiro) |
| Mantenedor de este fork | [@Duban-sg](https://github.com/Duban-sg) |
