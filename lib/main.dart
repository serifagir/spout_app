import 'package:flutter/material.dart';
import 'package:spout_app/app/spout_app.dart';
import 'package:spout_app/core/di/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const SpoutApp());
}
