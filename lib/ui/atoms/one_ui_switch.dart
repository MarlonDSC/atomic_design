import 'package:atomic_design/features/app/presentation/bloc/local_theme/local_theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneUISwitch extends StatefulWidget {
  final bool value;
  final void Function(bool)? onChanged;

  const OneUISwitch({super.key, required this.value, required this.onChanged});
  @override
  State<OneUISwitch> createState() => _OneUISwitchState();
}

class _OneUISwitchState extends State<OneUISwitch> {
  bool _isDisabled = false;

  @override
  void initState() {
    _isDisabled = widget.value;
    super.initState();
  }

  void _toggleSwitch(bool value) {
    setState(() {
      _isDisabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalThemeBloc, LocalThemeState>(
      builder: (context, state) {
        return MaterialButton(
          shape: const CircleBorder(),
          onPressed: widget.onChanged != null
              ? () {
                  _toggleSwitch(!_isDisabled);
                  widget.onChanged!(_isDisabled);
                }
              : null,
          child: SizedBox(
            width: 38,
            height: 50,
            child: Stack(
              children: [
                AnimatedAlign(
                  alignment: _isDisabled
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  duration: const Duration(milliseconds: 180),
                  child: Container(
                    width: 38,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: _isDisabled
                          ? state.palette.switchColors.disabled
                          : state.palette.switchColors.enabled,
                    ),
                  ),
                ),
                AnimatedAlign(
                  alignment: _isDisabled
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  duration: const Duration(milliseconds: 180),
                  child: Container(
                    width: 22.5,
                    height: 22.5,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: state.palette.switchColors.toggle,
                        border: Border.all(
                            color: _isDisabled
                                ? state.palette.switchColors.disabled
                                : state.palette.switchColors.enabled,
                            width: 1.0)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
