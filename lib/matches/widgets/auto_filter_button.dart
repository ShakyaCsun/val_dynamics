import 'package:flutter/material.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

/// {@template auto_filter_button}
/// Filter Button that is automatically hidden and opens [NavigationDrawer]
/// {@endtemplate}
class AutoFilterButton extends StatelessWidget {
  /// {@macro auto_filter_button}
  const AutoFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final showStandardDrawer = context.showStandardDrawer;
    if (showStandardDrawer) {
      return const SizedBox.shrink();
    }
    return OutlinedButton.icon(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: const Icon(Icons.tune),
      label: Text(context.l10n.filters),
    );
  }
}
