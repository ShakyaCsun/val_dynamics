import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class ImportJsonButton extends StatelessWidget {
  const ImportJsonButton({
    required this.onFilePicked,
    required this.inputFile,
    super.key,
  });

  final void Function(XFile? file) onFilePicked;
  final FileInput inputFile;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final selectedFileName = inputFile.value?.name;
    Widget text = Text(l10n.selectJsonFile);
    if (inputFile.displayError != null) {
      text = Text(
        l10n.selectJsonFilePlease,
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      );
    }
    if (selectedFileName != null) {
      text = Text(selectedFileName);
    }
    return Row(
      spacing: getBreakpointOf(context).padding,
      children: [
        text,
        FilledButton(onPressed: _onTap, child: Text(l10n.importAgentsJson)),
      ],
    );
  }

  Future<void> _onTap() async {
    onFilePicked(await openFile(acceptedTypeGroups: [_jsonGroup]));
  }
}

const XTypeGroup _jsonGroup = XTypeGroup(
  label: 'json',
  extensions: ['json', 'txt'],
);
