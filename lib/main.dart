import 'package:atomic_design/one_ui_nested_scroll_view.dart';
import 'package:atomic_design/ui/foundations/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OneUINestedScrollView(
        expandedWidget: const Text(
          'Clock',
          style: TextStyle(fontSize: 30),
        ),
        collapsedWidget: const Text(
          'Clock',
          style: TextStyle(fontSize: 20),
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
      ),
    );
  }
}
