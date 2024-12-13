import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';

extension AgentColorExtension on Agent {
  Color get color {
    return switch (name.toLowerCase()) {
      'astra' => const Color(0xFF9E47CC),
      'breach' => const Color(0xFFEF9944),
      'brimstone' => const Color(0xFF8E8C8E),
      'chamber' => const Color(0xFF4A759A),
      'clove' => const Color(0xFFBC88C9),
      'cypher' => const Color(0xFFBDA18E),
      'deadlock' => const Color(0xFF2CA4E8),
      'fade' => const Color(0xFF313636),
      'gekko' => const Color(0xFFCDDF4B),
      'harbor' => const Color(0xFF3C66B1),
      'iso' => const Color(0xFF6254DE),
      'jett' => const Color(0xFF78BEC7),
      'kayo' || 'kay/o' => const Color(0xFF4A4FE1),
      'killjoy' => const Color(0xFFFFFBC1),
      'neon' => const Color(0xFFC8FFFF),
      'omen' => const Color(0xFF765ACA),
      'phoenix' => const Color(0xFFD05F5B),
      'raze' => const Color(0xFFFDCD6B),
      'reyna' => const Color(0xFFED43E7),
      'sage' => const Color(0xFF56CAB4),
      'skye' => const Color(0xFF80F9B6),
      'sova' => const Color(0xFF4068D8),
      'viper' => const Color(0xFF8DD952),
      'vyse' => const Color(0xFF817DDF),
      'yoru' => const Color(0xFF5FA6EC),
      _ => const Color(0xFFABCDEF),
    };
  }
}
