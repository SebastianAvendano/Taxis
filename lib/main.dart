import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:task/core/config/init_app_config.dart';
import 'package:task/core/paths/navigator/app_router.dart';
import 'package:task/core/providers/providers.dart';
import 'package:task/core/theme/app_theme.dart';

final injector = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppConfig();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.storeProviders,
      child: _materialApp(),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  MaterialApp _materialApp() => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Tareas',
        theme: AppTheme.lightTheme,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      );
}
