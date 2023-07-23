import 'package:flutter/material.dart';
import 'package:atomic_design/ui/atoms/one_ui_bottom_navigation_item.dart';

class OneUIBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final List<OneUIBottomNavigationItem> items;
  const OneUIBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.items,
  }) : assert(items.length > 2);
  @override
  Widget build(BuildContext context) {
    items[currentIndex] = items[currentIndex].copyWith(isSelected: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items,
    );
  }
}
