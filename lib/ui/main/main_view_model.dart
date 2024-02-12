import 'package:spout_app/app/app.router.dart';
import 'package:spout_app/app/app_base_view_model.dart';

class MainViewModel extends AppBaseViewModel {
  void initMainViewModel() {}

  void navigateToSettings() =>
      navigationService.navigateTo(Routes.settingsView);

  void navigateToStats() => navigationService.navigateTo(Routes.statsView);
}
