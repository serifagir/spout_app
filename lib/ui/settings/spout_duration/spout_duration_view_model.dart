import 'package:spout_app/app/app_base_view_model.dart';
import 'package:spout_app/core/helpers/shared_preferences_helpers.dart';

class SpoutDurationViewModel extends AppBaseViewModel {
  void initSpotDurationViewModel() {}

  void setSpoutDuration(int value) {
    userSettings.spoutDuration = value;
    saveIntSettingToSharedPreferences(prefs, 'spoutDuration', value);
    notifyListeners();
  }

  final List spoutDurations = [5, 25, 30, 40, 45, 50, 60, 90];
}
