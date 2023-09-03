import 'package:atomic_design/ui/one_ui.dart';
import 'package:atomic_design/features/alarm/presentation/pages/alarm_page.dart'
    as alarm;

class TabNavigationItem {
  final Widget page;
  final dynamic child;

  TabNavigationItem({
    required this.page,
    required this.child,
  }) : assert(child is String || child is SvgPicture);

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: const alarm.AlarmPage(
            title: 'Alarm',
          ),
          child: 'Alarm',
        ),
        TabNavigationItem(
          page: const WorldclockPage(
            title: 'World clock',
          ),
          child: 'World clock',
        ),
        TabNavigationItem(
          page: const StopwatchPage(
            title: 'Stopwatch',
          ),
          child: 'Stopwatch',
        ),
        TabNavigationItem(
          page: const TimerPage(
            title: 'Timer',
          ),
          child: 'Timer',
        ),
      ];
}
