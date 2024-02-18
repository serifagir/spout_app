import 'package:spout_app/app/app_base_view_model.dart';
import 'package:spout_app/core/helpers/shared_preferences_helpers.dart';

class BreakDurationViewModel extends AppBaseViewModel {
  void initBreakDurationViewModel() {}

  final List<int> breakDurations = [5, 10, 15, 20, 25, 30];

  void setBreakDuration(int value) {
    userSettings.breakDuration = value;
    saveIntSettingToSharedPreferences(prefs, 'breakDuration', value);
    notifyListeners();
  }
}
