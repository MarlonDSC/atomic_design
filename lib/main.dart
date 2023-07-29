import 'package:atomic_design/ui/one_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
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
