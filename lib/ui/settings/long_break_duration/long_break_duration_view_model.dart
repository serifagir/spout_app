import 'package:spout_app/app/app_base_view_model.dart';
import 'package:spout_app/core/helpers/shared_preferences_helpers.dart';

class LongBreakDurationViewModel extends AppBaseViewModel {
  void initLongBreakDurationViewModel() {}

  final List<int> longBreakDurations = [30, 40, 45, 50, 60];

  void setLongBreakDuration(int value) {
    userSettings.longBreakDuration = value;
    saveIntSettingToSharedPreferences(prefs, 'longBreakDuration', value);
    notifyListeners();
  }
}
