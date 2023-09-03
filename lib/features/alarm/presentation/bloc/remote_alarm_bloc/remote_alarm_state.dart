part of 'remote_alarm_bloc.dart';

abstract class RemoteAlarmState extends Equatable {
  const RemoteAlarmState();
  
  @override
  List<Object> get props => [];
}

class RemoteAlarmInitial extends RemoteAlarmState {}
