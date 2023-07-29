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
      leadingIcon: IconButton(
        onPressed: () => {},
        icon: SvgPicture.asset(OneUIIcons.drawer),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(OneUIIcons.more),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(OneUIIcons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(OneUIIcons.abAdd),
        ),
      ],
      sliverList: SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(
          leading: SvgPicture.asset(OneUIIcons.contact),
          title: Text('Contact $index'),
        ),
      )),
    );
  }
}
