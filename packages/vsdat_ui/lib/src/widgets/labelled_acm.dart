import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class LabelledAcm extends StatelessWidget {
  const LabelledAcm({
    required this.acm,
    this.isMain = false,
    super.key,
  });

  final StylePoints acm;
  final bool isMain;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatTile(
            style: Style.aggro,
            value: acm.aggro,
            isMain: isMain,
          ),
        ),
        Expanded(
          child: _StatTile(
            style: Style.control,
            value: acm.control,
            isMain: isMain,
          ),
        ),
        Expanded(
          child: _StatTile(
            style: Style.midrange,
            value: acm.midrange,
            isMain: isMain,
          ),
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.style,
    required this.value,
    this.isMain = false,
  });

  final Style style;
  final double value;
  final bool isMain;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isSmall = Breakpoints.small.isActive(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isSmall)
          Text(
            style.label.toUpperCase(),
            style: (isMain ? textTheme.titleLarge : textTheme.titleMedium)
                ?.responsive(context),
            maxLines: 1,
            overflow: TextOverflow.visible,
          ),
        Text(
          value.formatted,
          style: (isMain ? textTheme.displayLarge : textTheme.displayMedium)
              ?.copyWith(
                color: ValColors.style(style).of(context),
              )
              .responsive(context),
        ),
      ],
    );
  }
}
