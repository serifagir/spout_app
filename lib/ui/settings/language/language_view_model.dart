import 'package:spout_app/app/app_base_view_model.dart';
import 'package:spout_app/core/di/locator.dart';
import 'package:spout_app/core/helpers/shared_preferences_helpers.dart';

class LanguageViewModel extends AppBaseViewModel {
  void initLanguageViewModel() {}

  String get currentLanguage =>
      locator<AppBaseViewModel>().userSettings.currentLanguage;

  final List languages = [
    "English",
    "Spanish",
    "French",
    "Deutsch",
  ];

  void changeLanguage(String language) {
    locator<AppBaseViewModel>().userSettings.currentLanguage = language;
    saveStringSettingToSharedPreferences(prefs, 'currentLanguage', language);
    notifyListeners();
  }
}
