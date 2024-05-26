// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_messaging/firebase_messaging.dart' as _i6;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../ui/views/create_task_view/create_task_controller.dart' as _i16;
import '../../ui/views/login_view/login_controller.dart' as _i13;
import '../../ui/views/main_view/main_controller.dart' as _i8;
import '../../ui/views/profile_view/profile_controller.dart' as _i12;
import '../../ui/views/task_buttom_sheet/task_buttom_sheet_controller.dart'
    as _i15;
import '../../ui/views/tasks_view/task_controller.dart' as _i14;
import '../repositories/auth_repository/auth_repository_impl.dart' as _i11;
import '../repositories/task_repository/task_repository_impl.dart' as _i10;
import 'di_config.dart' as _i17;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.FirebaseFirestore>(() => appModule.store);
  gh.factory<_i4.FirebaseAuth>(() => appModule.auth);
  gh.factory<_i5.FirebaseStorage>(() => appModule.storage);
  gh.factory<_i6.FirebaseMessaging>(() => appModule.messaging);
  await gh.factoryAsync<_i7.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i8.MainController>(
    () => _i8.MainController(),
    dispose: (i) => i.dispose(),
  );
  gh.lazySingleton<_i9.Logger>(() => appModule.logger);
  gh.factory<_i10.TaskImpl>(() => _i10.TaskImpl(
        gh<_i9.Logger>(),
        gh<_i3.FirebaseFirestore>(),
      ));
  gh.factory<_i11.AuthImpl>(() => _i11.AuthImpl(
        gh<_i4.FirebaseAuth>(),
        gh<_i9.Logger>(),
        gh<_i3.FirebaseFirestore>(),
      ));
  gh.singleton<_i12.ProfileController>(
      () => _i12.ProfileController(gh<_i11.AuthImpl>()));
  gh.singleton<_i13.LoginController>(
      () => _i13.LoginController(gh<_i11.AuthImpl>()));
  gh.singleton<_i14.TaskController>(
      () => _i14.TaskController(gh<_i10.TaskImpl>()));
  gh.singleton<_i15.TaskButtomSheetController>(
      () => _i15.TaskButtomSheetController(gh<_i10.TaskImpl>()));
  gh.singleton<_i16.CreateTaskController>(
      () => _i16.CreateTaskController(gh<_i10.TaskImpl>()));
  return getIt;
}

class _$AppModule extends _i17.AppModule {}
