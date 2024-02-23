import 'package:flutter/material.dart';
import 'package:spout_app/app/app_base_view_model.dart';

class StatsViewModel extends AppBaseViewModel {
  initStatsViewModel() {
    currentDate = DateTime.now();
    getSpoutStatsByDay();
    getSpoutStatsByMonth();
  }

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

  DateTime currentDate = DateTime.now();

  String currentDay = DateTime.now().day.toString();
  String currentMonth = DateTime.now().month.toString();
  String currentYear = DateTime.now().year.toString();

  void incrementDay() {
    currentDate = currentDate.add(const Duration(days: 1));
    currentDay = currentDate.day.toString();
    currentMonth = currentDate.month.toString();
    currentYear = currentDate.year.toString();
    notifyListeners();
  }

  void decrementDay() {
    currentDate = currentDate.subtract(const Duration(days: 1));
    currentDay = currentDate.day.toString();
    currentMonth = currentDate.month.toString();
    currentYear = currentDate.year.toString();
    notifyListeners();
  }

  void incrementWeek() {
    currentDate = currentDate.add(const Duration(days: 7));
    currentDay = currentDate.day.toString();
    currentMonth = currentDate.month.toString();
    currentYear = currentDate.year.toString();
    notifyListeners();
  }

  void decrementWeek() {
    currentDate = currentDate.subtract(const Duration(days: 7));
    currentDay = currentDate.day.toString();
    currentMonth = currentDate.month.toString();
    currentYear = currentDate.year.toString();
    notifyListeners();
  }

  void incrementMonth() {
    currentDate = currentDate.add(const Duration(days: 30));
    currentDay = currentDate.day.toString();
    currentMonth = currentDate.month.toString();
    currentYear = currentDate.year.toString();
    notifyListeners();
  }

  void decrementMonth() {
    currentDate = currentDate.subtract(const Duration(days: 30));
    currentDay = currentDate.day.toString();
    currentMonth = currentDate.month.toString();
    currentYear = currentDate.year.toString();
    notifyListeners();
  }

  void incrementYear() {
    currentDate = currentDate.add(const Duration(days: 365));
    currentDay = currentDate.day.toString();
    currentMonth = currentDate.month.toString();
    currentYear = currentDate.year.toString();
    notifyListeners();
  }

  void decrementYear() {
    currentDate = currentDate.subtract(const Duration(days: 365));
    currentDay = currentDate.day.toString();
    currentMonth = currentDate.month.toString();
    currentYear = currentDate.year.toString();
    notifyListeners();
  }

  Map<int, double> getSpoutStatsByDay() {
    final List spoutsStatsByDay = [];
    if (userProgress.spouts.isNotEmpty) {
      for (var spout in userProgress.spouts) {
        if (spout.startDate.day == currentDate.day &&
            spout.startDate.month == currentDate.month &&
            spout.startDate.year == currentDate.year) {
          spoutsStatsByDay.add(spout);
        }
      }
    }
    return {
      0: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 0)
          .length
          .toDouble(),
      1: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 1)
          .length
          .toDouble(),
      2: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 2)
          .length
          .toDouble(),
      3: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 3)
          .length
          .toDouble(),
      4: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 4)
          .length
          .toDouble(),
      5: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 5)
          .length
          .toDouble(),
      6: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 6)
          .length
          .toDouble(),
      7: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 7)
          .length
          .toDouble(),
      8: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 8)
          .length
          .toDouble(),
      9: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 9)
          .length
          .toDouble(),
      10: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 10)
          .length
          .toDouble(),
      11: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 11)
          .length
          .toDouble(),
      12: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 12)
          .length
          .toDouble(),
      13: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 13)
          .length
          .toDouble(),
      14: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 14)
          .length
          .toDouble(),
      15: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 15)
          .length
          .toDouble(),
      16: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 16)
          .length
          .toDouble(),
      17: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 17)
          .length
          .toDouble(),
      18: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 18)
          .length
          .toDouble(),
      19: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 19)
          .length
          .toDouble(),
      20: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 20)
          .length
          .toDouble(),
      21: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 21)
          .length
          .toDouble(),
      22: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 22)
          .length
          .toDouble(),
      23: spoutsStatsByDay
          .where(
              (element) => element.isCompleted && element.startDate.hour == 23)
          .length
          .toDouble(),
    };
  }

  Map<int, double> getSpoutStatsByWeek() {
    final List spoutsStatsByWeek = [];
    if (userProgress.spouts.isNotEmpty) {
      for (var spout in userProgress.spouts) {
        if (spout.startDate.weekday == currentDate.weekday &&
            spout.startDate.month == currentDate.month &&
            spout.startDate.year == currentDate.year) {
          spoutsStatsByWeek.add(spout);
        }
      }
    }
    return {
      0: spoutsStatsByWeek
          .where((element) => element.isCompleted && element.startDate.day == 1)
          .length
          .toDouble(),
      1: spoutsStatsByWeek
          .where((element) => element.isCompleted && element.startDate.day == 2)
          .length
          .toDouble(),
      2: spoutsStatsByWeek
          .where((element) => element.isCompleted && element.startDate.day == 3)
          .length
          .toDouble(),
      3: spoutsStatsByWeek
          .where((element) => element.isCompleted && element.startDate.day == 4)
          .length
          .toDouble(),
      4: spoutsStatsByWeek
          .where((element) => element.isCompleted && element.startDate.day == 5)
          .length
          .toDouble(),
      5: spoutsStatsByWeek
          .where((element) => element.isCompleted && element.startDate.day == 6)
          .length
          .toDouble(),
      6: spoutsStatsByWeek
          .where((element) => element.isCompleted && element.startDate.day == 7)
          .length
          .toDouble(),
    };
  }

  Map<int, double> getSpoutStatsByMonth() {
    final List spoutsStatsByMonth = [];
    if (userProgress.spouts.isNotEmpty) {
      for (var spout in userProgress.spouts) {
        if (spout.startDate.month == currentDate.month &&
            spout.startDate.year == currentDate.year) {
          spoutsStatsByMonth.add(spout);
        }
      }
    }
    return {
      0: spoutsStatsByMonth
          .where((element) => element.isCompleted && element.startDate.day == 1)
          .length
          .toDouble(),
      1: spoutsStatsByMonth
          .where((element) => element.isCompleted && element.startDate.day == 2)
          .length
          .toDouble(),
      2: spoutsStatsByMonth
          .where((element) => element.isCompleted && element.startDate.day == 3)
          .length
          .toDouble(),
      3: spoutsStatsByMonth
          .where((element) => element.isCompleted && element.startDate.day == 4)
          .length
          .toDouble(),
      4: spoutsStatsByMonth
          .where((element) => element.isCompleted && element.startDate.day == 5)
          .length
          .toDouble(),
      5: spoutsStatsByMonth
          .where((element) => element.isCompleted && element.startDate.day == 6)
          .length
          .toDouble(),
      6: spoutsStatsByMonth
          .where((element) => element.isCompleted && element.startDate.day == 7)
          .length
          .toDouble(),
      7: spoutsStatsByMonth
          .where((element) => element.isCompleted && element.startDate.day == 8)
          .length
          .toDouble(),
      8: spoutsStatsByMonth
          .where((element) => element.isCompleted && element.startDate.day == 9)
          .length
          .toDouble(),
      9: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 10)
          .length
          .toDouble(),
      10: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 11)
          .length
          .toDouble(),
      11: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 12)
          .length
          .toDouble(),
      12: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 13)
          .length
          .toDouble(),
      13: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 14)
          .length
          .toDouble(),
      14: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 15)
          .length
          .toDouble(),
      15: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 16)
          .length
          .toDouble(),
      16: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 17)
          .length
          .toDouble(),
      17: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 18)
          .length
          .toDouble(),
      18: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 19)
          .length
          .toDouble(),
      19: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 20)
          .length
          .toDouble(),
      20: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 21)
          .length
          .toDouble(),
      21: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 22)
          .length
          .toDouble(),
      22: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 23)
          .length
          .toDouble(),
      23: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 24)
          .length
          .toDouble(),
      24: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 25)
          .length
          .toDouble(),
      25: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 26)
          .length
          .toDouble(),
      26: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 27)
          .length
          .toDouble(),
      27: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 28)
          .length
          .toDouble(),
      28: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 29)
          .length
          .toDouble(),
      29: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 30)
          .length
          .toDouble(),
      30: spoutsStatsByMonth
          .where(
              (element) => element.isCompleted && element.startDate.day == 31)
          .length
          .toDouble(),
    };
  }

  Map<int, double> getSpoutStatsByYear() {
    final List spoutsStatsByYear = [];
    if (userProgress.spouts.isNotEmpty) {
      for (var spout in userProgress.spouts) {
        if (spout.startDate.year == currentDate.year) {
          spoutsStatsByYear.add(spout);
        }
      }
    }
    return {
      0: spoutsStatsByYear
          .where(
              (element) => element.isCompleted && element.startDate.month == 1)
          .length
          .toDouble(),
      1: spoutsStatsByYear
          .where(
              (element) => element.isCompleted && element.startDate.month == 2)
          .length
          .toDouble(),
      2: spoutsStatsByYear
          .where(
              (element) => element.isCompleted && element.startDate.month == 3)
          .length
          .toDouble(),
      3: spoutsStatsByYear
          .where(
              (element) => element.isCompleted && element.startDate.month == 4)
          .length
          .toDouble(),
      4: spoutsStatsByYear
          .where(
              (element) => element.isCompleted && element.startDate.month == 5)
          .length
          .toDouble(),
      5: spoutsStatsByYear
          .where(
              (element) => element.isCompleted && element.startDate.month == 6)
          .length
          .toDouble(),
      6: spoutsStatsByYear
          .where(
              (element) => element.isCompleted && element.startDate.month == 7)
          .length
          .toDouble(),
      7: spoutsStatsByYear
          .where(
              (element) => element.isCompleted && element.startDate.month == 8)
          .length
          .toDouble(),
      8: spoutsStatsByYear
          .where(
              (element) => element.isCompleted && element.startDate.month == 9)
          .length
          .toDouble(),
      9: spoutsStatsByYear
          .where(
              (element) => element.isCompleted && element.startDate.month == 10)
          .length
          .toDouble(),
      10: spoutsStatsByYear
          .where(
              (element) => element.isCompleted && element.startDate.month == 11)
          .length
          .toDouble(),
      11: spoutsStatsByYear
          .where(
              (element) => element.isCompleted && element.startDate.month == 12)
          .length
          .toDouble(),
    };
  }
}
