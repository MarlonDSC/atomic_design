import 'package:atomic_design/core/usecases/usecase.dart';
import 'package:atomic_design/features/alarm/domain/entities/alarm.dart';
import 'package:atomic_design/features/alarm/domain/repository/alarm_repository.dart';

class RemoveAlarmUseCase implements UseCase<void, Alarm> {
  final AlarmRepository _userRepository;
  RemoveAlarmUseCase(this._userRepository);

  @override
  Future<void> call({Alarm? params}) async {
    return _userRepository.removeAlarm(params!);
  }
}
