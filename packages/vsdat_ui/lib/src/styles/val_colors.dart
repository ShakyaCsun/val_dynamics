import 'package:flutter/widgets.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class ValColors {
  const ValColors._();

  static const aggro = ThemedColor(Color(0xFFCB2F24), Color(0xFFF95C5C));
  static const control = ThemedColor(Color(0xFF178FC7), Color(0xFF2BA3E6));
  static const midrange = ThemedColor(Color(0xFF2C9E22), Color(0xFF24E8B0));

  static const tiedWR = Color(0xFFFFD573);

  static final Animatable<Color?> positiveTween = ColorTween(
    begin: const Color(0xFFDBFA41),
    end: const Color(0xFF007A1B),
  ).chain(CurveTween(curve: Curves.decelerate));

  static final Animatable<Color?> negativeTween = ColorTween(
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

  static Color forStyleType(StyleType styleType) {
    return switch (styleType) {
      StyleType.heavyAggro => const Color(0xFFFF4040),
      StyleType.heavyControl => const Color(0xFF4040FF),
      StyleType.heavyMidrange => const Color(0xFF40FF40),
      StyleType.aggroSubControl => const Color(0xFFCC3380),
      StyleType.aggroSubMidrange => const Color(0xFFCC8033),
      StyleType.aggroSubHybrid => const Color(0xFFCC5959),
      StyleType.controlSubAggro => const Color(0xFF8033CC),
      StyleType.controlSubMidrange => const Color(0xFF3380CC),
      StyleType.controlSubHybrid => const Color(0xFF5959CC),
      StyleType.midrangeSubControl => const Color(0xFF33CC80),
      StyleType.midrangeSubAggro => const Color(0xFF80CC33),
      StyleType.midrangeSubHybrid => const Color(0xFF59CC59),
      StyleType.aggroControl => const Color(0xFFB31AB3),
      StyleType.controlMidrange => const Color(0xFF1AB3B3),
      StyleType.midrangeAggro => const Color(0xFFB3B31A),
      StyleType.center => const Color(0xFF808080),
    };
  }
}
