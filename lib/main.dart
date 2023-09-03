import 'package:atomic_design/features/app/presentation/bloc/local_theme/local_theme_bloc.dart';
import 'package:atomic_design/injection_container.dart';
import 'package:atomic_design/ui/one_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalThemeBloc(),
        )
      ],
      child: const MaterialApp(
        title: 'Clock',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [for (final tabItem in TabNavigationItem.items) tabItem.page],
      ),
      bottomNavigationBar: OneUIBottomNavigationBar(
        currentIndex: _selectedIndex,
        items: TabNavigationItem.items
            .asMap()
            .entries
            .map((e) => OneUIBottomNavigationItem(
                  onPressed: () => _onItemTapped(e.key),
                  child: e.value.child,
                ))
            .toList(),
      ),
    );
  }
}
