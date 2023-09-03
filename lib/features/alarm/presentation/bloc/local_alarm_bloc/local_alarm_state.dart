part of 'local_alarm_bloc.dart';

abstract class LocalAlarmState extends Equatable {
  final List<Alarm>? alarms;
  const LocalAlarmState({this.alarms});

  @override
  List<Object> get props => [alarms ?? []];
}

class LocalAlarmLoading extends LocalAlarmState {
  const LocalAlarmLoading();
}

class LocalAlarmLoaded extends LocalAlarmState {
  const LocalAlarmLoaded(List<Alarm> alarms) : super(alarms: alarms);
}

class LocalAlarmEmpty extends LocalAlarmState {
  final String? message;
  const LocalAlarmEmpty({this.message = 'No data'});
}
