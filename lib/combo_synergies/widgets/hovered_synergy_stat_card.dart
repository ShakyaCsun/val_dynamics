import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/combo_synergies/combo_synergies.dart';

class HoveredSynergyStatCard extends StatelessWidget {
  const HoveredSynergyStatCard({required this.comboData, super.key});

  final ComboData comboData;

  @override
  Widget build(BuildContext context) {
    final ComboData(
      agentOne: Agent(name: agentOne, stylePoints: acmOne),
      agentTwo: Agent(name: agentTwo, stylePoints: acmTwo),
      synergyStat: ComboSynergyStat(
        :oneWR,
        :twoWR,
        :comboWR,
        :synergyOne,
        :synergyTwo,
      ),
    ) = comboData;
    return Card.outlined(
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyLarge!,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                '${acmOne.acm} + ${acmTwo.acm}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Combo of $agentOne+$agentTwo wins '
                '$comboWR rounds(${comboWR.winRatePercent})',
              ),
              Text(
                '$agentOne NMRWR is ${oneWR.winRatePercent} so '
                'synergy with $agentTwo is ${synergyOne.asPercent}',
              ),
              Text(
                '$agentTwo NMRWR is ${twoWR.winRatePercent} so '
                'synergy with $agentOne is ${synergyTwo.asPercent}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
