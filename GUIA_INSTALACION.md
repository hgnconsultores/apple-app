# 🚀 Guía de Instalación y Despliegue - HGN WebView App

## ✅ Estado del Proyecto

Tu aplicación Flutter está **100% lista** con:

✅ WebView de https://www.hgnconsultores.com/herramientas/A1/
✅ Código principal completo (`lib/main.dart`)
✅ Configuración iOS lista (`ios/Runner/Info.plist`)
✅ GitHub Actions configurado (`.github/workflows/ios-build.yml`)
✅ Documentación completa (`README.md`)

---

## 📋 Opción 1: Generar IPA con GitHub Actions (GRATIS - RECOMENDADO)

Esta es la forma **GRATIS** de generar el .ipa usando los servidores Mac de GitHub.

### Paso 1: Sube el código a GitHub

```bash
# Navega a la carpeta del proyecto
cd c:\Users\moise\Downloads\0000\hgn_webview_app

# Inicializa git (si no lo has hecho)
git init

# Agrega todos los archivos
git add .

# Haz el primer commit
git commit -m "Initial commit: HGN WebView App"

# Crea un repositorio en GitHub (público para minutos ilimitados)
# Ve a: https://github.com/new

# Conecta tu repositorio local con GitHub
git remote add origin https://github.com/TU_USUARIO/hgn-webview-app.git

# Sube el código
git push -u origin main
```

### Paso 2: Ejecuta el GitHub Action

1. Ve a tu repositorio en GitHub
2. Haz clic en la pestaña **"Actions"**
3. Verás el workflow **"Build iOS IPA"**
4. Haz clic en **"Run workflow"** → **"Run workflow"**
5. Espera 5-10 minutos mientras GitHub genera el IPA

### Paso 3: Descarga el IPA

1. Una vez completado el workflow, ve a la sección **"Artifacts"**
2. Descarga **"hgn-webview-app-ipa"**
3. Extrae el archivo ZIP
4. ¡Ya tienes tu archivo `hgn_webview_app.ipa`!

---

## 📋 Opción 2: Instalación Local de Flutter (Si quieres probar localmente)

### Instalar Flutter en Windows:

1. **Descarga Flutter:**
   - Ve a: https://docs.flutter.dev/get-started/install/windows
   - Descarga el Flutter SDK
   - Extrae en `C:\src\flutter`

2. **Agrega Flutter al PATH:**
   ```powershell
   # Abre PowerShell como Administrador
   [Environment]::SetEnvironmentVariable(
       "Path",
       [Environment]::GetEnvironmentVariable("Path", "User") + ";C:\src\flutter\bin",
       "User"
   )
   ```

3. **Verifica la instalación:**
   ```bash
   flutter doctor
   ```

4. **Instala las dependencias del proyecto:**
   ```bash
   cd c:\Users\moise\Downloads\0000\hgn_webview_app
   flutter pub get
   ```

5. **Ejecuta la app (requiere emulador o dispositivo conectado):**
   ```bash
   # Para Android
   flutter run

   # Para ver en Chrome (para pruebas)
   flutter run -d chrome
   ```

---

## 🍎 Instalar el IPA en tu iPhone

El IPA generado por GitHub Actions **NO está firmado**. Para instalarlo:

### Opción A: AltStore (Recomendado - Gratis)

1. Descarga AltStore: https://altstore.io/
2. Instala AltStore en tu PC
3. Conecta tu iPhone
4. Arrastra el archivo `.ipa` a AltStore
5. ¡Listo! (Necesitas renovar cada 7 días con cuenta gratuita)

### Opción B: Sideloadly (Gratis)

1. Descarga Sideloadly: https://sideloadly.io/
2. Conecta tu iPhone
3. Arrastra el `.ipa` a Sideloadly
4. Inicia sesión con tu Apple ID
5. Haz clic en "Start"

### Opción C: TestFlight (Requiere cuenta de desarrollador - $99/año)

1. Necesitas una cuenta Apple Developer
2. Sube el IPA a App Store Connect
3. Distribúyelo mediante TestFlight

---

## 🔧 Arquitectura del Proyecto

```
hgn_webview_app/
├── .github/workflows/ios-build.yml  ← GitHub Actions (genera IPA gratis)
├── lib/main.dart                    ← Código principal con WebView
├── ios/Runner/Info.plist            ← Permisos de red para iOS
├── pubspec.yaml                     ← Dependencias (webview_flutter)
└── README.md                        ← Documentación completa
```

---

## 💡 Características de la App

✅ **WebView Completo**: Muestra https://www.hgnconsultores.com/herramientas/A1/
✅ **Indicador de Carga**: Spinner mientras carga la página
✅ **Botón Recargar**: En el AppBar para refrescar la página
✅ **Manejo de Errores**: Muestra errores si no hay conexión
✅ **Todas las Orientaciones**: Vertical y horizontal
✅ **JavaScript Habilitado**: Para funcionalidad completa del sitio

---

## 🆓 GitHub Actions - Minutos Gratis

- **Repositorio Público**: ✅ Minutos ILIMITADOS (GRATIS)
- **Repositorio Privado**: 2,000 minutos/mes (cuenta gratis)
- **Runner Mac**: ~5-10 minutos por build
- **Costo**: $0 si el repo es público

---

## 📝 Próximos Pasos

1. ✅ El código está listo
2. 📤 Sube a GitHub (Opción 1)
3. ▶️ Ejecuta el GitHub Action
4. 📥 Descarga el IPA
5. 📱 Instala en tu iPhone con AltStore/Sideloadly

---

## ❓ Problemas Comunes

### "El IPA no se instala"
- El IPA no está firmado
- Usa AltStore o Sideloadly

### "GitHub Actions falla"
- Verifica que el repo sea público
- Revisa los logs en la pestaña Actions

### "No puedo ejecutar localmente"
- No es necesario, usa GitHub Actions
- Si quieres hacerlo, instala Flutter (Opción 2)

---

## 📞 Soporte

Si tienes dudas:
1. Revisa el `README.md` completo
2. Consulta los logs de GitHub Actions
3. Verifica que todos los archivos estén en el repositorio

---

¡Tu app está lista! 🎉 Solo súbela a GitHub y genera el IPA gratis.
