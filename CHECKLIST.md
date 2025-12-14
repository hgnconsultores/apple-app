# ✅ Checklist de Despliegue - HGN WebView App

## 📋 Pre-requisitos

- [ ] Tener cuenta de GitHub (gratuita)
- [ ] Tener Git instalado en tu PC
- [ ] Tener AltStore o Sideloadly para instalar en iPhone

---

## 🚀 Paso 1: Preparar Repositorio Local

### Opción A: Usar script automático (Recomendado)
```powershell
cd c:\Users\moise\Downloads\0000\hgn_webview_app
.\setup.ps1
```

### Opción B: Manual
```bash
cd c:\Users\moise\Downloads\0000\hgn_webview_app
git init
git add .
git commit -m "Initial commit: HGN WebView App"
```

**Resultado esperado:**
- [ ] Repositorio Git inicializado
- [ ] Todos los archivos en staging
- [ ] Primer commit realizado

---

## 🌐 Paso 2: Crear Repositorio en GitHub

### Ir a GitHub
1. [ ] Ir a: https://github.com/new
2. [ ] Nombre del repositorio: `hgn-webview-app`
3. [ ] Tipo: **Público** ⚠️ (importante para GitHub Actions gratis)
4. [ ] **NO** marcar "Add a README file"
5. [ ] **NO** marcar "Add .gitignore"
6. [ ] **NO** marcar "Choose a license"
7. [ ] Click en "Create repository"

**Resultado esperado:**
- [ ] Repositorio creado en GitHub
- [ ] URL del repositorio copiada

---

## 📤 Paso 3: Subir Código a GitHub

```bash
git remote add origin https://github.com/TU_USUARIO/hgn-webview-app.git
git branch -M main
git push -u origin main
```

**Si pide credenciales:**
- [ ] Usuario: Tu usuario de GitHub
- [ ] Contraseña: Token de acceso personal (no tu contraseña)
  - Crear token: https://github.com/settings/tokens

**Resultado esperado:**
- [ ] Código subido a GitHub
- [ ] Puedes ver los archivos en la web

---

## ⚙️ Paso 4: Ejecutar GitHub Actions

### Para iOS (.ipa):
1. [ ] Ir a: `https://github.com/TU_USUARIO/hgn-webview-app/actions`
2. [ ] Click en "Build iOS IPA" (menú izquierdo)
3. [ ] Click en "Run workflow" (botón derecho)
4. [ ] Click en "Run workflow" (confirmación)
5. [ ] Esperar 5-10 minutos ⏱️

### Para Android (.apk):
1. [ ] Ir a: `https://github.com/TU_USUARIO/hgn-webview-app/actions`
2. [ ] Click en "Build Android APK" (menú izquierdo)
3. [ ] Click en "Run workflow" (botón derecho)
4. [ ] Click en "Run workflow" (confirmación)
5. [ ] Esperar 3-5 minutos ⏱️

**Resultado esperado:**
- [ ] Workflow ejecutándose (circulo amarillo)
- [ ] Workflow completado (check verde) ✅
- [ ] No hay errores (X roja) ❌

---

## 📥 Paso 5: Descargar Artefactos

### Después de que el workflow termine:

1. [ ] Click en el nombre del workflow completado
2. [ ] Scroll hacia abajo hasta "Artifacts"
3. [ ] Descargar:
   - [ ] `hgn-webview-app-ipa` (para iOS)
   - [ ] `hgn-webview-app-apk` (para Android)
4. [ ] Extraer el archivo ZIP
5. [ ] Ubicar el archivo `.ipa` o `.apk`

**Resultado esperado:**
- [ ] Archivo `hgn_webview_app.ipa` en tu PC
- [ ] O archivo `app-release.apk` en tu PC

---

## 📱 Paso 6A: Instalar en iPhone (iOS)

### Opción A: AltStore

1. [ ] Descargar AltStore: https://altstore.io/
2. [ ] Instalar AltStore en tu PC Windows
3. [ ] Conectar iPhone al PC (cable USB)
4. [ ] Abrir AltStore en el PC
5. [ ] Click en "Install AltStore" en el sistema tray
6. [ ] Seguir instrucciones en el iPhone
7. [ ] Confiar en la app en: Ajustes > General > VPN y gestión de dispositivos
8. [ ] Abrir AltStore en el iPhone
9. [ ] Click en "+" para agregar app
10. [ ] Seleccionar el archivo `.ipa`
11. [ ] Esperar instalación

**Notas importantes:**
- [ ] Renovar cada 7 días (abriendo AltStore con PC conectado)
- [ ] Mantener AltServer corriendo en PC para renovar

### Opción B: Sideloadly

1. [ ] Descargar Sideloadly: https://sideloadly.io/
2. [ ] Instalar Sideloadly en tu PC
3. [ ] Conectar iPhone al PC
4. [ ] Abrir Sideloadly
5. [ ] Arrastrar el archivo `.ipa` a Sideloadly
6. [ ] Ingresar tu Apple ID
7. [ ] Click en "Start"
8. [ ] Esperar instalación
9. [ ] Confiar en la app en iPhone: Ajustes > General > VPN y gestión de dispositivos

**Resultado esperado:**
- [ ] App instalada en iPhone
- [ ] Icono "HGN Herramientas" visible
- [ ] App abre sin errores

---

## 📱 Paso 6B: Instalar en Android

1. [ ] Transferir `app-release.apk` al teléfono Android
   - [ ] Vía USB, Bluetooth, email, etc.
2. [ ] En el teléfono, abrir el archivo `.apk`
3. [ ] Si aparece advertencia:
   - [ ] Ir a Ajustes > Seguridad
   - [ ] Permitir "Fuentes desconocidas"
   - [ ] O permitir específicamente para el navegador/gestor de archivos
4. [ ] Click en "Instalar"
5. [ ] Esperar instalación

**Resultado esperado:**
- [ ] App instalada en Android
- [ ] Icono "HGN Herramientas" en el launcher
- [ ] App abre sin errores

---

## ✅ Paso 7: Verificar Funcionamiento

### Al abrir la app:

- [ ] La app abre correctamente
- [ ] Aparece un indicador de carga
- [ ] Se carga la página de HGN Consultores
- [ ] La URL es: `https://www.hgnconsultores.com/herramientas/A1/`
- [ ] El contenido es interactivo
- [ ] El botón de recarga funciona
- [ ] No hay errores de red

**Si todo está ✅:**
¡Felicidades! Tu app está funcionando correctamente. 🎉

---

## 🔧 Solución de Problemas

### ❌ GitHub Actions falla

**Problema:** Workflow termina con X roja

**Soluciones:**
- [ ] Verificar que el repositorio sea público
- [ ] Revisar los logs del workflow (click en el paso con error)
- [ ] Verificar que todos los archivos estén subidos
- [ ] Re-ejecutar el workflow

---

### ❌ El IPA no se instala

**Problema:** AltStore o Sideloadly da error

**Soluciones:**
- [ ] Verificar que el iPhone esté conectado
- [ ] Confiar en el PC desde el iPhone
- [ ] Verificar las credenciales de Apple ID
- [ ] Intentar con otro Apple ID
- [ ] Re-descargar el IPA

---

### ❌ La app no carga la página

**Problema:** Se ve error de red en la app

**Soluciones:**
- [ ] Verificar conexión a internet
- [ ] Verificar que la URL sea correcta
- [ ] Intentar con otra red WiFi
- [ ] Reiniciar la app

---

## 📊 Tiempo Estimado Total

| Paso | Tiempo |
|------|--------|
| 1. Preparar repo local | 2 min |
| 2. Crear repo en GitHub | 2 min |
| 3. Subir código | 1 min |
| 4. Ejecutar GitHub Actions | 10 min (automatizado) |
| 5. Descargar artefactos | 1 min |
| 6. Instalar en dispositivo | 5 min |
| 7. Verificar | 2 min |
| **TOTAL** | **~23 min** |

---

## 📚 Recursos Adicionales

- [ ] `RESUMEN.md` - Vista rápida del proyecto
- [ ] `GUIA_INSTALACION.md` - Guía detallada paso a paso
- [ ] `README.md` - Documentación técnica completa
- [ ] `setup.ps1` - Script de automatización

---

## 🎯 Objetivos Completados

Al terminar este checklist:

- [x] App Flutter creada ✅
- [x] WebView de HGN Consultores funcionando ✅
- [x] GitHub Actions configurado ✅
- [x] IPA/APK generado gratis ✅
- [x] App instalada en dispositivo ✅
- [x] App funcionando correctamente ✅

---

## 🎉 ¡Éxito!

Si todos los checkboxes están marcados, ¡felicidades!

Has desplegado exitosamente tu app Flutter usando GitHub Actions sin costo alguno.

**Próximos pasos opcionales:**
- Personalizar el diseño de la app
- Agregar más funcionalidades
- Publicar en App Store (requiere cuenta de desarrollador)
- Compartir con otros usuarios

---

**Fecha de creación de este checklist:** 14 de Diciembre, 2025
**Versión:** 1.0.0
**Aplicación:** HGN WebView App para iOS y Android
