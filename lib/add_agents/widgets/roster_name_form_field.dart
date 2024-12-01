import 'package:flutter/material.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:vsdat/l10n/l10n.dart';

class RosterNameFormField extends StatelessWidget {
  const RosterNameFormField({
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
      NameInputError.empty => l10n.emptyRosterNameError
    };
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Agents Patch 9.10',
        labelText: l10n.rosterNameLabel,
        errorText: errorText,
      ),
    );
  }
}
