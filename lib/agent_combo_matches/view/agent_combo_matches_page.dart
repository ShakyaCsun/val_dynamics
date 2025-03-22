import 'package:flutter/material.dart';

class AgentComboMatchesPage extends StatelessWidget {
  const AgentComboMatchesPage({
    required this.collectionName,
    required this.comboName,
    super.key,
  });

  final String collectionName;
  final String comboName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$collectionName Matches for $comboName')),
    );
  }
}
