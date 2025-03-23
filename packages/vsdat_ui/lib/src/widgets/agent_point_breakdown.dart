import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class AgentPointBreakdown extends StatelessWidget {
  const AgentPointBreakdown({required this.agent, super.key});

  final Agent agent;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (agent.validAbilityPoints)
                      const Icon(Icons.check, color: Colors.green),
                    Text(
                      agent.name.toUpperCase(),
                      style: textTheme.displayMedium?.responsive(
                        context,
                        scale: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: LabelledAcm(acm: agent.stylePoints, isMain: true),
            ),
          ],
        ),
        Expanded(child: AgentBreakdownBottom(agent: agent)),
      ],
    );
  }
}

class AgentBreakdownBottom extends StatefulWidget {
  const AgentBreakdownBottom({required this.agent, super.key});

  final Agent agent;

  @override
  State<AgentBreakdownBottom> createState() => _AgentBreakdownBottomState();
}

class _AgentBreakdownBottomState extends State<AgentBreakdownBottom> {
  late AgentAbility selectedAbility;

  @override
  void initState() {
    super.initState();
    selectedAbility = widget.agent.abilityOne;
  }

  @override
  void didUpdateWidget(covariant AgentBreakdownBottom oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.agent != widget.agent) {
      selectedAbility = widget.agent.abilityOne;
    }
  }

  @override
  Widget build(BuildContext context) {
    final agent = widget.agent;
    final textTheme = Theme.of(context).textTheme;
    final isSmall = Breakpoints.small.isActive(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!isSmall)
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child:
                  defaultAgentPortrait(
                    widget.agent.name,
                  )?.image(fit: BoxFit.fitHeight) ??
                  const _FallbackAgentPortrait(),
            ),
          ),
        AbilitiesIconColumn(
          agent: agent,
          selectedAbility: selectedAbility,
          onChanged: (ability) {
            setState(() {
              selectedAbility = ability;
            });
          },
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 16,
                    children: [
                      Center(
                        child: Text(
                          selectedAbility.name,
                          style: textTheme.displaySmall?.responsive(
                            context,
                            scale: 2,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      LabelledAcm(acm: selectedAbility.stylePoints),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: PointExplanations(ability: selectedAbility),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AbilitiesIconColumn extends StatelessWidget {
  const AbilitiesIconColumn({
    required this.agent,
    required this.selectedAbility,
    required this.onChanged,
    super.key,
  });

  final Agent agent;
  final AgentAbility selectedAbility;
  final void Function(AgentAbility ability) onChanged;

  @override
  Widget build(BuildContext context) {
    final Agent(
      :name,
      :abilityOne,
      :abilityTwo,
      :abilityThree,
      :ultimateAbility,
    ) = agent;
    final abilities = [abilityOne, abilityTwo, abilityThree, ultimateAbility];
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final ability in abilities)
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: IconButton.outlined(
                padding: const EdgeInsets.all(12),
                onPressed: () {
                  onChanged(ability);
                },
                isSelected: ability == selectedAbility,
                selectedIcon: AbilityIcon(
                  ability: ability,
                  agentName: name,
                  foregroundColor: colorScheme.onPrimary,
                ),
                icon: AbilityIcon(
                  ability: ability,
                  agentName: name,
                  foregroundColor: colorScheme.onSurface,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class PointExplanations extends StatelessWidget {
  const PointExplanations({required this.ability, super.key});

  final AgentAbility ability;

  StylePoints get acm => ability.stylePoints;
  bool get hasCorrectNumberOfReasons {
    return acm.isIntegerPoints && acm.total.toInt() == ability.reasons.length;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineSmall;
    final reasons = ability.reasons.map((e) => '- $e').toList();
    var children = <Widget>[
      for (final reason in reasons) Text(reason, style: textStyle),
    ];
    if (hasCorrectNumberOfReasons) {
      final styleColors = <Color>[
        for (final style in Style.values)
          ...List<Color>.generate(
            acm.getStylePoint(style).toInt(),
            (_) => ValColors.style(style).of(context),
          ),
      ];
      children = [
        for (final (i, reason) in reasons.indexed)
          Text(reason, style: textStyle?.copyWith(color: styleColors[i])),
      ];
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: children,
    );
  }
}

class AbilityIcon extends StatelessWidget {
  const AbilityIcon({
    required this.ability,
    required this.agentName,
    required this.foregroundColor,
    this.size = 40,
    super.key,
  });

  final String agentName;
  final AgentAbility ability;
  final double size;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    Widget buildAbilityIcon(
      AssetGenImage? icon, {
      required String fallbackName,
    }) {
      return icon?.image(height: size, width: size, color: foregroundColor) ??
          CircleAvatar(radius: size / 2, child: Text(fallbackName));
    }

    return switch (ability) {
      AbilityOne() => buildAbilityIcon(
        defaultAbility1Icon(agentName),
        fallbackName: 'A1',
      ),
      AbilityTwo() => buildAbilityIcon(
        defaultAbility2Icon(agentName),
        fallbackName: 'A2',
      ),
      AbilityThree() => buildAbilityIcon(
        defaultAbility3Icon(agentName),
        fallbackName: 'A3',
      ),
      UltimateAbility() => buildAbilityIcon(
        defaultUltimateIcon(agentName),
        fallbackName: 'U',
      ),
    };
  }
}

class _FallbackAgentPortrait extends StatelessWidget {
  const _FallbackAgentPortrait();

  @override
  Widget build(BuildContext context) {
    return Transform.flip(
      flipX: true,
      child: ValAssets.agents.jett.portrait.image(fit: BoxFit.fitHeight),
    );
  }
}
