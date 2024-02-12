import 'package:flutter/material.dart';
import 'package:spout_app/core/di/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AppBaseViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  ThemeMode themeMode = ThemeMode.light;
  void init() {}

  changeTheme() {
    if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    print(themeMode);
    locator<AppBaseViewModel>().notifyListeners();
  }
}
