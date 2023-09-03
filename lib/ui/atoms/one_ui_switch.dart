import 'package:flutter/material.dart';

class OneUISwitch extends StatefulWidget {
  final bool value;
  final void Function(bool)? onChanged;

  const OneUISwitch({super.key, required this.value, required this.onChanged});
  @override
  State<OneUISwitch> createState() => _OneUISwitchState();
}

class _OneUISwitchState extends State<OneUISwitch> {
  bool _isSwitched = false;

  @override
  void initState() {
    _isSwitched = widget.value;
    super.initState();
  }

  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const CircleBorder(),
      onPressed: widget.onChanged != null
          ? () {
              _toggleSwitch(!_isSwitched);
              widget.onChanged!(_isSwitched);
            }
          : null,
      child: SizedBox(
        width: 38,
        height: 50,
        child: Stack(
          children: [
            AnimatedAlign(
              alignment:
                  _isSwitched ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(milliseconds: 180),
              child: Container(
                width: 38,
                height: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: _isSwitched
                      ? Colors.grey[600]
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
            AnimatedAlign(
              alignment:
                  _isSwitched ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(milliseconds: 180),
              child: Container(
                width: 22.5,
                height: 22.5,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                        color: _isSwitched
                            ? Colors.grey
                            : Theme.of(context).colorScheme.primary,
                        width: 1.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
