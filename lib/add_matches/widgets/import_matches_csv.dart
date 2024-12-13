import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class ImportCsvButton extends StatelessWidget {
  const ImportCsvButton({
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
    Widget text = Text(l10n.selectRibMatchesCsv);
    if (inputFile.displayError != null) {
      text = Text(
        l10n.pleaseSelectRibMatchesCsv,
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
        FilledButton(onPressed: _onTap, child: Text(l10n.importMatchesCsv)),
      ],
    );
  }

  Future<void> _onTap() async {
    onFilePicked(await openFile(acceptedTypeGroups: [_csvGroup]));
  }
}

const XTypeGroup _csvGroup = XTypeGroup(
  label: 'csv',
  extensions: ['csv', 'txt'],
);
