import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spout_app/core/di/locator.dart';
import 'package:spout_app/core/models/user_settings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AppBaseViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  UserSettings userSettings = locator<UserSettings>();
  late SharedPreferences prefs;
  ThemeMode themeMode = ThemeMode.dark;
  void init() {}

  changeTheme() {
    if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    print(themeMode);
    locator<AppBaseViewModel>().notifyListeners();
    notifyListeners();
  }

  AppBaseViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initSharedPreferences();
      print(userSettings.spoutDuration);
      loadSettingsFromSharedPreferences();
      resetTimer();
    });
  }
  // final SoundSelectionProvider _audioProvider = SoundSelectionProvider();

  late Timer _timer;
  int _currentRound = 1;

  late int _currentTimeInSeconds = 0;

  bool _isRunning = false;
  bool _isBreakTime = false;

  /// SHARED PREFERENCES
  Future<void> _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loadSettingsFromSharedPreferences() {
    userSettings.autoStartNextSession =
        prefs.getBool('autoStartNextSession') ?? false;
    userSettings.screenAlwaysOn = prefs.getBool('screenAlwaysOn') ?? false;
    userSettings.currentLanguage =
        prefs.getString('currentLanguage') ?? 'English';
    userSettings.sounds = prefs.getBool('sounds') ?? true;
    userSettings.tickingSounds = prefs.getBool('tickingSounds') ?? true;
    userSettings.ambientSounds = prefs.getBool('ambientSounds') ?? true;
    userSettings.vibration = prefs.getBool('vibration') ?? true;
    userSettings.notifications = prefs.getBool('notifications') ?? true;
    userSettings.sessionCount = prefs.getInt('sessionCount') ?? 3;
    userSettings.longBreakDuration = prefs.getInt('longBreakDuration') ?? 45;
    userSettings.breakDuration = prefs.getInt('breakDuration') ?? 5;
    userSettings.spoutDuration = prefs.getInt('spoutDuration') ?? 25;
    notifyListeners();
  }

  ///TIMER

  bool get isRunning => _isRunning;

  bool get isBreakTime => _isBreakTime;

  int get currentTimeInSeconds => _currentTimeInSeconds;

  int get currentRound => _currentRound;

  int get maxTimeInSeconds =>
      (_isBreakTime
          ? (_currentRound == userSettings.sessionCount
              ? userSettings.longBreakDuration
              : userSettings.breakDuration)
          : userSettings.spoutDuration) *
      60;

  bool get isEqual => currentTimeInSeconds == maxTimeInSeconds;

  String get currentTimeDisplay {
    int minutes = _currentTimeInSeconds ~/ 60;
    int seconds = _currentTimeInSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  String get currentRoundDisplay {
    return 'Round $_currentRound of ${userSettings.sessionCount}';
  }

  void toggleTimer() {
    if (!_isRunning) {
      _isRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
      notifyListeners();
    } else {
      _timer.cancel();
      _isRunning = false;
      notifyListeners();
    }
  }

  void jumpNextRound() {
    if (_isRunning) {
      _timer.cancel();
      _isRunning = false;
      notifyListeners();
    }

    _timeControl();

    if (userSettings.autoStartNextSession == false) {
      _timer.cancel();
      _isRunning = false;
      notifyListeners();
    }
  }

  void _timeControl() {
    if (_isBreakTime) {
      _currentTimeInSeconds = userSettings.spoutDuration * 60;
      _addRound();
    } else {
      if (_currentRound == userSettings.sessionCount) {
        _currentTimeInSeconds = userSettings.longBreakDuration * 60;
      } else {
        _currentTimeInSeconds = userSettings.breakDuration * 60;
      }
    }

    _isBreakTime = !_isBreakTime;
    toggleTimer();
  }

  void _updateTimer(Timer timer) {
    if (_currentTimeInSeconds > 0) {
      _currentTimeInSeconds--;
      notifyListeners();
    } else {
      _timer.cancel(); // previous timer
      _isRunning = false;

      _timeControl();

      if (userSettings.autoStartNextSession == false) {
        _timer.cancel(); // next timer
        _isRunning = false;
        notifyListeners();
      }

      // if (NotificationProvider.isActive) {
      //   _audioProvider.playSelectedAudio();
      // }
    }
  }

  void _addRound() {
    _currentRound < userSettings.sessionCount
        ? _currentRound++
        : _currentRound = 1;
  }

  void resetTimer() {
    _currentTimeInSeconds = maxTimeInSeconds;
    notifyListeners();
  }
}
