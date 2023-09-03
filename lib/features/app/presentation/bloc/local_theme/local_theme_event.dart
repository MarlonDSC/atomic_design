part of 'local_theme_bloc.dart';

abstract class LocalThemeEvent extends Equatable {
  const LocalThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends LocalThemeEvent {
  final PaletteType paletteType;

  const ChangeTheme(this.paletteType);
}
