import 'package:shared_preferences/shared_preferences.dart';
import 'package:spout_app/core/models/spout.dart';

class UserProgress {
  String username;
  int id;
  List<Spout> spouts;
  int completedSpouts;

  UserProgress(
      {required this.username,
      required this.id,
      required this.spouts,
      required this.completedSpouts});

  toMap() {
    return {
      'username': username,
      'id': id,
      'spouts': spouts,
      'completedSpouts': completedSpouts
    };
  }

  // List<Spout> spouts = [
  //   Spout(durationInMinutes: 25, isCompleted: true, startDate: DateTime.now()),
  //   Spout(durationInMinutes: 25, isCompleted: true, startDate: DateTime.now()),
  //   Spout(durationInMinutes: 25, isCompleted: true, startDate: DateTime.now()),
  //   Spout(
  //       durationInMinutes: 25,
  //       isCompleted: true,
  //       startDate: DateTime.now().subtract(const Duration(hours: 1))),
  //   Spout(
  //       durationInMinutes: 25,
  //       isCompleted: true,
  //       startDate: DateTime.now().subtract(const Duration(hours: 2))),
  //   Spout(
  //       durationInMinutes: 25,
  //       isCompleted: true,
  //       startDate: DateTime.now().subtract(const Duration(hours: 16))),
  //   Spout(
  //       durationInMinutes: 25,
  //       isCompleted: true,
  //       startDate: DateTime.now().add(const Duration(hours: 1))),
  //   Spout(
  //       durationInMinutes: 25,
  //       isCompleted: true,
  //       startDate: DateTime.now().add(const Duration(hours: 2))),
  //   Spout(
  //       durationInMinutes: 25,
  //       isCompleted: true,
  //       startDate: DateTime.now().add(const Duration(hours: 3))),
  // ];
  // int _completedSpouts = 0;
  // int _completedSpoutsToday = 0;
  // int _completedSpoutsThisWeek = 0;
  // int _completedSpoutsThisMonth = 0;
  // int _completedSpoutsThisYear = 0;

  // int get completedSpouts => _completedSpouts;
  // int get completedSpoutsToday => _completedSpoutsToday;
  // int get completedSpoutsThisWeek => _completedSpoutsThisWeek;
  // int get completedSpoutsThisMonth => _completedSpoutsThisMonth;
  // int get completedSpoutsThisYear => _completedSpoutsThisYear;
}
