import 'package:atomic_design/ui/foundations/tokens/colors.dart';

abstract class Palette {
  final ScaffoldColors scaffoldColors;
  final SwitchColors switchColors;
  final TextColors textColors;
  final CardColors cardColors;
  final ButtonColors buttonColors;

  Palette({
    required this.scaffoldColors,
    required this.switchColors,
    required this.textColors,
    required this.cardColors,
    required this.buttonColors,
  });
}

enum PaletteType { light }

Map<PaletteType, Palette> palettes = {
  PaletteType.light: lightPalette,
};

Palette lightPalette = LightPalette(
  scaffoldColors: ScaffoldColors(
    primary: AppColors.kBlueLotus,
    background: AppColors.kWhiteSmoke,
  ),
  buttonColors: ButtonColors(
    background: AppColors.kBlueLotus,
    textColor: AppColors.kAquaHaze,
  ),
  cardColors: CardColors(
    background: AppColors.kSoapstone,
  ),
  switchColors: SwitchColors(
    enabled: AppColors.kBlueLotus,
    disabled: AppColors.kLemonGrass,
    toggle: AppColors.kSoapstone,
  ),
  textColors: TextColors(
    disabled: AppColors.kGrayCloud,
    error: AppColors.kPersianRed,
    primary: AppColors.kBlueLotus,
    secondary: AppColors.kCloudyGray,
  ),
);
