import 'package:atomic_design/ui/one_ui.dart';

class AlarmPage extends StatelessWidget {
  final String title;
  const AlarmPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Alarm'),
    );
  }
}
