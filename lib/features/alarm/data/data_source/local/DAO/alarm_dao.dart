import 'package:atomic_design/features/alarm/data/models/alarm_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class AlarmDao {
  @Insert()
  Future<void> insertAlarm(AlarmModel alarm);

  @delete
  Future<void> deleteAlarm(AlarmModel alarm);

  @Query('SELECT * FROM alarm')
  Future<List<AlarmModel>> getAlarms();
}
