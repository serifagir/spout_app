import 'package:flutter/material.dart';
import 'package:spout_app/app/app_base_view_model.dart';

class StatsViewModel extends AppBaseViewModel {
  initStatsViewModel() {}

  List months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  DateTime currentDate =
      DateTime(DateTime.now().day, DateTime.now().month, DateTime.now().year);

  String currentDay = DateTime.now().day.toString();
  String currentMonth = DateTime.now().month.toString();
  String currentYear = DateTime.now().year.toString();
}
