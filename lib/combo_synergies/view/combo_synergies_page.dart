import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/combo_synergies/combo_synergies.dart';
import 'package:vsdat/matches/matches.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class ComboSynergiesPage extends StatelessWidget {
  const ComboSynergiesPage({required this.collectionName, super.key});

  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return SimpleProvider<String>(
      value: collectionName,
      child: Scaffold(
        appBar: AppBar(title: Text('$collectionName Agent Combo Synergies')),
        body: const ComboSynergiesTriangle(),
        drawer:
            context.showStandardDrawer
                ? null
                : ComboSynergiesFilterDrawer(collectionName: collectionName),
      ),
    );
  }
}

/// Requires [SimpleProvider] to provide the collectionName of matches
@visibleForTesting
class ComboSynergiesTriangle extends StatelessWidget {
  const ComboSynergiesTriangle({super.key});

  @override
  Widget build(BuildContext context) {
    final collectionName = context.getProperty<String>();
    return Row(
      children: [
        if (context.showStandardDrawer)
          ColoredBox(
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            child: ComboSynergiesFilterDrawer(collectionName: collectionName),
          ),
        Expanded(
          child: Stack(
            children: [
              TernaryPlotHoverInfo<ComboData>(
                maxItems: 10,
                builder: (
                  BuildContext context,
                  void Function(List<ComboData>) hoveredItemsChanged,
                ) {
                  return Consumer(
                    builder: (context, ref, child) {
                      final plotData = ref.watch(
                        comboSynergiesProvider(
                          collectionId: collectionName,
                        ).select((state) => state.plotData),
                      );
                      return StyleTriangle(
                        data: plotData,
                        onHover: hoveredItemsChanged,
                        builder: (comboData, _) {
                          return ComboAgentIndicator(comboData: comboData);
                        },
                      );
                    },
                  );
                },
                itemBuilder: (comboData) {
                  return HoveredSynergyStatCard(comboData: comboData);
                },
              ),
              const Positioned(top: 16, left: 16, child: AutoFilterButton()),
            ],
          ),
        ),
      ],
    );
  }
}

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
