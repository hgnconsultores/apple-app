# HGN WebView App

Aplicación Flutter que muestra las herramientas A1 de HGN Consultores en un WebView.

## 📱 Descripción

Esta aplicación móvil Flutter muestra el contenido de https://www.hgnconsultores.com/herramientas/A1/ en un WebView nativo, permitiendo una experiencia de aplicación móvil completa.

## 🚀 Características

- ✅ WebView completamente funcional
- ✅ Indicador de carga
- ✅ Botón de recarga
- ✅ Manejo de errores de red
- ✅ Soporte para iOS y Android
- ✅ Construcción automática de IPA mediante GitHub Actions

## 🛠️ Requisitos

- Flutter 3.0.0 o superior
- Dart 3.0.0 o superior
- Para iOS: Xcode 14.0 o superior, macOS
- Para Android: Android Studio

## 📦 Instalación

1. Clona este repositorio:
```bash
git clone <tu-repositorio>
cd hgn_webview_app
```

2. Instala las dependencias:
```bash
flutter pub get
```

3. Ejecuta la aplicación:
```bash
# Para iOS
flutter run -d ios

# Para Android
flutter run -d android
```

## 🏗️ Construcción

### Android (APK)
```bash
flutter build apk --release
```

El APK se generará en: `build/app/outputs/flutter-apk/app-release.apk`

### Android (App Bundle)
```bash
flutter build appbundle --release
```

### iOS (IPA)

#### Construcción local:
```bash
flutter build ios --release
```

#### Construcción mediante GitHub Actions:

1. Sube tu código a GitHub
2. Ve a la pestaña "Actions" en tu repositorio
3. Ejecuta el workflow "Build iOS IPA"
4. Una vez completado, descarga el artefacto `hgn-webview-app-ipa`
5. El archivo `.ipa` estará listo para instalar

**Nota:** El IPA generado por GitHub Actions no está firmado. Para instalarlo en un dispositivo físico, necesitarás:
- Firmarlo con tu certificado de desarrollador de Apple
- O usar herramientas como AltStore, Sideloadly, o similar

## 🔧 Configuración de GitHub Actions

El archivo `.github/workflows/ios-build.yml` está configurado para:

- ✅ Ejecutarse automáticamente en push/pull request a main/master
- ✅ Ejecutarse manualmente desde la pestaña Actions
- ✅ Usar runners de macOS (gratis para repositorios públicos)
- ✅ Generar el IPA sin firma de código
- ✅ Guardar el artefacto por 30 días

### Minutos gratuitos de GitHub Actions:

- **Repositorios públicos:** Ilimitado ✅
- **Repositorios privados:** 2,000 minutos/mes (para cuentas gratuitas)
- **Multiplicador macOS:** 10x (un minuto de macOS = 10 minutos de cuota)

## 📝 Estructura del Proyecto

```
hgn_webview_app/
├── .github/
│   └── workflows/
│       └── ios-build.yml      # GitHub Actions workflow
├── android/                   # Configuración Android
├── ios/                       # Configuración iOS
│   └── Runner/
│       └── Info.plist        # Permisos y configuración
├── lib/
│   └── main.dart             # Código principal de la app
├── pubspec.yaml              # Dependencias del proyecto
└── README.md                 # Este archivo
```

## 🔐 Permisos

La aplicación requiere:
- **iOS:** Permiso para conexiones de red (configurado en Info.plist)
- **Android:** Permiso de internet (configurado automáticamente)

## 🐛 Solución de Problemas

### El WebView no carga en iOS
- Verifica que Info.plist tenga la configuración NSAppTransportSecurity correcta
- Asegúrate de que el dominio esté en la lista de excepciones

### Error en GitHub Actions
- Verifica que el repositorio sea público para minutos ilimitados
- Revisa los logs en la pestaña Actions del repositorio

### El IPA no se instala en el dispositivo
- El IPA generado no está firmado
- Usa herramientas de terceros para firmarlo o súbelo a TestFlight

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.

## 👤 Autor

Creado para HGN Consultores

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue o pull request para sugerencias.
