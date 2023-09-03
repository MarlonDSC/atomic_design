import 'package:atomic_design/features/alarm/domain/entities/alarm.dart';

abstract class AlarmRepository {
  //API methods

  //Database methods
  Future<List<Alarm>> getSavedAlarms();

  Future<void> saveAlarm(Alarm alarm);

  Future<void> removeAlarm(Alarm alarm);
}
