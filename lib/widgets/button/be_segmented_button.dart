import 'package:flutter/material.dart';

class BEButtonSegment<T> {
  final T value;
  final String text;

  const BEButtonSegment({
    required this.value,
    required this.text,
  });
}

class BESegmentedButton<T> extends StatelessWidget {
  final OutlinedBorder? shape;
  final Color? color;
  final Color? selectedBackgroundColor;
  final List<BEButtonSegment<T>> segments;
  final Set<T> selected;
  final void Function(Set<T>)? onSelectionChanged;

  const BESegmentedButton({
    super.key,
    this.shape,
    this.color,
    this.selectedBackgroundColor,
    required this.segments,
    required this.selected,
    this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<T>(
      segments: <ButtonSegment<T>>[
        for (BEButtonSegment<T> segment in segments)
          ButtonSegment(
            value: segment.value,
            label: Text(
              segment.text,
            ),
          ),
      ],
      selected: selected,
      onSelectionChanged: onSelectionChanged,
      showSelectedIcon: false,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(shape),
        backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return selectedBackgroundColor ?? const Color(0xff178aed);
          } else {
            return Colors.white.withOpacity(0.1);
          }
        }),
        foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (color != null) return color;
          if (states.contains(MaterialState.selected)) {
            return Colors.white;
          } else {
            return const Color(0xff26c6f2);
          }
        }),
        side: MaterialStateProperty.all(BorderSide(
          color: Colors.white.withOpacity(0.08),
          width: 1,
        )),
      ),
    );
  }
}
