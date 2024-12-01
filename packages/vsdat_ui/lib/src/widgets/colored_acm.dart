import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class ColoredAcm extends StatelessWidget {
  const ColoredAcm({
    required this.acm,
    this.textStyle,
    this.separator = '-',
    super.key,
  });

  final StylePoints acm;

  /// The [TextStyle] for the digits
  ///
  /// The Color property is overridden to use [ValColors].
  final TextStyle? textStyle;

  final String separator;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = textStyle ?? Theme.of(context).textTheme.titleLarge;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: acm.A,
            style: effectiveStyle?.copyWith(
              color: ValColors.aggro.of(
                context,
                inverse: true,
              ),
            ),
          ),
          TextSpan(
            text: separator,
            style: effectiveStyle,
          ),
          TextSpan(
            text: acm.C,
            style: effectiveStyle?.copyWith(
              color: ValColors.control.of(
                context,
                inverse: true,
              ),
            ),
          ),
          TextSpan(
            text: separator,
            style: effectiveStyle,
          ),
          TextSpan(
            text: acm.M,
            style: effectiveStyle?.copyWith(
              color: ValColors.midrange.of(
                context,
                inverse: true,
              ),
            ),
          ),
        ],
        style: effectiveStyle,
      ),
    );
  }
}
