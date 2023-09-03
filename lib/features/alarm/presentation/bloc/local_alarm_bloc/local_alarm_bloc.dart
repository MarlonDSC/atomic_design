import 'package:atomic_design/features/alarm/domain/entities/alarm.dart';
import 'package:atomic_design/features/alarm/domain/usecases/get_saved_alarm.dart';
import 'package:atomic_design/features/alarm/domain/usecases/remove_alarm.dart';
import 'package:atomic_design/features/alarm/domain/usecases/save_alarm.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'local_alarm_event.dart';
part 'local_alarm_state.dart';

class LocalAlarmBloc extends Bloc<LocalAlarmEvent, LocalAlarmState> {
  final GetSavedAlarmsUseCase _getSavedAlarmsUseCase;
  final SaveAlarmUseCase _saveAlarmUseCase;
  final RemoveAlarmUseCase _removeAlarmUseCase;
  LocalAlarmBloc(
    this._getSavedAlarmsUseCase,
    this._saveAlarmUseCase,
    this._removeAlarmUseCase,
  ) : super(const LocalAlarmLoading()) {
    on<LocalAlarmEvent>((event, emit) {
      on<GetSavedAlarms>(onGetSavedAlarms);
      on<RemoveAlarm>(onRemoveAlarm);
      on<SaveAlarm>(onSaveAlarm);
    });
  }

  void onGetSavedAlarms(
      GetSavedAlarms event, Emitter<LocalAlarmState> emit) async {
    emit(const LocalAlarmLoading());
    List<Alarm> alarms = await _getSavedAlarmsUseCase.call();
    if (alarms.isEmpty) {
      emit(const LocalAlarmEmpty());
    } else {
      emit(LocalAlarmLoaded(alarms));
    }
  }

  void onRemoveAlarm(RemoveAlarm event, Emitter<LocalAlarmState> emit) async {
    emit(const LocalAlarmLoading());
    await _removeAlarmUseCase.call(params: event.alarm);
    add(const GetSavedAlarms());
  }

  void onSaveAlarm(SaveAlarm event, Emitter<LocalAlarmState> emit) async {
    emit(const LocalAlarmLoading());
    await _saveAlarmUseCase.call(params: event.alarm);
    add(const GetSavedAlarms());
  }
}
