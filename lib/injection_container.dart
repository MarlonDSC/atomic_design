import 'package:atomic_design/features/alarm/data/alarm_repository_impl.dart';
import 'package:atomic_design/features/alarm/data/data_source/local/app_database.dart';
import 'package:atomic_design/features/alarm/domain/repository/alarm_repository.dart';
import 'package:atomic_design/features/alarm/domain/usecases/get_saved_alarm.dart';
import 'package:atomic_design/features/alarm/domain/usecases/remove_alarm.dart';
import 'package:atomic_design/features/alarm/domain/usecases/save_alarm.dart';
import 'package:atomic_design/features/alarm/presentation/bloc/local_alarm_bloc/local_alarm_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('alarm_database').build();

  sl.registerSingleton<AppDatabase>(database);
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<AlarmRepository>(AlarmRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetSavedAlarmsUseCase>(GetSavedAlarmsUseCase(sl()));
  sl.registerSingleton<SaveAlarmUseCase>(SaveAlarmUseCase(sl()));
  sl.registerSingleton<RemoveAlarmUseCase>(RemoveAlarmUseCase(sl()));

  //Blocs
  sl.registerFactory<LocalAlarmBloc>(() => LocalAlarmBloc(sl(), sl(), sl()));
}
