import 'package:get_it/get_it.dart';
import 'package:spout_app/app/app_base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AppBaseViewModel());
  locator.registerLazySingleton(() => NavigationService());
}