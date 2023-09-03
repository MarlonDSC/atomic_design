import 'package:atomic_design/features/alarm/data/data_source/local/app_database.dart';
import 'package:atomic_design/features/alarm/data/models/alarm_model.dart';
import 'package:atomic_design/features/alarm/domain/entities/alarm.dart';
import 'package:atomic_design/features/alarm/domain/repository/alarm_repository.dart';

class AlarmRepositoryImpl implements AlarmRepository {
  final AppDatabase _appDatabase;
  AlarmRepositoryImpl(this._appDatabase);
  @override
  Future<List<AlarmModel>> getSavedAlarms() async {
    return _appDatabase.alarmDao.getAlarms();
  }

  @override
  Future<void> removeAlarm(Alarm alarm) async {
    return _appDatabase.alarmDao.deleteAlarm(AlarmModel.fromEntity(alarm));
  }

  @override
  Future<void> saveAlarm(Alarm alarm) async {
    return _appDatabase.alarmDao.insertAlarm(AlarmModel.fromEntity(alarm));
  }
}
