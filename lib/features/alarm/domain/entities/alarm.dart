class Alarm {
  final int id;
  final String time;
  final bool isEnabled;
  Alarm({
    required this.id,
    required this.time,
    required this.isEnabled,
  });

  Alarm copyWith({
    int? id,
    String? time,
    bool? isEnabled,
  }) {
    return Alarm(
      id: id ?? this.id,
      time: time ?? this.time,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  Alarm toggle() {
    return Alarm(
      id: id,
      time: time,
      isEnabled: !isEnabled,
    );
  }
}
