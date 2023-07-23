import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OneUIBottomNavigationItem extends StatelessWidget {
  final dynamic child;
  final bool isSelected;
  final void Function()? onPressed;
  const OneUIBottomNavigationItem({
    super.key,
    this.child,
    this.isSelected = false,
    required this.onPressed,
  }) : assert(child is String || child is SvgPicture);

  OneUIBottomNavigationItem copyWith({
    Key? key,
    dynamic child,
    bool? isSelected,
    void Function()? onPressed,
  }) =>
      OneUIBottomNavigationItem(
        key: key ?? this.key,
        child: child ?? this.child,
        isSelected: isSelected ?? this.isSelected,
        onPressed: onPressed ?? this.onPressed,
      );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child is String
          ? Text(
              child,
              style: isSelected
                  ? const TextStyle(
                      color: Colors.transparent,
                      shadows: [
                        Shadow(offset: Offset(0, -3)),
                      ],
                      decorationThickness: 3,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                    )
                  : const TextStyle(
                      color: Colors.transparent,
                      shadows: [
                        Shadow(offset: Offset(0, -3)),
                      ],
                    ),
            )
          : child,
    );
  }
}
