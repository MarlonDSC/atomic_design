import 'dart:async';

import 'package:atomic_design/features/alarm/data/data_source/local/DAO/alarm_dao.dart';
import 'package:atomic_design/features/alarm/data/models/alarm_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@Database(version: 1, entities: [AlarmModel])
abstract class AppDatabase extends FloorDatabase {
  AlarmDao get alarmDao;
}
