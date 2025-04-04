import 'package:flutter/widgets.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class ValColors {
  const ValColors._();

  static const aggro = ThemedColor(Color(0xFFCB2F24), Color(0xFFF95C5C));
  static const control = ThemedColor(Color(0xFF178FC7), Color(0xFF2BA3E6));
  static const midrange = ThemedColor(Color(0xFF2C9E22), Color(0xFF24E8B0));

  static const tiedWR = Color(0xFFFFD573);

  static final positiveTween = ColorTween(
    begin: const Color(0xFFDBFA41),
    end: const Color(0xFF007A1B),
  ).chain(CurveTween(curve: Curves.decelerate));

  static final negativeTween = ColorTween(
    begin: const Color(0xFFFFA571),
    end: const Color(0xFF760002),
  ).chain(CurveTween(curve: Curves.decelerate));

  static const winningScore = Color(0xFF61B875);

  static ThemedColor style(Style style) {
    return switch (style) {
      Style.aggro => aggro,
      Style.control => control,
      Style.midrange => midrange,
    };
  }
}
