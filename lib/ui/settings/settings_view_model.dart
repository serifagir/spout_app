import 'package:firebase_auth/firebase_auth.dart';
import 'package:spout_app/app/app_base_view_model.dart';
import 'package:spout_app/core/di/locator.dart';
import 'package:spout_app/core/helpers/shared_preferences_helpers.dart';

class SettingsViewModel extends AppBaseViewModel {
  initSettingsViewModel() {
    print(FirebaseAuth.instance.currentUser);
  }

  get currentLanguage =>
      locator<AppBaseViewModel>().userSettings.currentLanguage;

  void toggleAutoStartNextSession(bool value) {
    userSettings.autoStartNextSession = value;
    saveBoolSettingToSharedPreferences(prefs, 'autoStartNextSession', value);
    notifyListeners();
  }

  void toggleScreenAlwaysOn(bool value) {
    userSettings.screenAlwaysOn = value;
    saveBoolSettingToSharedPreferences(prefs, 'screenAlwaysOn', value);
    notifyListeners();
  }
}
