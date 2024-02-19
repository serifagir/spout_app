class Spout {
  final int durationInMinutes;
  final DateTime startDate;

  Spout({
    required this.durationInMinutes,
    required this.startDate,
  });

  factory Spout.fromJson(Map<String, dynamic> json) {
    return Spout(
      durationInMinutes: json['durationInMinutes'],
      startDate: DateTime.parse(json['startDate']),
    );
  }
}
