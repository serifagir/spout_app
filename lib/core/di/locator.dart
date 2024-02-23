import 'package:get_it/get_it.dart';
import 'package:spout_app/app/app_base_view_model.dart';
import 'package:spout_app/core/models/user_progress.dart';
import 'package:spout_app/core/models/user_settings.dart';
import 'package:spout_app/core/services/firebase_services.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AppBaseViewModel());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UserSettings());
  locator.registerLazySingleton(() => UserProgress(
      username: "username", id: 1, spouts: [], completedSpouts: 0));
  locator.registerLazySingleton(() => FirebaseServices());
}
