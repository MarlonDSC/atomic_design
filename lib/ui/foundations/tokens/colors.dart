import 'package:atomic_design/ui/foundations/tokens/palette.dart';
import 'package:flutter/services.dart';

class AppColors {
  static const Color kBlueLotus = Color(0xFF5F63F0);
  static const Color kWhiteSmoke = Color(0xFFf6f6f6);
  static const Color kLemonGrass = Color(0xFF999999);
  static const Color kThunder = Color(0xFF303030);
  static const Color kCloudyGray = Color(0xFF696969);
  static const Color kGrayCloud = Color(0xFFB5B5B5);
  static const Color kSoapstone = Color(0xFFFCFCFC);
  static const Color kGreenWhite = Color(0xFFE8E8E8);
  static const Color kPersianRed = Color(0xFFCC2F28);
  static const Color kAquaHaze = Color(0xFFF2F3FA);
}

class ScaffoldColors {
  final Color primary;
  final Color background;

  ScaffoldColors({
    required this.primary,
    required this.background,
  });
}

class SwitchColors {
  final Color enabled;

  final Color disabled;

  SwitchColors({
    required this.enabled,
    required this.disabled,
  });
}

class TextColors {
  final Color primary;

  final Color secondary;

  final Color error;

  final Color disabled;

  TextColors({
    required this.primary,
    required this.secondary,
    required this.disabled,
    required this.error,
  });

  TextColors copyWith({
    Color? primary,
    Color? secondary,
    Color? error,
    Color? disabled,
  }) {
    return TextColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      disabled: disabled ?? this.disabled,
      error: error ?? this.error,
    );
  }
}

class CardColors {
  final Color background;

  CardColors({
    required this.background,
  });
}

class ButtonColors {
  final Color background;

  final Color textColor;

  ButtonColors({
    required this.background,
    required this.textColor,
  });
}

class LightPalette extends Palette {
  LightPalette({
    required super.scaffoldColors,
    required super.switchColors,
    required super.textColors,
    required super.cardColors,
    required super.buttonColors,
  });
}
