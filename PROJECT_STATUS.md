# 📱 Visceral Coaching App - Proyecto Flutter

## ✅ Estado del proyecto

El proyecto ha sido creado exitosamente con la siguiente estructura:

```
visceral-coaching-app/
├── README.md                      # Documentación principal del proyecto
├── FLUTTER_SETUP.md              # Guía de instalación de Flutter
├── pubspec.yaml                  # Dependencias y configuración del proyecto
├── analysis_options.yaml         # Configuración de análisis de código
├── .gitignore                    # Archivos ignorados por Git
├── .metadata                     # Metadata de Flutter
│
├── lib/
│   └── main.dart                 # 🎯 Código principal de la app (muestra "Visceral")
│
├── test/
│   └── widget_test.dart          # Tests unitarios
│
├── android/                      # 🤖 Configuración Android
│   ├── app/
│   │   ├── build.gradle
│   │   └── src/main/
│   │       ├── AndroidManifest.xml
│   │       ├── kotlin/com/visceral/coaching_app/
│   │       │   └── MainActivity.kt
│   │       └── res/
│   ├── build.gradle
│   ├── settings.gradle
│   ├── gradle.properties
│   ├── gradlew (executable)
│   └── gradle/wrapper/
│
└── ios/                          # 🍎 Configuración iOS
    ├── Runner/
    │   ├── Info.plist
    │   ├── AppDelegate.swift
    │   ├── Assets.xcassets/
    │   └── Base.lproj/
    ├── Runner.xcodeproj/
    └── Flutter/
```

## 🎯 Lo que hace la app actualmente

La aplicación muestra la palabra **"Visceral"** centrada en la pantalla con Material Design 3.

## 📋 Pasos siguientes

### Si NO tienes Flutter instalado:

1. Sigue las instrucciones en `FLUTTER_SETUP.md`
2. Ejecuta `flutter doctor` para verificar la instalación

### Si YA tienes Flutter instalado:

1. **Instalar dependencias:**
   ```bash
   cd /Users/carlos.medina/workspace/visceral-coaching-app
   flutter pub get
   ```

2. **Verificar dispositivos disponibles:**
   ```bash
   flutter devices
   ```

3. **Ejecutar la app:**
   ```bash
   flutter run
   ```

4. **Construir para producción:**
   ```bash
   # Android APK
   flutter build apk
   
   # Android App Bundle (para Play Store)
   flutter build appbundle
   
   # iOS
   flutter build ios
   ```

## ✨ Características del proyecto

- ✅ Estructura completa de proyecto Flutter
- ✅ Configuración para Android e iOS
- ✅ Material Design 3
- ✅ Configuración de Gradle actualizada
- ✅ Tests básicos incluidos
- ✅ Linting configurado
- ✅ Gitignore apropiado
- ✅ Listo para empaquetar y distribuir

## 🔧 Configuración del proyecto

- **Nombre del paquete:** `visceral_coaching_app`
- **Bundle ID (iOS):** `com.visceral.coachingApp`
- **Package (Android):** `com.visceral.coaching_app`
- **Versión:** 1.0.0+1
- **SDK mínimo Android:** Configurado según Flutter
- **iOS Deployment Target:** 12.0+

## 🎨 Personalización

El archivo principal está en `lib/main.dart`. Puedes empezar a desarrollar desde ahí.

### Estructura del código actual:

```dart
VisceralApp (MaterialApp)
  └── HomePage (Scaffold)
        └── Center
              └── Text("Visceral")
```

## 📱 Dispositivos soportados

- ✅ iOS 12.0 o superior
- ✅ Android (según configuración de Flutter)
- ✅ Orientaciones: Portrait y Landscape

## 🚀 ¡Listo para desarrollar!

El proyecto está completamente configurado y listo para:
- Añadir nuevas pantallas
- Integrar bases de datos
- Añadir navegación
- Implementar estado (Provider, Bloc, Riverpod, etc.)
- Integrar APIs
- Añadir autenticación
- Y mucho más...

---

**Nota:** Este es un scaffold básico. Necesitarás tener Flutter instalado para ejecutar y desarrollar la aplicación.
