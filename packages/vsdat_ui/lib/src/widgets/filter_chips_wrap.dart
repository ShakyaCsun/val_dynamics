import 'package:flutter/material.dart';

class FilterChipsWrap<T> extends StatelessWidget {
  const FilterChipsWrap({
    required this.options,
    required this.isSelected,
    required this.onSelect,
    required this.labelFor,
    super.key,
  });

  final List<T> options;
  final bool Function(T option) isSelected;
  final void Function(T option) onSelect;
  final String Function(T option) labelFor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final option in options)
          FilterChip(
            label: Text(labelFor(option)),
            onSelected: (_) {
              return onSelect(option);
            },
            selected: isSelected(option),
          ),
      ],
    );
  }
}
