import 'package:spout_app/app/app_base_view_model.dart';
import 'package:spout_app/core/helpers/shared_preferences_helpers.dart';

class SessionCountViewModel extends AppBaseViewModel {
  void initSessionCountViewModel() {}

  final List<int> sessionCounts = [2, 3, 4];

  void setSessionCount(int value) {
    userSettings.sessionCount = value;
    saveIntSettingToSharedPreferences(prefs, 'sessionCount', value);
    notifyListeners();
  }
}
