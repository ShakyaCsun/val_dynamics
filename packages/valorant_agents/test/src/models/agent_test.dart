import 'package:test/test.dart';
import 'package:valorant_agents/valorant_agents.dart';

final knownAgentBreakdowns = <Agent>{
  Agent.astra,
  Agent.clove,
  Agent.deadlock,
  Agent.harbor,
  Agent.iso,
  Agent.miks,
  Agent.neon,
  Agent.omen,
  Agent.phoenix,
  Agent.raze,
  Agent.sage,
  Agent.tejo,
  Agent.veto,
  Agent.viper,
  Agent.vyse,
  Agent.waylay,
  Agent.yoru,
};

void main() {
  group('Agent', () {
    test('.validAbilitiesPoints', () {
      expect(
        knownAgentBreakdowns.map((e) {
          return e.validAbilityPoints;
        }).toList(),
        equals(List<bool>.generate(knownAgentBreakdowns.length, (_) => true)),
      );
    });
  });
}
