import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spout_app/app/spout_app.dart';
import 'package:spout_app/core/di/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  setupLocator();
  runApp(const SpoutApp());
}
