# Script de Inicialización y Subida a GitHub
# HGN WebView App

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  HGN WebView App - Setup Automático" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar si git está instalado
Write-Host "[1/5] Verificando Git..." -ForegroundColor Yellow
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Git no está instalado. Por favor instala Git desde: https://git-scm.com/" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Git encontrado" -ForegroundColor Green
Write-Host ""

# Preguntar por el nombre del repositorio
Write-Host "[2/5] Configuración del Repositorio" -ForegroundColor Yellow
$repoName = Read-Host "Nombre del repositorio en GitHub (ej: hgn-webview-app)"
if ([string]::IsNullOrWhiteSpace($repoName)) {
    $repoName = "hgn-webview-app"
    Write-Host "Usando nombre por defecto: $repoName" -ForegroundColor Cyan
}

$username = Read-Host "Tu usuario de GitHub (ej: tu-usuario)"
if ([string]::IsNullOrWhiteSpace($username)) {
    Write-Host "❌ El nombre de usuario es requerido" -ForegroundColor Red
    exit 1
}

Write-Host ""

# Inicializar Git
Write-Host "[3/5] Inicializando Git..." -ForegroundColor Yellow
if (-not (Test-Path ".git")) {
    git init
    Write-Host "✅ Repositorio Git inicializado" -ForegroundColor Green
} else {
    Write-Host "✅ Repositorio Git ya existe" -ForegroundColor Green
}
Write-Host ""

# Agregar archivos
Write-Host "[4/5] Agregando archivos..." -ForegroundColor Yellow
git add .
git commit -m "Initial commit: HGN WebView App with WebView to hgnconsultores.com/herramientas/A1"
Write-Host "✅ Archivos agregados y commit realizado" -ForegroundColor Green
Write-Host ""

# Configurar remoto
Write-Host "[5/5] Configurando repositorio remoto..." -ForegroundColor Yellow
$remoteUrl = "https://github.com/$username/$repoName.git"

# Verificar si ya existe un remoto
$existingRemote = git remote get-url origin 2>$null
if ($existingRemote) {
    Write-Host "⚠️  Remote 'origin' ya existe: $existingRemote" -ForegroundColor Yellow
    $replace = Read-Host "¿Deseas reemplazarlo? (s/n)"
    if ($replace -eq "s" -or $replace -eq "S") {
        git remote remove origin
        git remote add origin $remoteUrl
        Write-Host "✅ Remote actualizado" -ForegroundColor Green
    }
} else {
    git remote add origin $remoteUrl
    Write-Host "✅ Remote configurado: $remoteUrl" -ForegroundColor Green
}

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  📋 PRÓXIMOS PASOS" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "1️⃣  Crea el repositorio en GitHub:" -ForegroundColor Yellow
Write-Host "   👉 https://github.com/new" -ForegroundColor Cyan
Write-Host "   - Nombre: $repoName" -ForegroundColor White
Write-Host "   - Tipo: Público (para GitHub Actions gratis)" -ForegroundColor White
Write-Host "   - NO inicialices con README" -ForegroundColor White
Write-Host ""

Write-Host "2️⃣  Sube el código:" -ForegroundColor Yellow
Write-Host "   👉 Ejecuta este comando:" -ForegroundColor Cyan
Write-Host "   git push -u origin main" -ForegroundColor White
Write-Host ""
Write-Host "   Si da error, prueba:" -ForegroundColor Gray
Write-Host "   git branch -M main" -ForegroundColor Gray
Write-Host "   git push -u origin main" -ForegroundColor Gray
Write-Host ""

Write-Host "3️⃣  Ejecuta GitHub Actions:" -ForegroundColor Yellow
Write-Host "   👉 https://github.com/$username/$repoName/actions" -ForegroundColor Cyan
Write-Host "   - Selecciona 'Build iOS IPA'" -ForegroundColor White
Write-Host "   - Click en 'Run workflow'" -ForegroundColor White
Write-Host "   - Espera 10 minutos" -ForegroundColor White
Write-Host ""

Write-Host "4️⃣  Descarga tu IPA:" -ForegroundColor Yellow
Write-Host "   - Ve a la sección 'Artifacts'" -ForegroundColor White
Write-Host "   - Descarga 'hgn-webview-app-ipa'" -ForegroundColor White
Write-Host ""

Write-Host "5️⃣  Instala en tu iPhone:" -ForegroundColor Yellow
Write-Host "   - Usa AltStore: https://altstore.io/" -ForegroundColor White
Write-Host "   - O Sideloadly: https://sideloadly.io/" -ForegroundColor White
Write-Host ""

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  ✅ Setup completado!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

$openGitHub = Read-Host "¿Deseas abrir GitHub en el navegador para crear el repo? (s/n)"
if ($openGitHub -eq "s" -or $openGitHub -eq "S") {
    Start-Process "https://github.com/new"
}

Write-Host ""
Write-Host "📚 Para más información, lee:" -ForegroundColor Cyan
Write-Host "   - RESUMEN.md (vista rápida)" -ForegroundColor White
Write-Host "   - GUIA_INSTALACION.md (guía completa)" -ForegroundColor White
Write-Host "   - README.md (documentación técnica)" -ForegroundColor White
Write-Host ""
