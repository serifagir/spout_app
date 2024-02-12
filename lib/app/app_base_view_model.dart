import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spout_app/core/di/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AppBaseViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  ThemeMode themeMode = ThemeMode.light;
  void init() {
    loadValueFromSharedPreferences();
    resetTimer();
  }

  changeTheme() {
    if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    print(themeMode);
    locator<AppBaseViewModel>().notifyListeners();
  }

  //---------------------------- Timer Logic ---------------------------- //
  late Timer _timer;
  static int _currentSession = 1;
  late int _currentTimeInSeconds;

  bool _isRunning = false;
  bool _isBreakTime = false;

  int get currentSession => _currentSession;
  bool get isRunning => _isRunning;
  bool get isBreakTime => _isBreakTime;
  int get currentTimeInSeconds => _currentTimeInSeconds;

  late SharedPreferences _sharedPreferences;

  static late int _spoutDurationValue;
  static late int _breakDurationValue;
  static late int _longBreakDurationValue;
  static late int _sessionCountValue;

  static int get spoutDurationValue => _spoutDurationValue;
  static int get breakDurationValue => _breakDurationValue;
  static int get longBreakDurationValue => _longBreakDurationValue;
  static int get sessionCountValue => _sessionCountValue;

  void updateSpoutDurationValue(int newValue) {
    _spoutDurationValue = newValue;
    saveValueToSharedPreferences("spoutDurationValue", newValue);
    locator<AppBaseViewModel>().notifyListeners();
  }

  void updateBreakDurationValue(int newValue) {
    _breakDurationValue = newValue;
    saveValueToSharedPreferences("breakDurationValue", newValue);
    locator<AppBaseViewModel>().notifyListeners();
  }

  void updateLongBreakDurationValue(int newValue) {
    _longBreakDurationValue = newValue;
    saveValueToSharedPreferences("longBreakDurationValue", newValue);
    locator<AppBaseViewModel>().notifyListeners();
  }

  void updateSessionCountValue(int newValue) {
    _sessionCountValue = newValue;
    saveValueToSharedPreferences("sessionCountValue", newValue);
    locator<AppBaseViewModel>().notifyListeners();
  }

  Future<void> createSharedPreferencesInstance() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  saveValueToSharedPreferences(String key, int value) {
    _sharedPreferences.setInt(key, value);
  }

  Future<void> loadValueFromSharedPreferences() async {
    await createSharedPreferencesInstance();
    _spoutDurationValue = _sharedPreferences.getInt("spoutDurationValue") ?? 25;
    _breakDurationValue = _sharedPreferences.getInt("breakDurationValue") ?? 5;
    _longBreakDurationValue =
        _sharedPreferences.getInt("longBreakDurationValue") ?? 15;
    _sessionCountValue = _sharedPreferences.getInt("sessionCountValue") ?? 4;
    notifyListeners();
  }

  int get maxTimeInSeconds =>
      (_isBreakTime
          ? (_currentSession == sessionCountValue
              ? longBreakDurationValue
              : breakDurationValue)
          : spoutDurationValue) *
      60;

  bool get isEqual => _currentTimeInSeconds == maxTimeInSeconds;

  String get currentTimeDisplay {
    final int minutes = _currentTimeInSeconds ~/ 60;
    final int seconds = _currentTimeInSeconds % 60;
    final String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    final String secondsStr = seconds.toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }

  String get currentRoundDisplay {
    return "$_currentSession/$sessionCountValue";
  }

  void toggleTimer() {
    if (!_isRunning) {
      _isRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
      locator<AppBaseViewModel>().notifyListeners();
    } else {
      _timer.cancel();
      _isRunning = false;
      locator<AppBaseViewModel>().notifyListeners();
    }
  }

  void jumpNextRound() {
    if (_isRunning) {
      _timer.cancel();
      _isRunning = false;
      locator<AppBaseViewModel>().notifyListeners();
    }

    _timeControl();

    // if (AutoStartProivder.autoStart == false) {
    //   _timer.cancel();
    //   _isRunning = false;
    //   locator<AppBaseViewModel>().notifyListeners();
    // }
  }

  void _timeControl() {
    if (_isBreakTime) {
      _currentTimeInSeconds = spoutDurationValue * 60;
      _addRound();
    } else {
      if (_currentSession == sessionCountValue) {
        _currentTimeInSeconds = longBreakDurationValue * 60;
      } else {
        _currentTimeInSeconds = breakDurationValue * 60;
      }
    }
    _isBreakTime = !_isBreakTime;
    toggleTimer();
  }

  void _updateTimer(Timer timer) {
    if (_currentTimeInSeconds > 0) {
      _currentTimeInSeconds--;
      locator<AppBaseViewModel>().notifyListeners();
    } else {
      _timer.cancel();
      _isRunning = false;

      // if (!_isBreakTime) {
      //   statsProvider.addCompletedFlux(Flux());
      // }
    }
    _timeControl();

    // if (AutoStartProvider.autostart == false) {
    //   _timer.cancel();
    //   _isRunning = false;
    //   locator<AppBaseViewModel>().notifyListeners();
    // }
  }

  void _addRound() {
    _currentSession < _sessionCountValue
        ? _currentSession++
        : _currentSession = 1;
  }

  void resetTimer() {
    _currentSession = maxTimeInSeconds;
    locator<AppBaseViewModel>().notifyListeners();
  }
}
