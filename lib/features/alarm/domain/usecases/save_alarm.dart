import 'package:atomic_design/core/usecases/usecase.dart';
import 'package:atomic_design/features/alarm/domain/entities/alarm.dart';
import 'package:atomic_design/features/alarm/domain/repository/alarm_repository.dart';

class SaveAlarmUseCase implements UseCase<void, Alarm> {
  final AlarmRepository _userRepository;
  SaveAlarmUseCase(this._userRepository);

  @override
  Future<void> call({Alarm? params}) async {
    return _userRepository.saveAlarm(params!);
  }
}
