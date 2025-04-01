import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class CopyJsonButton extends StatelessWidget {
  const CopyJsonButton({required this.minimalJson, super.key});

  final bool minimalJson;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Tooltip(
      message: minimalJson ? l10n.copyMinAgentsHelp : l10n.copyAgentsHelp,
      child: ElevatedButton(
        onPressed: () {
          _copyJson();
          context.showSnackbar(
            SnackBar(content: Text(l10n.agentsCopiedMessage)),
          );
        },
        child: Text(
          minimalJson ? l10n.copyMinAgentsSample : l10n.copyAgentsSample,
        ),
      ),
    );
  }

  void _copyJson() {
    final json = Agents.defaultRoster.toJson(minimal: minimalJson);
    final jsonStr = jsonEncode(json);
    Clipboard.setData(ClipboardData(text: jsonStr));
  }
}
