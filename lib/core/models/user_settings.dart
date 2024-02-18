import 'package:flutter/material.dart';

class UserSettings {
  ///LANGUAGE
  String currentLanguage = "English";

  ///SOUNDS & NOTIFICATIONS
  bool notifications = true;
  bool sounds = true;
  bool tickingSounds = true;
  bool vibration = true;
  bool ambientSounds = true;

  ///AUTO START NEXT SESSION
  bool autoStartNextSession = true;

  ///SCREEN ALWAYS ON
  bool screenAlwaysOn = true;

  ///DURATIONS
  int spoutDuration = 25;
  int breakDuration = 5;
  int longBreakDuration = 15;
  int sessionCount = 4;
}
