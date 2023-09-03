import 'package:atomic_design/core/usecases/usecase.dart';
import 'package:atomic_design/features/alarm/domain/entities/alarm.dart';
import 'package:atomic_design/features/alarm/domain/repository/alarm_repository.dart';

class GetSavedAlarmsUseCase implements UseCase<List<Alarm>, void> {
  final AlarmRepository _userRepository;
  GetSavedAlarmsUseCase(this._userRepository);

  @override
  Future<List<Alarm>> call({void params}) async {
    return _userRepository.getSavedAlarms();
  }
}
