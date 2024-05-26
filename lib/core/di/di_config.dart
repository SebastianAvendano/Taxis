import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di_config.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<GetIt> configureDependencies() async => $initGetIt(getIt);

@module
abstract class AppModule {
  @lazySingleton
  Logger get logger => Logger();

  @injectable
  FirebaseFirestore get store => FirebaseFirestore.instance;

  @injectable
  FirebaseAuth get auth => FirebaseAuth.instance;

  @injectable
  FirebaseStorage get storage => FirebaseStorage.instance;

  @injectable
  FirebaseMessaging get messaging => FirebaseMessaging.instance;

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
