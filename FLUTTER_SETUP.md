SeS# Guía de instalación de Flutter

## macOS

### 1. Descargar Flutter SDK

```bash
cd ~/development
git clone https://github.com/flutter/flutter.git -b stable
```

### 2. Añadir Flutter al PATH

Edita tu archivo de configuración de shell (~/.zshrc para zsh):

```bash
echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.zshrc
source ~/.zshrc
```

### 3. Ejecutar Flutter Doctor

```bash
flutter doctor
```

Este comando verificará tu instalación y te dirá qué más necesitas instalar.

### 4. Instalar Xcode (para iOS)

1. Instala Xcode desde la App Store
2. Acepta la licencia:
```bash
sudo xcodebuild -license accept
```

3. Instala las herramientas de línea de comandos:
```bash
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

4. Configura el simulador de iOS:
```bash
open -a Simulator
```

### 5. Instalar Android Studio (para Android)

1. Descarga e instala Android Studio desde https://developer.android.com/studio
2. Abre Android Studio y sigue el asistente de configuración
3. Instala Android SDK, Android SDK Command-line Tools, y Android SDK Build-Tools
4. Acepta las licencias de Android:
```bash
flutter doctor --android-licenses
```

### 6. Instalar CocoaPods (para iOS)

```bash
sudo gem install cocoapods
```

## Verificar la instalación

Ejecuta el siguiente comando para verificar que todo esté correctamente instalado:

```bash
flutter doctor -v
```

## Ejecutar el proyecto

Una vez que Flutter esté instalado:

```bash
cd /Users/carlos.medina/workspace/visceral-coaching-app
flutter pub get
flutter run
```

## Solución de problemas comunes

### Error: "cmdline-tools component is missing"
```bash
# Abre Android Studio > Settings > Appearance & Behavior > System Settings > Android SDK
# Ve a la pestaña "SDK Tools"
# Marca "Android SDK Command-line Tools" y aplica
```

### Error: "Android license status unknown"
```bash
flutter doctor --android-licenses
```

### Error con CocoaPods
```bash
sudo gem install cocoapods
pod setup
```

## Recursos adicionales

- Documentación oficial: https://docs.flutter.dev
- Instalación de Flutter: https://docs.flutter.dev/get-started/install/macos
- Flutter para iOS: https://docs.flutter.dev/get-started/install/macos#ios-setup
- Flutter para Android: https://docs.flutter.dev/get-started/install/macos#android-setup
