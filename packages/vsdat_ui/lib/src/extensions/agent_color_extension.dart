import 'dart:ui';

import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:material_ui/material_ui.dart';
import 'package:valorant_agents/valorant_agents.dart';

extension AgentColorExtension on Agent {
  Color get color {
    return switch (name.toLowerCase()) {
      'astra' => const Color(0xFFA545CD),
      'breach' => const Color(0xFFED9A44),
      'brimstone' => const Color(0xFF8C8C8C),
      'chamber' => const Color(0xFF41749D),
      'clove' => const Color(0xFFE7A7F7),
      'cypher' => const Color(0xFFBDA18E),
      'deadlock' => const Color(0xFF2BA4E6),
      'fade' => const Color(0xFF363635),
      'gekko' => const Color(0xFFCDDF4B),
      'harbor' => const Color(0xFF3E69B6),
      'iso' => const Color(0xFF6F5FFB),
      'jett' => const Color(0xFF78BEC7),
      'kayo' || 'kay/o' => const Color(0xFF3E50EB),
      'killjoy' => const Color(0xFFFFFBC1),
      'miks' => const Color(0xFF98DBC0),
      'neon' => const Color(0xFFC8FFFF),
      'omen' => const Color(0xFF7659CF),
      'phoenix' => const Color(0xFFEA6B66),
      'raze' => const Color(0xFFFDCD6B),
      'reyna' => const Color(0xFFED43E7),
      'sage' => const Color(0xFF56CAB4),
      'skye' => const Color(0xFF84FFB3),
      'sova' => const Color(0xFF4471F0),
      'tejo' => const Color(0xFFFFCA72),
      'veto' => const Color(0xFF5CC6EB),
      'viper' => const Color(0xFF8DD953),
      'vyse' => const Color(0xFF817DDF),
      'waylay' => const Color(0xFFE3F997),
      'yoru' => const Color(0xFF5FA6EC),
      _ => const Color(0xFFABCDEF),
    };
  }

  Color get borderColor {
    return _agentBorderColors[name.toLowerCase()] ?? color.variant;
  }
}

extension ColorToneVariantExtension on Color {
  /// Returns a tonal variant of the [Color]. May change chroma as well for more
  /// vibrancy for certain colors.
  Color get variant {
    final hctColor = Hct.fromInt(toARGB32());
    if (hctColor.tone > 50) {
      hctColor.tone -= 15;
      if (hctColor.tone > 70) {
        hctColor.chroma += 30;
      }
      return Color(hctColor.toInt());
    }
    hctColor.tone += 15;
    if (hctColor.tone < 30) {
      hctColor.chroma += 30;
    }
    return Color(hctColor.toInt());
  }
}

final _agentBorderColors = <String, Color>{
  for (final agent in Agents.defaultRoster)
    agent.name.toLowerCase(): agent.color.variant,
  'kayo': Agent.kayo.color.variant,
};
