import 'package:flutter/material.dart';
import 'package:test_inner_shadows/styles/component_styles.dart';

class EmbossedSwitch extends StatefulWidget {
  final Function(bool)? onChanged;
  final bool isOn;
  final Size size;
  final Duration duration;
  final double borderRadius;

  const EmbossedSwitch({
    super.key,
    required this.onChanged,
    required this.isOn,
    this.size = const Size(40, 20),
    this.duration = const Duration(milliseconds: 100),
    this.borderRadius = 10,
  });

  @override
  State<EmbossedSwitch> createState() => _EmbossedSwitchState();
}

class _EmbossedSwitchState extends State<EmbossedSwitch> {
  late bool isOnValue;

  @override
  void initState() {
    isOnValue = widget.isOn;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isOnValue = !isOnValue);
        widget.onChanged?.call(isOnValue);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: AnimatedContainer(
          width: widget.size.width,
          height: widget.size.height,
          duration: widget.duration,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: embossedSwitchInnerShadows(isOnValue),
          ),
          child: _Dot(
            diameter: widget.size.height,
            dotColor: widget.onChanged == null ? Colors.white60 : Colors.white,
            duration: widget.duration,
            isOn: isOnValue,
            borderRadius: widget.borderRadius,
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final double diameter;
  final Color dotColor;
  final Duration duration;
  final bool isOn;
  final double borderRadius;

  const _Dot({
    required this.diameter,
    required this.dotColor,
    required this.duration,
    required this.isOn,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: diameter + diameter * 0.7,
        height: diameter,
        child: AnimatedAlign(
          duration: duration,
          alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: diameter - (0.3 * diameter),
            height: diameter - (0.3 * diameter),
            decoration: BoxDecoration(
              color: dotColor,
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: embossedSwitchDotShadow(),
            ),
          ),
        ),
      ),
    );
  }
}
