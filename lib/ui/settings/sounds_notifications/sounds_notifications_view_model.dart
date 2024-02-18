import 'package:spout_app/app/app_base_view_model.dart';
import 'package:spout_app/core/helpers/shared_preferences_helpers.dart';

class SoundsNotificationsViewModel extends AppBaseViewModel {
  void initSoundsNotificationsViewModel() {}

  void toggleSounds(bool value) {
    userSettings.sounds = value;
    saveBoolSettingToSharedPreferences(prefs, 'sounds', value);
    notifyListeners();
  }

  void toggleTickingSounds(bool value) {
    userSettings.tickingSounds = value;
    saveBoolSettingToSharedPreferences(prefs, 'tickingSounds', value);
    notifyListeners();
  }

  void toggleAmbientSounds(bool value) {
    userSettings.ambientSounds = value;
    saveBoolSettingToSharedPreferences(prefs, 'ambientSounds', value);
    notifyListeners();
  }

  void toggleVibration(bool value) {
    userSettings.vibration = value;
    saveBoolSettingToSharedPreferences(prefs, 'vibration', value);
    notifyListeners();
  }

  void toggleNotifications(bool value) {
    userSettings.notifications = value;
    saveBoolSettingToSharedPreferences(prefs, 'notifications', value);
    notifyListeners();
  }
}
