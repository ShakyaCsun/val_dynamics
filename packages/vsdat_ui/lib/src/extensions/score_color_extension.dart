import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

extension ScoreColorExtension on Score {
  Color get color {
    if (this == Score.zero || scoreType == ScoreType.tied) {
      return ValColors.tiedWR;
    }
    if (winRate < 0.5) {
      return ValColors.negativeTween.transform(1 - (winRate * 2))!;
    }

    return ValColors.positiveTween.transform((winRate - 0.5) * 2)!;
  }
}

extension OnColorExtension on Color {
  /// Returns black or white color based on estimated brightness of the [Color].
  Color get onColor {
    return switch (ThemeData.estimateBrightnessForColor(this)) {
      Brightness.dark => const Color(0xFFF2F2F2),
      Brightness.light => const Color(0xFF1F1F1F),
    };
  }
}
