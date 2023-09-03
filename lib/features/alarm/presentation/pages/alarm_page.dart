import 'package:atomic_design/features/alarm/presentation/components/organisms/alarm_card.dart';
import 'package:atomic_design/ui/one_ui.dart';

class AlarmPage extends StatelessWidget {
  final String title;
  const AlarmPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return OneUINestedScrollView(
      expandedWidget: Text(
        title,
        style: const TextStyle(fontSize: 30),
      ),
      collapsedWidget: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      boxDecoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(OneUIIcons.more),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(OneUIIcons.abAdd),
        ),
      ],
      sliverList: SliverList.separated(
        itemCount: 2,
        separatorBuilder: (context, index) => const SizedBox(
          height: 11,
        ),
        itemBuilder: (context, index) => const AlarmCard(),
      ),
    );
  }
}
