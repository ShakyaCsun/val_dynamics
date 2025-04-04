import 'package:flutter/material.dart';

class SortableTableHeader extends StatelessWidget {
  const SortableTableHeader({
    required this.label,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool selected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: Theme.of(context).textTheme.labelLarge),
            if (selected) const Icon(Icons.arrow_downward),
          ],
        ),
      ),
    );
  }
}
