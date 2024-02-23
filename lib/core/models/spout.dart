class Spout {
  final int durationInMinutes;
  final DateTime startDate;
  bool isCompleted = false;

  Spout({
    required this.durationInMinutes,
    required this.startDate,
    required this.isCompleted,
  });

  factory Spout.fromJson(Map<String, dynamic> json) {
    return Spout(
      durationInMinutes: json['durationInMinutes'],
      startDate: DateTime.parse(json['startDate']),
      isCompleted: json['isCompleted'],
    );
  }
}
