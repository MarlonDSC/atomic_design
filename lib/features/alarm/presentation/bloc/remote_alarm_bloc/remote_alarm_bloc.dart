import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'remote_alarm_event.dart';
part 'remote_alarm_state.dart';

class RemoteAlarmBloc extends Bloc<RemoteAlarmEvent, RemoteAlarmState> {
  RemoteAlarmBloc() : super(RemoteAlarmInitial()) {
    on<RemoteAlarmEvent>((event, emit) {});
  }
}
