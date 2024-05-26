# Task

Este proyecto gestiona tareas, ofreciendo autenticación con Google para identificar las tareas creadas por el usuario.

## Introducción

Este proyecto es un punto de partida para una aplicación Flutter.

## Requisitos Previos

- [Flutter](https://flutter.dev/docs/get-started/install) (versión recomendada: >= 2.0)
- [Dart](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) o [VS Code](https://code.visualstudio.com/) con las extensiones de Flutter y Dart
- Configuración de autenticación de Google en Firebase

## Configuración Inicial

1. Clona el repositorio:
    ```bash
    git clone https://github.com/tu-usuario/task.git
    cd task
    ```

2. Instala las dependencias:
    ```bash
    flutter pub get
    ```

3. Configura Firebase:
    - Sigue [esta guía](https://firebase.flutter.dev/docs/overview) para configurar Firebase con tu proyecto Flutter.
    - Añade el archivo `google-services.json` a la carpeta `android/app`.

## Serialización

Ejecuta el siguiente comando en la raíz del proyecto para generar la serialización JSON para los modelos:

```bash
flutter pub run build_runner build
```

Esto genera la Serialización JSON para los Modelos, y se debe ejecutar siempre que sea necesario. Esto desencadena una única compilación que pasa por los ficheros fuente, elige los  relevantes, y genera el código de serialización necesario para cada Modelo.

### Conflictos durante serializacion

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
### Compilacion

```bash
flutter run
```

