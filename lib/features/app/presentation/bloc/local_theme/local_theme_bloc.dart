import 'package:atomic_design/ui/one_ui.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'local_theme_event.dart';
part 'local_theme_state.dart';

class LocalThemeBloc extends Bloc<LocalThemeEvent, LocalThemeState> {
  LocalThemeBloc()
      : super(
          LoadedTheme(palette: palettes[PaletteType.light]!),
        ) {
    on<ChangeTheme>((event, emit) {
      emit(LoadingTheme(palette: state.palette));
      emit(LoadedTheme(palette: palettes[event.paletteType]!));
    });
  }
}
