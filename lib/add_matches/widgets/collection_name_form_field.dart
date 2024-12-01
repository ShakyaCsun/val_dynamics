import 'package:flutter/material.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:vsdat/l10n/l10n.dart';

class CollectionNameFormField extends StatelessWidget {
  const CollectionNameFormField({
    required this.onChanged,
    super.key,
    this.nameError,
  });

  final void Function(String value) onChanged;
  final NameInputError? nameError;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final errorText = switch (nameError) {
      null => null,
      NameInputError.empty => l10n.emptyMatchesCollectionNameError,
    };
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'VCT Champions Paris 2025',
        labelText: l10n.matchesCollectionNameLabel,
        errorText: errorText,
      ),
    );
  }
}
