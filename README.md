# task

Esta proyecto esta cumple con la gestion de tareas, ofreciendo la autenticación con google para identificar las tareas creadas por el usuario

## Getting Started

This project is a starting point for a Flutter application.

## Serialización 

Ejecuta el siguiente comando en la raíz del proyecto


```bash
flutter pub run build_runner build
```


Esto genera la Serialización JSON para los Modelos, y se debe ejecutar siempre que sea necesario. Esto desencadena una única compilación que pasa por los ficheros fuente, elige los  relevantes, y genera el código de serialización necesario para cada Modelo.

### Conflictos durante serializacion

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
