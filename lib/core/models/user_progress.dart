import 'package:spout_app/core/models/spout.dart';

class UserProgress {
  List<Spout> spouts = [];

  int _completedSpouts = 0;
  int _completedSpoutsToday = 0;
  int _completedSpoutsThisWeek = 0;
  int _completedSpoutsThisMonth = 0;
  int _completedSpoutsThisYear = 0;

  int get completedSpouts => _completedSpouts;
  int get completedSpoutsToday => _completedSpoutsToday;
  int get completedSpoutsThisWeek => _completedSpoutsThisWeek;
  int get completedSpoutsThisMonth => _completedSpoutsThisMonth;
  int get completedSpoutsThisYear => _completedSpoutsThisYear;
}
