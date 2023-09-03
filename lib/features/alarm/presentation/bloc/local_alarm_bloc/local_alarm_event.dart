part of 'local_alarm_bloc.dart';

abstract class LocalAlarmEvent extends Equatable {
  final Alarm? alarm;
  const LocalAlarmEvent({this.alarm});

  @override
  List<Object> get props => [];
}

class GetSavedAlarms extends LocalAlarmEvent {
  const GetSavedAlarms();
}

class SaveAlarm extends LocalAlarmEvent {
  const SaveAlarm(Alarm alarm) : super(alarm: alarm);
}

class RemoveAlarm extends LocalAlarmEvent {
  const RemoveAlarm(Alarm alarm) : super(alarm: alarm);
}
