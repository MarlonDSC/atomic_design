part of 'local_theme_bloc.dart';

abstract class LocalThemeState extends Equatable {
  final Palette palette;

  bool get isLightPalette => palette is LightPalette;

  const LocalThemeState({required this.palette});

  @override
  List<Object> get props => [palette];
}

class LoadedTheme extends LocalThemeState {
  const LoadedTheme({required super.palette});
}

class LoadingTheme extends LocalThemeState {
  const LoadingTheme({required super.palette});
}
