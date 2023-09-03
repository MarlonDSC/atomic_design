import 'package:atomic_design/ui/one_ui.dart';

class AlarmCard extends StatelessWidget {
  const AlarmCard({super.key});

  @override
  Widget build(BuildContext context) {
    return OneUIContainer(
      height: 115,
      child: Row(
        children: [
          const Text('6:00 PM'),
          const Spacer(),
          OneUISwitch(
            value: true,
            onChanged: (value) {},
          ),
          const SizedBox(width: 200)
        ],
      ),
    );
  }
}
