import 'package:atomic_design/features/alarm/domain/entities/alarm.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'alarm', primaryKeys: ['id'])
class AlarmModel extends Alarm {
  AlarmModel({
    int? id,
    String? time,
    bool? isEnabled,
  }) : super(
            id: id ?? 0,
            time: time ?? DateTime.now().toIso8601String(),
            isEnabled: isEnabled ?? false);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'time': time,
      'enabled': isEnabled,
    };
  }

  factory AlarmModel.fromJson(dynamic map) {
    return AlarmModel(
      id: map['id'],
      time: map['time'],
      isEnabled: map['enabled'],
    );
  }

  factory AlarmModel.fromEntity(Alarm alarm) {
    return AlarmModel(
      id: alarm.id,
      time: alarm.time,
      isEnabled: alarm.isEnabled,
    );
  }
}
