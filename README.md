# Visceral Coaching App - MVP

Una aplicación móvil de coaching desarrollada con Flutter.

## Requisitos previos

- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio (para desarrollo Android)
- Xcode (para desarrollo iOS, solo en macOS)

## Instalación

1. Clona el repositorio:
```bash
git clone <repository-url>
cd visceral-coaching-app
```

2. Instala las dependencias:
```bash
flutter pub get
```

## Ejecución

### En modo desarrollo:
```bash
flutter run
```

### En un dispositivo específico:
```bash
# Listar dispositivos disponibles
flutter devices

# Ejecutar en un dispositivo específico
flutter run -d <device-id>
```

## Build

### Android (APK):
```bash
flutter build apk
```

### Android (App Bundle para Play Store):
```bash
flutter build appbundle
```

### iOS:
```bash
flutter build ios
```

## Tests

Ejecutar los tests:
```bash
flutter test
```

## Estructura del proyecto

```
lib/
  └── main.dart          # Punto de entrada de la aplicación
test/
  └── widget_test.dart   # Tests de widgets
android/                 # Configuración Android
ios/                     # Configuración iOS
```

## Estado actual

La aplicación actualmente muestra "Visceral" en el centro de la pantalla. Este es el scaffold básico listo para desarrollo adicional.

## Licencia

Todos los derechos reservados.
